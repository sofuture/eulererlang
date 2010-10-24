-module(euler18).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 18:
%% Find the maximum sum travelling from the top of the triangle 
%% to the base.

%% collapse two rows of length n and n-1, where each element in 
%% the new list is the max sum available for each n-1 element
%% combined with adjacent neighbors on the n row
%%
%% i.e.     [5]   ->  [8] 
%%        [3, 1]

collapse_two_rows(Smaller, _Bottom, SoFar) when Smaller =:= [] ->
    SoFar;

collapse_two_rows(Smaller, Bottom, SoFar) ->
    [ Base | SmallTail ] = Smaller,
    [ A, B | BottomTail ] = Bottom,
    case A >= B of
        true -> 
            NextVal = Base + A;
        _ -> 
            NextVal = Base + B
    end,
    collapse_two_rows(SmallTail, [B]++BottomTail, SoFar++[NextVal]).

%% collapse subsequent rows from the bottom of the pyramid upwards
  
maxsum(Tri) when length(Tri) =:= 1 ->
    [ Head | _ ] = Tri,
    lists:max(Head);

maxsum(Tri) ->
    [ Last, SecondToLast | TriTail ] = Tri,
    NewBottom = collapse_two_rows(SecondToLast,Last, []),
    maxsum([NewBottom] ++ TriTail).

%% run problem 

go() ->
    Tri = [[75],
        [95,64],
        [17,47,82],
        [18,35,87,10],
        [20,4,82,47,65],
        [19,1,23,75,3,34],
        [88,2,77,73,7,63,67],
        [99,65,4,28,6,16,70,92],
        [41,41,26,56,83,40,80,70,33],
        [41,48,72,33,47,32,37,16,94,29],
        [53,71,44,65,25,43,91,52,97,51,14],
        [70,11,33,28,77,73,17,78,39,68,17,57],
        [91,71,52,38,17,14,91,43,58,50,27,29,48],
        [63,66,4,68,89,53,67,30,73,16,69,87,40,31],
        [4,62,98,27,23,9,70,98,73,93,38,53,60,4,23]],

    %% flip pyramid since we want to work bottom to top

    maxsum(lists:reverse(Tri)).
