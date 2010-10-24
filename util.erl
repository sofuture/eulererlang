-module(util).
-author("Jeff Zellner <jeff.zellner@gmail.com>").

-compile(export_all).

factors(N, IncludeN) when IncludeN =:= true ->
    factors(N, 2, N, [1,N]);
factors(N, IncludeN) when IncludeN =:= false ->
    factors(N).

%% prime recursive calls to get list of factors

factors(N) ->
    factors(N, 2, N, [1]).

%% get list of factors

factors(_N, Current, Max, Results) when Current >= Max ->
    lists:usort(Results);
factors(N, Current, Max, Results) ->
    NewMax = trunc(N/Current),
    case N rem Current =:= 0 of
        true -> factors(N, Current+1, NewMax, [Current, NewMax|Results]);
        false -> factors(N, Current+1, Max,Results)
    end.

%% listify an integers digits

int_to_list(Integer) ->
    int_to_list(Integer, []).

int_to_list(0, SoFar) -> SoFar;
int_to_list(Integer, SoFar) ->
    int_to_list(Integer div 10, [Integer rem 10 | SoFar]).

