#!/bin/bash

source src/getlines.sh

test_user_input_is_saved_to_variable_named_reply_by_default() {
	local output="$(
		getlines < <(printf 'line 1\nline 2\n\n')
		echo -n "$REPLY";
	)"
	assertEquals "$(printf 'line 1\nline 2\n')" "$output"
}

testResultVariableNameCanBeChanged() {
	local output="$(
		getlines answer < <(printf '1 2 3\n4 5 6\n7 8 9\n\n')
		echo -n "$answer"
	)"
	assertEquals "$(printf '1 2 3\n4 5 6\n7 8 9\n')" "$output"
}

test_prompt_can_be_changed() {
	local output="$(
		getlines '' '> ' < <(printf '\n')
	)"
	assertEquals "$(printf '> \n')" "$output"
}

test_sentinel_line_can_be_changed() {
	local output="$(
		getlines '' '' DONE < <(printf 'line 1\nline 2\nDONE\n')
		echo -n "$REPLY"
	)"
	assertEquals "$(printf 'line 1\nline 2\n')" "$output"
}

source shunit2
