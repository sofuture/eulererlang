-module(euler16).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 16:
%% What is the sum of the digits of the number 2^1000?

%% get 2^1000

get2power() ->
    trunc(math:pow(2,1000)).

%% sum of digits

sumdigits(N) when N < 10 ->
    N;
sumdigits(N) ->
    N rem 10 + sumdigits(N div 10).

%% run problem 

go() ->
    sumdigits(get2power()).

