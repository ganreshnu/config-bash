#
# bashrc.sh
#
# This file is appended to the stock .bashrc and replaces it.
#

# set the history options
shopt -s histappend
shopt -s checkwinsize
# load the prompt
eval "$(starship init bash)"
