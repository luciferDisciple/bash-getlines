#!/bin/bash

source src/readlines.sh

test_regular_operation() {
	local -a lines
	local input=$'500g flour\n2 eggs\n\n'
	readlines < <(echo -n "$input")
	assertEquals '500g flour' "${REPLY[0]}"
	assertEquals '2 eggs' "${REPLY[1]}"
	assertEquals 2 ${#REPLY[*]}
}

test_option_p_requires_argument() {
	local output="$(readlines -p)"
	assertEquals 'readlines: -p: option requires an argument' "$output"
}

test_option_p_changes_prompt() {
	local output="$(readlines --prompt '... ' 2>&1 <<<$'first line\n\n')"
	assertEquals $'... ... ' "$output"
}

test_option_e_requires_argument() {
	local output="$(readlines --sentinel 2>&1)"
	assertEquals 'readlines: --sentinel: option requires an argument' "$output"
}

test_option_e_changes_sentinel_line() {
	readlines --sentinel END <<<$'can enter empty line:\n\nempty line above\nEND\n'
	assertEquals 'can enter empty line:' "${REPLY[0]}"
	assertEquals ''                      "${REPLY[1]}"
	assertEquals 'empty line above'      "${REPLY[2]}"
	assertEquals 3 ${#REPLY[@]}
}

test_invalid_options_are_not_allowed() {
	local output="$(readlines -p '>>> ' -X)"
	assertEquals 'readlines: -X: invalid option' "$output"
}

source shunit2
