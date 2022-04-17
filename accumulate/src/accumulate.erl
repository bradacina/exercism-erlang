-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) ->
    lists:reverse(accumulate(Fn, [], Ls)).

accumulate(Fn, Acc, [H | T]) ->
    accumulate(Fn, [Fn(H) | Acc], T);
accumulate(_, Acc, []) -> Acc.
