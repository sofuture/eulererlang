-module(euler22).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 22:
%% What is the total of all the name scores in the file of first names?

%% valuize a name, prime the function

get_value(Name) ->
    get_value(0, Name).

%% valuize a given name

get_value(N, Name) when Name =:= [] ->
    N;

get_value(N, Name) ->
    [Head | Tail] = Name,
    ThisCharVal = Head - 64,
    get_value(ThisCharVal + N, Tail).

%% read file to list

get_name_list(FileName) ->
    case file:read_file(FileName) of
        {ok, Binary} ->
            string:tokens(erlang:binary_to_list(Binary), "\n");
        {error, _} ->
            "caught error"
    end.

%% value the whole list, prime the function

get_list_value(NameList) ->
    get_list_value(NameList, 0, 0).

%% value the whole list of names

get_list_value(NameList, _, SoFar) when NameList =:= [] ->
    SoFar;
    
get_list_value(NameList, Done, SoFar) ->
    [Head | Tail] = NameList,
    NewDone = Done + 1,
    get_list_value(Tail, NewDone, SoFar + NewDone * get_value(Head)).

%% run problem 

go() ->
    get_list_value(lists:sort(get_name_list("euler22_data.txt"))).
