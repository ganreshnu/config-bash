#
# bash_profile.sh
#
[[ ! -d ${XDG_STATE_HOME:-$HOME/.local/state}/bash ]] \
	&& mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/bash

HISTFILE=${XDG_STATE_HOME:-$HOME/.local/state}/bash/history
HISTCONTROL=ignoredups:ignorespace
