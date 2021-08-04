#!/usr/bin/env zsh
# random_font_for_alacritty.sh
#
# Change font of alacritty randomly.
#
# for tmux.conf

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

to_font=${fonts_without_current_font[$RANDOM % ${#fonts_without_current_font[@]}+1]}

to_font_fullname=$(grep "^$to_font::" $fonts_file)

update_config_for_alacritty

change_font_for_alacritty "$to_font_fullname"

exit 0
