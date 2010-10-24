-module(euler48).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 48:
%% Find the last ten digits of 11 + 22 + ... + 10001000.

%% integer power function, prime

mypow(A,B) ->
    mypow(A,B,1).

%% integer power function

mypow(A,0,SoFar) ->
    SoFar;
mypow(A,B,SoFar) ->
    mypow(A,B-1,A*SoFar).

%% sum powers 
    
sumnpowers(0, SoFar) ->
    SoFar;
sumnpowers(N, SoFar) ->
    sumnpowers(N-1, SoFar + mypow(N,N)).

%% run problem 

go() ->
    sumnpowers(1000,0).
    
