## Bash Configuration


Source the login profile with a dropin:
```
#/etc/profile.d/bash-config-profiles.sh
for pf in "${XDG_CONFIG_HOME:-$HOME/.config}"/*/.profile; do
	[[ -r "$pf" ]] && . "$pf"
done
unset pf
```


Source the rc from .bashrc in $HOME:
```
#$HOME/.bashrc
for rc in "${XDG_CONFIG_HOME:-$HOME/.config}"/*/.rc; do
	[[ -r "$rc" ]] && . "$rc"
done
unset rc
```


