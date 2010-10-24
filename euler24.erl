-module(euler24).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 24:
%% What is the millionth lexicographic permutation of the digits
%% 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

%% lexicographic permuation

permute([]) -> 
    [[]];
permute(List) ->
    [[Head | Tail] ||
        Head <- List,
        Tail <- permute(List -- [Head])
    ].

%% run problem

go() ->
    lists:nth(1000000,permute("0123456789")).
