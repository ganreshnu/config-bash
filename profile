#
# bash/profile
#

PATH="$HOME/.local/bin:$PATH"

for d in $(<"${XDG_STATE_HOME:-$HOME/.local/state}/user_config_dirs"); do
	[[ -f "$HOME/$d/.bash_profile" ]] && . "$HOME/$d/.bash_profile"
done
unset d

# vim: ft=bash
