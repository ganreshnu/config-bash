#
# bash/profile
#

PATH="$HOME/.local/bin:$PATH"

# make the xdg state directory
[[ ! -d "${XDG_STATE_HOME:-$HOME/.local/state}/bash" ]] \
	&& mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/bash"

# profile history variables
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/bash/history"
HISTCONTROL=ignoredups:ignorespace

for d in $(<"${XDG_STATE_HOME:-$HOME/.local/state}/user_config_dirs"); do
	[[ -f "$HOME/$d/.bash_profile" ]] && . "$HOME/$d/.bash_profile"
done
unset d

# vim: ft=bash
