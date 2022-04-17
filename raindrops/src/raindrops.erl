-module(raindrops).

-export([convert/1]).

-spec convert(non_neg_integer()) -> string().

convert(Number) ->
    raindrops_or_digits(Number, map_raindrops(Number)).

-spec map_raindrops(non_neg_integer()) -> string().

map_raindrops(Number) ->
    Mapped = lists:map(make_mapping_fun(Number),
		       [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]),
    lists:flatten(Mapped).

-spec
     make_mapping_fun(non_neg_integer()) -> fun(({non_neg_integer(),
						  string()}) -> string()).

make_mapping_fun(Number) ->
    fun ({Divisor, Raindrop}) ->
	    case Number rem Divisor of
	      0 -> Raindrop;
	      _ -> ""
	    end
    end.

-spec raindrops_or_digits(non_neg_integer(),
			  string()) -> string().

raindrops_or_digits(Number, "") ->
    integer_to_list(Number);
raindrops_or_digits(_, Map) -> Map.
