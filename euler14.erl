-module(euler14).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 14:
%% Find the longest sequence using a starting number under one million.

%% get the sequence length for N, use lookup table for previously
%% computed values (holy hell does this speed things up vs. bruteforce)

lenseq(1, _) -> 
    1;

lenseq(N, LookupTable) ->
    L = ets:lookup(LookupTable, N),
    case L of
        [] -> 
            NewN = case N rem 2 of
                       0 -> N div 2;
                       _ -> 3*N + 1
                   end,
            LengthN = 1 + lenseq(NewN, LookupTable),
            ets:insert(LookupTable, {N, LengthN}),
            LengthN;
        [{N,Len}] ->
            Len
    end.
        
%% find the longest, starting with 1

find_longest() ->
    find_longest(1, 1, 1, ets:new(lookup,[])).

%% find the longest chain given the current max

find_longest(N, Max, MaxN, _) when N >= 1000000 ->
    {MaxN, Max};

find_longest(N, Max, MaxN, LookupTable) ->
    Length = lenseq(N, LookupTable),
    case Length > Max of
        true ->
            erlang:display({N,Length}),
            find_longest(N+1, Length, N, LookupTable);
        _ -> 
            find_longest(N+1, Max, MaxN, LookupTable)
    end.

%% run problem 

go() ->
    find_longest().

