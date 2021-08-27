#!/usr/bin/env zsh
# vim_bgtransparency.zsh
#
# Turn on or off the transparency of the Vim background.
# A parameter 1 means on, and a parameter 0 means off.
#
# for zshrc

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.zsh

to_value=$1

toggle_vim_background_transparency "$to_value"

exit 0
