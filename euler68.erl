-module(euler68).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 68:
%% What is the maximum 16-digit string for a "magic" 5-gon ring?

%% lexicographic permute a list

permute([]) ->
    [[]];
permute(List) ->
    [[Head | Tail] ||
        Head <- List,
        Tail <- permute(List -- [Head])
    ].

%% solve problem

go() ->
    PotentialSolutions = 
    [[{A,B,C},{D,C,E},{F,E,G},{H,G,I},{J,I,B}] ||
        [A,B,C,D,E,F,G,H,I,J] <- permute(lists:seq(1,10)),
        A + B + C =:= D + C + E,
        A + B + C =:= F + E + G,
        A + B + C =:= H + G + I,
        A + B + C =:= J + I + B,

        %% must be 'named' from lowest number clockwise
        A =< D, A =< F, A =< H, A =< J,
        
        %% 16 digits means 10 can't be an inner number
        (A =:= 10) or (D =:= 10) or (F =:= 10) or (H =:= 10) or (J =:= 10)
    ],
    [Answer|_] = lists:reverse(PotentialSolutions),
    Answer.

 
