#!/bin/bash

function readlines {
	local -a read_cmd_opts
	while [[ $# -gt 0 ]] ; do
		case "$1" in
			-p|--prompt)
				if ! [[ -v 2 ]]; then
					echo readlines: $1: option requires an argument
					return 1
				fi
				local prompt="$2"
				shift
				;;
			-e|--sentinel)
				if ! [[ -v 2 ]]; then
					echo readlines: $1: option requires an argument
					return 1
				fi
				local sentinel="$2"
				shift
				;;
			-*)
				echo "readlines: $1: invalid option"
				return
				;;
			*)
				local out_var_name=$1
				break
				;;
		esac
		shift
	done
	local out_var_name="${out_var_name:-REPLY}"
	local -a lines
	while { echo -n "$prompt" 1>&2; IFS= read line; }; do
		[[ "$line" = "$sentinel" ]] && break
		lines+=("$line")
	done
	declare -ga $out_var_name
	local -n ref=$out_var_name
	ref+=("${lines[@]}")
}
