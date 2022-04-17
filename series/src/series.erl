-module(series).

-export([slices/2]).

slices(_, []) -> error(empty_list);
slices(SliceLength, _) when SliceLength < 1 ->
    error(invalid_slice_length);
slices(SliceLength, Series)
    when length(Series) < SliceLength ->
    error(series_too_small);
slices(SliceLength, Series)
    when length(Series) == SliceLength ->
    [lists:sublist(Series, SliceLength)];
slices(SliceLength, Series) ->
    [lists:sublist(Series, SliceLength)
     | slices(SliceLength, tl(Series))].
