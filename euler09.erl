-module(euler09).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 09:
%% Find the only Pythagorean triplet, {a, b, c}, for 
%% which a + b + c = 1000.

%% we know we're in fact searching for a single solution,
%% so the list comprehension is unneccesary, but its a 
%% handy way to frame the general problem of finding
%% pythagorean triplets

pythag_triplets(N) ->
    [ { A, B, C } ||
        A <- lists:seq(1, N-2),
        B <- lists:seq(A+1, N-1),
        C <- lists:seq(B+1 ,N),
        A*A + B*B == C*C,
        A+B+C == N
    ]. 

%% run problem, find pythag triplet for N = 1000

go() ->
    N = 1000,
    [{A,B,C}] = pythag_triplets(N),
    {A,B,C,A*B*C}.

