-module(euler25).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 25:
%% What is the first term in the Fibonacci sequence to contain 1000 digits?

%% tail fib to len(fib(N)) >= 1000

fib_to_len(A, B, N) ->
    Len = length(integer_to_list(A+B)),
    if
        Len >= 1000 -> {N,A+B};
        true -> fib_to_len(B, A+B, N+1)
    end.

%% run problem GOOOO

go() ->
    A = 1,
    B = 1,
    C = 3,
    fib_to_len(A, B, C).
