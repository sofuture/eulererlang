-module(euler39).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

triangles(N) ->
    length([{A,B,C} ||
        A <- lists:seq(1,N-3),
        B <- lists:seq(A,N-2),
        C <- [trunc(math:sqrt(A*A+B*B))],
        A+B+C =:= N,
        A*A + B*B =:= C*C
    ]).

%% run problem

go() ->
    A = [{triangles(N), N} ||
        N <- lists:seq(20,1000),
        triangles(N) >= 3
    ],
    erlang:display(A).
