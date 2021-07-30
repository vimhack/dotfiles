#!/usr/bin/env bash
# vim_bgtransparency.sh
#
# Turn on or off the transparency of the Vim background.
# A parameter 1 means on, and a parameter 0 means off.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_value=$1

toggle_vim_background_transparency "$to_value"

exit 0