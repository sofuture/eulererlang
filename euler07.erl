-module(euler07).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

-import(primes).

%% Problem 07:
%% Find the 10001st prime
    
%% run problem, wild guess 10001st prime is < 1000000

go() ->
    N = 10001,
    lists:nth(N, primes:generatePrimes(1000000)).

