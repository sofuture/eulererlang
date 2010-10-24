-module(euler21).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 21:
%% Evaluate the sum of all amicable pairs under 10000.

%% prime recursive calls to get list of factors

factors(N) ->
    factors(N, 2, N, [1]).

%% get list of factors

factors(_N, Current, Max, Results) when Current >= Max ->
    lists:usort(Results);
factors(N, Current, Max, Results) ->
    NewMax = trunc(N/Current),
    case N rem Current =:= 0 of
        true -> factors(N, Current+1, NewMax, [Current, NewMax|Results]);
        false -> factors(N, Current+1, Max,Results)
    end.

%% compute d(N) which is just the sum of factors

d(N) ->
    lists:sum(factors(N)).

%% run problem, sum all amicable numbers under 10k

go() ->
    lists:sum([X ||
        X <- lists:seq(1,10000),
        X =:= d(d(X)),
        X =/= d(X)
    ]).
        
