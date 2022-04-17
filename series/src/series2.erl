-module(series2).

-export([slices/2, slide/2]).

slide(Item, Acc) ->
    NewAcc = [Item | Acc],
    {NewAcc, lists:sublist(NewAcc, length(NewAcc) - 1)}.

slices(_, []) -> error(empty_list);
slices(SliceLength, _) when SliceLength < 1 ->
    error(invalid_slice_length);
slices(SliceLength, Series)
    when length(Series) < SliceLength ->
    error(slice_too_small);
slices(SliceLength, Series) ->
    Rest = lists:sublist(Series,
			 length(Series) - SliceLength + 1),
    Acc = lists:sublist(Series,
			length(Series) - SliceLength + 2, SliceLength - 1),
    io:fwrite("Acc ~p, Rest ~p\n", [Acc, Rest]),
    {Result, _} = lists:mapfoldr(fun series2:slide/2, Acc,
				 Rest),
    Result.
