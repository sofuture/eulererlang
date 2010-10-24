-module(euler03).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 03:
%% Find the largest prime factor of a composite number

%% compute next prime factor

next_factor(0, _) -> 0;
next_factor(N, I) when I > (N div 2) ->
    N;
next_factor(N, I) ->
    case N rem I =:= 0 of
        true -> next_factor(N div I, I);
        _ -> next_factor(N, I+1)
    end.

%% run problem to find max prime factor
%% of our composite number

go() ->
       next_factor(600851475143,2).

