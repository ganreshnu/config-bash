#
# bash_profile.sh
#
[[ ! -d ${XDG_STATE_HOME:-$HOME/.local/state} ]] \
	&& mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}

HISTFILE=${XDG_STATE_HOME:-$HOME/.local/state}/bash/history
HISTCONTROL=ignoredups:ignorespace
