-module(euler23).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

-import(util).

%% Problem 23:
%% Find the sum of all the positive integers which cannot 
%% be written as the sum of two abundant numbers.


%% prime recursive calls to get list of factors

type(N) ->
    FactorSum = lists:sum(util:factors(N)),
    if
        FactorSum =:= N ->
            perfect;
        FactorSum >= N ->
            abundant;
        true ->
            deficient
    end.

is_abundant(N) ->
    type(N) =:= abundant.    

%% run problem, sum all 'sum of two abundant numbers' under
%%  max, sum all numbers total under max, subtract, tada

go() ->

    Max = 28123,

    Abundants = [ X ||
        X <- lists:seq(1,Max),
        is_abundant(X)
    ],

    erlang:display("Computed abundants..."),

    Summed = lists:usort([ X + Y ||
        X <- Abundants,
        Y <- Abundants,
        X + Y =< Max
    ]),

    lists:sum(lists:seq(1, Max)) - lists:sum(Summed).
        
