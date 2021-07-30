#!/usr/bin/env bash
# random_font_for_alacritty.sh
#
# Change font of alacritty randomly.
#
# for tmux.conf

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_font=${fonts_without_current_font[$RANDOM % ${#fonts_without_current_font[@]}]}

update_config_for_alacritty

change_font_for_alacritty "$to_font"

exit 0
