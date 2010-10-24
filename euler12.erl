-module(euler12).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 12:
%% What is the value of the first triangle number to
%% have over five hundred divisors?

%% get Nth triangle number

tri_number(N) ->
    Tri = lists:sum(lists:seq(1,N)),
    Num = num_divisors(Tri),
    {N, Tri, Num}.

%% get {N, Tri(N), NumDivisors(Tri(N)) for next number
    
get_next({LastN, Last, LastDivisors} = _) when LastDivisors >= 500 ->
    {LastN, Last, LastDivisors};
get_next({LastN, _Last , _LastDivisors} = _) ->
    get_next(tri_number(LastN + 1)).

%% get number of divisors for N

num_divisors(N) ->
    length(factors(N)).

%% prime recursive calls to get list of factors 

factors(N) -> 
    factors(N, 2, N, [1,N]).

%% get list of factors

factors(_N, Current, Max, Results) when Current >= Max -> 
    lists:usort(Results);
factors(N, Current, Max, Results) ->
    NewMax = trunc(N/Current),
    case N rem Current =:= 0 of
        true -> factors(N, Current+1, NewMax, [Current, NewMax|Results]);
        false -> factors(N, Current+1, Max,Results)
    end.

%% run problem 

go() ->
    get_next({1,1,1}).

