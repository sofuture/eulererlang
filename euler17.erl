-module(euler17).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).

%% Problem 17:
%% How many letters would be needed to write all the numbers
%% in words from 1 to 1000?

%% length of numbers

count(1) -> 3; %% one
count(2) -> 3; %% two
count(3) -> 5; %% three
count(4) -> 4; %% four
count(5) -> 4; %% five
count(6) -> 3; %% six
count(7) -> 5; %% seven
count(8) -> 5; %% eight
count(9) -> 4; %% nine
count(10) -> 3; %% ten
count(11) -> 6; %% eleven
count(12) -> 6; %% twelve
count(13) -> 8; %% thirteen
count(14) -> 8; %% fourteen
count(15) -> 7; %% fifteen
count(16) -> 7; %% sixteen
count(17) -> 9; %% seventeen
count(18) -> 8; %% eighteen
count(19) -> 8; %% nineteen
count(20) -> 6; %% twenty
count(30) -> 6; %% thirty
count(40) -> 5; %% forty
count(50) -> 5; %% fifty
count(60) -> 5; %% sixty
count(70) -> 7; %% seventy
count(80) -> 6; %% eighty
count(90) -> 6; %% ninety

count(N) when N < 1000 andalso N rem 100 =:= 0 ->
    7 + count(N div 100);

count(N) when N < 1000000 andalso N rem 1000 =:= 0 ->
    8 + count(N div 1000);

count(N) when N < 100 ->
    Rem = N rem 10,
    count(N - Rem) + count(Rem);

count(N) when N < 1000 ->
    Rem = N rem 100,
    count(N - Rem) + 3 + count(Rem);

count(N) when N < 1000000 ->
    Rem = N rem 1000,
    count(N - Rem) + 3 + count(Rem).

%% sum lengths of numbers counting down

sum(0, Count) ->
    Count;
sum(N, Count) ->
    sum(N-1, Count + count(N)).

%% run problem 

go() ->
    sum(1000,0).

