#
# bashrc.sh
#
# This file is appended to the stock .bashrc and replaces it.
#

# set the history options
HISTFILE=$HOME/.local/share/bash/history
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize
