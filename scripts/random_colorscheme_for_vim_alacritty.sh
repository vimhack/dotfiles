#!/usr/bin/env bash
# random_colorscheme_for_vim_alacritty.sh
#
# Change colorscheme for vim and alacritty randomly.
#
# for tmux.conf

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

# shellcheck disable=SC2206,SC2207,SC2068,SC2086
colorschemes_without_current_colorscheme=($(echo ${colorschemes[@]} | xargs -n1 | grep -vw $current_colorscheme | xargs))

to_colorscheme=${colorschemes_without_current_colorscheme[$RANDOM % ${#colorschemes_without_current_colorscheme[@]}]}

update_config_for_alacritty

change_colorscheme_for_alacritty_vim "$to_colorscheme"

exit 0
