-module(dominoes).

-include_lib("eunit/include/eunit.hrl").

-export([can_chain/1]).

-type domino() :: {integer(), integer()}.

-spec can_chain([domino()]) -> boolean().

can_chain(Dominoes) ->
    lists:any(fun (Perm) ->
		      lists:any(fun valid_chain/1, flips(Perm))
	      end,
	      permutations(Dominoes)).

-spec valid_chain([domino()]) -> boolean().

valid_chain([]) -> true;
valid_chain([{A1, _} | _] = Dominoes) ->
    valid_chain(A1, Dominoes).

-spec valid_chain(integer(), [domino()]) -> boolean().

valid_chain(_, []) -> true;
valid_chain(First1, [{_, Last2}]) -> First1 == Last2;
valid_chain(First1, [{_, A2}, {B1, _} = B | Rest]) ->
    A2 == B1 andalso valid_chain(First1, [B | Rest]).

-spec permutations(list()) -> [list()].

permutations([]) -> [[]];
permutations(L) ->
    [[X | Y] || X <- L, Y <- permutations(L -- [X])].

-spec flips([domino()]) -> [[domino()]].

flips([]) -> [[]];
flips([{H1, H2} = H | T]) ->
    [[X | Y] || X <- [H, {H2, H1}], Y <- flips(T)].
