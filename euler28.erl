-module(euler28).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 28:
%% What is the sum of both diagonals in a 1001 by 1001 spiral?

%% sum the diagonals of square NxN

sum_diagonals(N) ->
    AllNums = lists:seq(2,N*N),
    just_diagonals(AllNums, 2, 0, 0).

%% peel all the corners out of the list
    
just_diagonals(List, _, _, SoFar) when List =:= [] ->
    SoFar + 1;

just_diagonals(List, StepSize, StepCount, SoFar) when StepCount =:= 4 ->
    just_diagonals(List, StepSize+2, 0, SoFar);

just_diagonals(List, StepSize, StepCount, SoFar) ->
    NextVal = SoFar + lists:nth(StepSize, List),
    NextList = lists:nthtail(StepSize, List),
    just_diagonals(NextList, StepSize, StepCount+1, NextVal).

%% run problem

go() ->
    sum_diagonals(1001).
