-module(euler04).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 04:
%% Find the largest palindrome made from the product
%% of two 3-digit numbers.

%% check if a number is a palindrome

is_palindrome(N) ->
    NasList = integer_to_list(N),
    NasList == lists:reverse(NasList).

%% generate list of palindromes that are
%% products of numbers between given floor
%% and ceiling

gen_palindromes(Start, End) ->
    [ A * B ||
        A <- lists:seq(Start, End),
        B <- lists:seq(Start, A),
        is_palindrome(A*B)
    ].

%% run problem, find max value in list

go() ->
    lists:max(gen_palindromes(100,999)).

