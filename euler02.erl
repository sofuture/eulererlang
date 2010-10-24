-module(euler02).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 02:
%% Find the sum of all the even-valued terms in the Fibonacci
%% sequence which do not exceed four million.

%% sum the last two items of given list

sum_last_two(List) ->
    [Head , Head2 | _Tail] = lists:reverse(List),
    Head + Head2.

%% construct list containing fibonacci sequence 
%% containing terms up to given max

list_fib_to(Max) ->
    list_fib_to(Max,[1,1]).

list_fib_to(Max,SoFar) ->
    Next = sum_last_two(SoFar),
    if 
        Next < Max -> list_fib_to(Max, SoFar++[Next]);
        true -> SoFar
    end.

%% run problem 

go() ->
    lists:sum(
        [X || X <- 
            list_fib_to(4000000),
            X rem 2 == 0
        ]).
        

