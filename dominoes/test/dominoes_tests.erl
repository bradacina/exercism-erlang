%% Based on canonical data version 2.1.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/dominoes/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(dominoes_tests).

-include_lib("erl_exercism/include/exercism.hrl").

-include_lib("eunit/include/eunit.hrl").

'1_empty_input__empty_output_test'() ->
    ?assert((dominoes:can_chain([]))).

'2_singleton_input__singleton_output_test'() ->
    ?assert((dominoes:can_chain([{1, 1}]))).

'3_singleton_that_cant_be_chained_test'() ->
    ?assertNot((dominoes:can_chain([{1, 2}]))).

'4_three_elements_test'() ->
    ?assert((dominoes:can_chain([{1, 2}, {3, 1}, {2, 3}]))).

'5_can_reverse_dominoes_test'() ->
    ?assert((dominoes:can_chain([{1, 2}, {1, 3}, {2, 3}]))).

'6_cant_be_chained_test'() ->
    ?assertNot((dominoes:can_chain([{1, 2}, {4, 1},
				    {2, 3}]))).

'7_disconnected___simple_test'() ->
    ?assertNot((dominoes:can_chain([{1, 1}, {2, 2}]))).

'8_disconnected___double_loop_test'() ->
    ?assertNot((dominoes:can_chain([{1, 2}, {2, 1}, {3, 4},
				    {4, 3}]))).

'9_disconnected___single_isolated_test'() ->
    ?assertNot((dominoes:can_chain([{1, 2}, {2, 3}, {3, 1},
				    {4, 4}]))).

'10_need_backtrack_test'() ->
    ?assert((dominoes:can_chain([{1, 2}, {2, 3}, {3, 1},
				 {2, 4}, {2, 4}]))).

'11_separate_loops_test'() ->
    ?assert((dominoes:can_chain([{1, 2}, {2, 3}, {3, 1},
				 {1, 1}, {2, 2}, {3, 3}]))).

'12_nine_elements_test'() ->
    ?assert((dominoes:can_chain([{1, 2}, {5, 3}, {3, 1},
				 {1, 2}, {2, 4}, {1, 6}, {2, 3}, {3, 4},
				 {5, 6}]))).
