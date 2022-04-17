-module(dominoes2).

-export([can_chain/1, distribute/2, list/3]).

can_chain(Dominoes) ->
    {Result, _} = list(Dominoes, Dominoes, dict:new()),
    case lists:filter(fun first_matches_last/1, Result) of
      [] -> false;
      _ -> true
    end.

list([], _, Mem) -> {[], Mem};
list([H | T], List, Mem) ->
    case dict:find(List, Mem) of
      {ok, Value} ->
	  io:format("found key in dict ~w~n", [List]),
	  {Value, Mem};
      error ->
	  {Rest, Mem2} = rest(List -- [H], Mem),
	  Dist = distribute(H, Rest),
	  {OtherHead, Mem3} = list(T, List, Mem2),
	  Ret = Dist ++ OtherHead,
	  %Mem4 = dict:store(List, Ret, Mem3),
	  RetFiltered = lists:filter(fun chain_filter/1, Ret),
	  {RetFiltered, Mem3}
    end.

rest([T], Mem) -> {[[T]], Mem};
rest(List, Mem) -> list(List, List, Mem).

distribute(_, []) -> [];
distribute(E, [H | T]) -> [[E | H] | distribute(E, T)].

chain_filter([E1, E2 | _]) -> equals(E1, E2).

first_matches_last([{F, F}]) -> true;
first_matches_last([H | T]) -> first_matches_last(H, T);
first_matches_last([]) -> false.

first_matches_last(F, [H]) -> equals(F, H);
first_matches_last(F, [_ | T]) ->
    first_matches_last(F, T).

equals({_, R}, {R, _}) -> true;
equals(_, _) -> false.
