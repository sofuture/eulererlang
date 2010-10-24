-module(euler15).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 15:
%% Starting in the top left corner in a 20 by 20 grid, how 
%% many routes are there to the bottom right corner?

noden(X, Y, Size, _) when (X =:= Size andalso Y =:= Size - 1)
                    orelse (X =:= Size - 1 andalso Y =:= Size) ->
    1;

noden(X, Y, Size, LookupTable) ->
    TableValue = ets:lookup(LookupTable, {X, Y}),
    case TableValue of
        [] ->
            Routes1 = 
                case X < Size of
                    true ->
                        noden(X + 1, Y, Size, LookupTable);
                    _ -> 0
                end,
            Routes2 = 
                case Y < Size of
                    true ->
                        noden(X, Y + 1, Size, LookupTable);
                    _ -> 0
                end,
            Routes = Routes1 + Routes2,
            ets:insert(LookupTable, {{X, Y}, Routes}),
            Routes;
        [{_, Routes}] -> Routes
    end.

%% run problem 

go() ->
    noden(1,1, 21, ets:new(lookup, [])).

