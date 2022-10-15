#!/bin/bash

#
# config-update.sh
#
# Update my user configuration.
#

#
# define a usage function
#
usage() {
	cat <<EOD
Usage: $(basename "$BASH_SOURCE") [OPTIONS]

Options:
  --help                         Show this message and exit.

Configures and updates my user configurations.
EOD
}


#
# script autocomplete
#
if [[ "$0" != "$BASH_SOURCE" ]]; then
	set -uo pipefail

	# generic autocomplete function that parses the script help
	_config_update_dot_sh_completions() {
		local completions="$(usage |sed -e '/^  -/!d' \
			-e 's/^  \(-[[:alnum:]]\)\(, \(--[[:alnum:]-]\+\)\)\?\( \[\?\([[:upper:]]\+\)\)\?.*/\1=\5\n\3=\5/' \
			-e 's/^  \(--[[:alnum:]-]\+\)\( \[\?\([[:upper:]]\+\)\)\?.*/\1=\3/')"

		declare -A completion
		for c in $completions; do
			local key="${c%=*}"
			[[ "$key" ]] && completion[$key]="${c#*=}"
		done
		completions="${!completion[@]}"

		[[ $# -lt 3 ]] && local prev="$1" || prev="$3"
		[[ $# -lt 2 ]] && local cur="" || cur="$2"

		local type=""
		[[ ${completion[$prev]+_} ]] && type=${completion[$prev]}

		case "$type" in
		FILENAME )
			COMPREPLY=($(compgen -f -- "$cur"))
			compopt -o filenames
			;;
		DIRECTORY )
			COMPREPLY=($(compgen -d -- "$cur"))
			compopt -o filenames
			;;
		[A-Z]* )
			;;
		* )
			COMPREPLY=($(compgen -W "$completions" -- "$cur"))
			;;
		esac
	}
	complete -o noquote -o bashdefault -o default \
		-F _config_update_dot_sh_completions $(basename "$BASH_SOURCE")
	return
fi


#
# something is running the script
#
set -euo pipefail

#
# define an error function
#
error() {
	>&2 printf "$(tput bold; tput setaf 1)error:$(tput sgr0) %s\n" "$@"
}


#
# define the main encapsulation function
#
config_update_dot_sh() { local showusage=-1

	#
	# declare the variables derived from the arguments
	#

	#
	# parse the arguments
	#
	while true; do
		if [[ $# -gt 0 && "$1" == -* ]]; then
			case "$1" in
				--help )
					showusage=0
					shift
					;;
				-- )
					shift
					break
					;;
				* )
					error "unknown argument $1"
					showusage=1
					shift
					;;
			esac
		else
			break
		fi
	done

	#
	# argument validation goes here
	#
		
	#
	# show help if necessary
	#
	if [[ $showusage -ne -1 ]]; then
		usage
		return $showusage
	fi
	
	#
	# value validation goes here
	#

	#
	# script begins
	#
	for gd in "${XDG_CONFIG_HOME:-$HOME/.config}"/*; do
		[[ -d "$gd/.git" ]] && git -C "$gd" pull
	done

}
config_update_dot_sh "$@"

# vim: ft=bash ts=3 sw=0 sts=0
