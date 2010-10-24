-module(euler30).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).
-compile(export_all).

%% test if sum of fifth powers of number digits equals number

equals_sum_digits(Number) ->
    Number =:= sum_digit_powers(Number).

%% sum fifth powers of digits

sum_digit_powers(Number) ->
    sum_digit_powers(Number, 0).

sum_digit_powers(0, SoFar) ->
    SoFar;
sum_digit_powers(Number, SoFar) ->
    Digit = Number rem 10,
    Power = Digit * Digit * Digit * Digit * Digit,
    Next = Number div 10,
    sum_digit_powers(Next, SoFar+Power).

%% run problem

go() ->
    lists:sum([X || 
        X <- lists:seq(2,1000000),
        equals_sum_digits(X) =:= true]).


