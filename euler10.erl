-module(euler10).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

-import(primes).

%% Problem 10:
%% Calculate the sum of all the primes below two million.
    
%% run problem, sum primes below 2 million

go() ->
    Max = 2000000,
    lists:sum(primes:generatePrimes(Max)).

