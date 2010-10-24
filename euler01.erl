-module(euler01).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 01:
%% Add all the natural numbers below one thousand 
%% that are multiples of 3 or 5.

%% test if X is a multiple of 3 or 5
%% (this is almost certainly a really 
%% silly way to do this)

mult3or5(X) ->
    if
        X rem 3 == 0 -> true;
        X rem 5 == 0 -> true;
        true -> false
    end.

%% run problem #1

go() ->
    A = 999,

    %% sum all X up to given ceiling that are
    %% multiple of 3 or 5

    lists:sum(
        [X || 
            X <- lists:seq(1,A), 
            mult3or5(X) == true
        ]).

