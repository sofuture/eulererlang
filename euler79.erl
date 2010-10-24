-module(euler79).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

-compile(export_all).

%% Problem 79:
%% By analysing a user's login attempts, can you determine
%% the secret numeric passcode? 

%% read file to list of strings

readfile(FileName) ->
    case file:read_file(FileName) of
        {ok, Binary} ->
            string:tokens(erlang:binary_to_list(Binary), "\n");
        {error, _} ->
            "caught error"
    end.

%% convert an int into list of its digits

int_to_list(Integer) ->
    int_to_list(Integer, []).

int_to_list(0, SoFar) -> SoFar;
int_to_list(Integer, SoFar) ->
    int_to_list(Integer div 10, [Integer rem 10] ++ SoFar).

%% check to see if the given number could be used to select
%% all the valid combinations

is_valid(NumberList, TestValue) ->
    is_valid(NumberList, TestValue, true).

is_valid(_List, _TestValue, false) -> false;
is_valid([], _TestValue, SoFar) -> SoFar;
is_valid([First | Tail] = _NumberList, TestValue, _SoFar) ->
    Listified = int_to_list(First),
    is_valid(Tail, TestValue, test_match(Listified, TestValue)).

%% test to see if the specific required sequence could be selected
%% from the given source sequence

test_match(Required, Parsing) ->
    test_match(Required, Parsing, []).

test_match([], _Parsing, _SoFar) -> true;
test_match(_Required, [], _SoFar) -> false;
test_match([HeadReq | TailReq] = Required, 
           [HeadPar | TailPar] = _Parsing, SoFar) ->
    if
        HeadReq =:= HeadPar ->
            test_match(TailReq, TailPar, [HeadReq | SoFar]);
        true ->
            test_match(Required, TailPar, SoFar)
    end.

%% solve the problem, get the max

go() ->
    NumberList = [list_to_integer(X) || 
                    X <- readfile("euler79_data.txt")],

    Passwords = [ {A, B, C, D, E, F, G, H} ||
                    A <- lists:seq(0,9),
                    B <- lists:seq(0,9),
                    C <- lists:seq(0,9),
                    D <- lists:seq(0,9),
                    E <- lists:seq(0,9),
                    F <- lists:seq(0,9),
                    G <- lists:seq(0,9),
                    H <- lists:seq(0,9),
                    is_valid(NumberList,[A,B,C,D,E,F,G,H]) ],
                
    Passwords.
