-module(euler96).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).


sum_top_3(Puzzle) ->
    [[A | _]|_] = Puzzle,
    erlang:display(A),
    [B, C, D | _Tail] = A,
    B * 100 + C * 10 + D.

solve(Puzzle) ->
    Puzzle.
   
solve_list(PuzzleList) ->
    solve_list(PuzzleList, []).

solve_list([], SolvedList) -> SolvedList;
solve_list(PuzzleList, SolvedList) ->
    [{grid, Puzzle} | Remaining] = PuzzleList,
    solve_list(Remaining, [solve(Puzzle)|SolvedList]).


line_to_list(Line) ->
    line_to_list(Line,[]).

line_to_list([], List) -> lists:reverse(List);
line_to_list(Line, List) ->
    [Head|Tail] = Line,
    IntVal = Head - $0,
    line_to_list(Tail, [IntVal | List]).


%% load puzzles from file

get_puzzles([], Puzzles) -> Puzzles;
get_puzzles(Lines, Puzzles) ->
    [_A,B,C,D,E,F,G,H,I,J|Tail] = Lines,
    get_puzzles(Tail, Puzzles ++ [{grid, [
        line_to_list(B),
        line_to_list(C), 
        line_to_list(D),
        line_to_list(E),
        line_to_list(F),
        line_to_list(G),
        line_to_list(H),
        line_to_list(I),
        line_to_list(J)] }]).

get_puzzles(Filename) ->
    Lines = get_lines(Filename),
    get_puzzles(Lines,[]).

get_lines(Filename) ->
    case file:read_file(Filename) of
        {ok, Binary} ->
            string:tokens(erlang:binary_to_list(Binary), "\r\n");
        {error, _} ->
            "caught error"
    end.

possib() ->
    [1,2,3,4,5,6,7,8,9].

get_row(Puzzle, Y) ->
    lists:nth(Y, Puzzle).

get_col(Puzzle, X) ->
    get_col(Puzzle, X, []).

get_col([], _X, SoFar) ->
    SoFar;
get_col(Puzzle, X, SoFar) ->
    [Row | Tail] = Puzzle,
    get_col(Tail, X, [lists:nth(X, Row) | SoFar]).

get_quad_coordinates(Quad) ->
    {OffsetX, OffsetY} = case Quad of
        1 -> {0, 0};
        2 -> {3, 0};
        3 -> {6, 0};
        4 -> {0, 3};
        5 -> {3, 3};
        6 -> {6, 3};
        7 -> {0, 6};
        8 -> {3, 6};
        9 -> {6, 6}
    end,
    [{X + OffsetX, Y + OffsetY} ||
        X <- lists:seq(1,3),
        Y <- lists:seq(1,3)].

get_coordinate_values(Puzzle, Coordinates) ->
    get_coordinate_values(Puzzle, Coordinates, []).

get_value(Puzzle, X, Y) ->
    lists:nth(X, lists:nth(Y, Puzzle)).

get_coordinate_values(_Puzzle, [], SoFar) ->
    SoFar;
get_coordinate_values(Puzzle, Coordinates, SoFar) ->
    [{X, Y}|Rest] = Coordinates,
    get_coordinate_values(Puzzle, Rest, [get_value(Puzzle, X, Y) | SoFar]).
    
get_quad(Puzzle, Quad) ->
    Coordinates = get_quad_coordinates(Quad),
    get_coordinate_values(Puzzle, Coordinates).

potentials(Puzzle, X, Y) ->
    Possib = possib(),
    Row = get_row(Puzzle, Y),
    Col = get_col(Puzzle, X),
    Qua = get_quad(Puzzle, quadrant(X, Y)),
    
    lists:subtract(Possib,
        lists:umerge([
            lists:sort(Row),
            lists:sort(Col),
            lists:sort(Qua)]
        )
    ).

set_value(Puzzle, X, Y, Value) ->
    [ [ if 
            XX =:= X, YY =:= Y ->
                Value;
            true ->
                get_value(Puzzle, XX, YY)
        end ||
        XX <- lists:seq(1, 9) ] || 
            YY <- lists:seq(1,9) ]. 
     
    
quadrant(X, Y) ->
    if 
        X =< 3, Y =< 3 -> 1;
        X =< 3, Y =< 6 -> 4;
        X =< 3 -> 7;
        X =< 6, Y =< 3 -> 2;
        X =< 6, Y =< 6 -> 5;
        X =< 6 -> 8;
        X =< 9, Y =< 3 -> 3;
        X =< 9, Y =< 6 -> 6;
        X =< 9 -> 9
    end.
        

go() ->
    Puzzles = get_puzzles("euler96_data.txt"),
    [P] = solve_list(Puzzles),

    erlang:display(P),
    erlang:display(set_value(P, 1, 1, 11)),
    erlang:display(set_value(P, 4, 4, 88)),
    erlang:display(set_value(P, 9, 9, 99)),
    ok.
%    [{X, Y, length(potentials(P, X, Y))} ||
%        X <- lists:seq(1,9),
%        Y <- lists:seq(1,9)].

    %P.
    %A = [1,2,3,0,5,6,7,8,0],
    %potentials(A).

