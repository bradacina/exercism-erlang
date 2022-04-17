-module(rna_transcription).

-export([to_rna/1]).

-spec to_rna(string()) -> string().

to_rna(Strand) -> [rna_map(E) || E <- Strand].

rna_map($C) -> $G;
rna_map($G) -> $C;
rna_map($T) -> $A;
rna_map($A) -> $U.
