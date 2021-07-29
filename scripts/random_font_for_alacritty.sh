#!/usr/bin/env bash
# random_font_for_alacritty.sh
#
# Change font of alacritty randomly.
#
# for tmux.conf

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

# shellcheck disable=SC2206,SC2207,SC2068,SC2086
fonts_without_current_font=($(echo ${fonts[@]} | xargs -n1 | grep -vw $current_font | xargs))

to_font=${fonts_without_current_font[$RANDOM % ${#fonts_without_current_font[@]}]}

update_config_for_alacritty

gsed -i "/ family:/s/^.*$/    family: $to_font Nerd Font/" $alacritty_conf

exit 0
