#!/usr/bin/env bash
# toggle_transparency_for_alacritty.sh
#
# for tmux.conf

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

update_config_for_alacritty

toggle_transparancy_for_alacritty

exit 0
