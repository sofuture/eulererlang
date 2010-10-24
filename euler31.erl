-module(euler31).
-author("Jeff Zellner <jeff.zellner@gmail.com>").
-export([go/0]).
-compile(export_all).


%% permute a list

permute([]) ->
    [[]];
permute(List) ->
    [[Head | Tail] ||
        Head <- List,
        Tail <- permute(List -- [Head])].

change(_, []) -> 0;
change(Amount, [NextCoin|RestCoins] = Coins) ->
    change(Amount, RestCoins) + case true of
        true when Amount > NextCoin ->
            change(Amount - NextCoin, Coins);
        true when Amount =:= NextCoin ->
            1;
        _ ->
            0
    end.

coin_set() ->
    [1, 2, 5, 10, 20, 50, 100, 200].


%% run problem

go() ->
    change(200, coin_set()).


