#!/usr/bin/env zsh
# vim_bgtransparency.sh
#
# Turn on or off the transparency of the Vim background.
# A parameter 1 means on, and a parameter 0 means off.
#
# for zshrc

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

to_value=$1

toggle_vim_background_transparency "$to_value"

exit 0
