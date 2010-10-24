-module(euler08).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 08:
%% Discover the largest product of five consecutive 
%% digits in the 1000-digit number.

%% get starting number from datafile

get_number(FileName) ->
    [Number | _] = readfile(FileName),
    Number.

%% read file to string

readfile(FileName) ->
    case file:read_file(FileName) of
        {ok, Binary} ->
            string:tokens(erlang:binary_to_list(Binary), "\n");
        {error, _} ->
            "caught error"
    end.

%% peel all 5 digit subset products of our number into a list
%%
%% this method is really horrific and i want to rewrite if
%% for no other reason that to not actually display publically
%% that i've written something so abhorrent

get_5s(NumberList, SoFar) when length(NumberList) =< 4 ->
    SoFar;
get_5s(NumberList, SoFar) ->
    [StrA, StrB, StrC, StrD, StrE | _] = NumberList,
    A = list_to_integer([StrA]),
    B = list_to_integer([StrB]),
    C = list_to_integer([StrC]),
    D = list_to_integer([StrD]),
    E = list_to_integer([StrE]),
    [_ | Tail] = NumberList,
    get_5s(Tail, SoFar++[A * B * C * D * E]).

%% solve the problem, get the max

go() ->
    Number = get_number("euler08_data.txt"),
    lists:max(get_5s(Number,[])).
