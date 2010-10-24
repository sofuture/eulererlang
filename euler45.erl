-module(euler45).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

trinumbers(N) ->
    [ (X * (X+1)) div 2 ||
        X <- lists:seq(1,N)
    ].

pentnumbers(N) ->
    [ (X * (3*X - 1)) div 2 ||
        X <- lists:seq(1,N)
    ].

hexnumbers(N) ->
    [ (X * (2*X - 1)) ||
        X <- lists:seq(1,N)
    ].

intersect([], _) -> [];
intersect([H|T], Set2) ->
    case lists:member(H, Set2) of
        true -> [H | intersect(T, Set2)];
        false -> intersect(T, Set2)
    end.

%% run problem

go() ->
    N = 90000,
    Tri = trinumbers(N),
    Pen = pentnumbers(N),
    Hex = hexnumbers(N),
    A = intersect(intersect(Tri,Pen),Hex),
    erlang:display(A).

