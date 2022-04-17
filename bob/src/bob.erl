-module(bob).

-export([response/1]).

-spec response(string()) -> string().

response(String) ->
    case String of
      true == is_question(String) -> "Sure."
    end.

is_question(String) -> true.

is_exclamation(Stirng) -> true.

is_statement(String) -> true.
