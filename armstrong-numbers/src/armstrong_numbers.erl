-module(armstrong_numbers).

-export([is_armstrong_number/1]).

-spec is_armstrong_number(integer()) -> boolean().

is_armstrong_number(0) -> false;
is_armstrong_number(Number) when Number < 0 ->
    is_armstrong_number(-Number);
is_armstrong_number(Number) ->
    Digits = get_digits(Number, []),
    NumElements = length(Digits),
    ArmNumber = lists:foldl(fun (N, Acc) ->
				    Acc + math:pow(N, NumElements)
			    end,
			    0, Digits),
    Number == ArmNumber.

get_digits(0, Acc) -> Acc;
get_digits(Number, Acc) ->
    get_digits(Number div 10, [Number rem 10 | Acc]).
