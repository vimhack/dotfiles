#!/usr/bin/env zsh
# toggle_transparency_for_alacritty.sh
#
# for tmux.conf

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

update_config_for_alacritty

toggle_transparancy_for_alacritty

exit 0
