#
# bash/.profile
#

# make the xdg state directory
[[ ! -d "${XDG_STATE_HOME:-$HOME/.local/state}/bash" ]] \
	&& mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/bash"

# profile history variables
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/bash/history"
HISTCONTROL=ignoredups:ignorespace

for config in "${XDG_CONFIG_HOME:-$HOME/.config}"/*; do
	[[ -r "$config/.profile" ]] && . "$config/.profile"
done
unset config
