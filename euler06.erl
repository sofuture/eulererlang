-module(euler06).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 06:
%% What is the difference between the sum of the squares
%% and the square of the sums?

%% sum of squares up to given ceiling

sum_of_squares(N) ->
    lists:sum([ X*X ||
        X <- lists:seq(1,N)
    ]).

%% square of sum of terms up to given ceiling

square_of_sums(N) ->
    trunc( math:pow(
        lists:sum( [ X || X <- lists:seq(1,N) ] ),
        2
    )).

%% run problem, find difference

go() ->
    N = 100,
    square_of_sums(N) - sum_of_squares(N).

