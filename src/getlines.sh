#!/bin/bash

function getlines {
	local result_var_name="${1:-REPLY}"
	local prompt="$2"
	local sentinel="$3"
	local lines
	while { echo -n "$prompt"; read line; }; do
		[[ "$line" = "$sentinel" ]] && break
		lines+="$line"$'\n'
	done
	declare -g $result_var_name="$lines"
}
