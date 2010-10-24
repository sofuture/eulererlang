-module(euler20).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 20:
%% Find the sum of digits in 100!

%% factorial duh

factorial(1) ->
    1;
factorial(N) ->
    N * factorial(N - 1).

%% sum digits of big number

sumdigits(N) when N < 10 ->
    N;
sumdigits(N) ->
    N rem 10 + sumdigits(N div 10).

%% run problem 

go() ->
    sumdigits(factorial(100)).
