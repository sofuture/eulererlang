-module(euler29).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 29:
%% How many distinct terms are in the sequence generated 
%% by a^b for 2 =< a =< 100 and 2 =< b =< 100?

%% run problem

go() ->
    length(lists:usort([trunc(math:pow(A,B)) ||
        A <- lists:seq(2,100),
        B <- lists:seq(2,100)
    ])).
