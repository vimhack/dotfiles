#!/usr/bin/env zsh
# random_colorscheme_for_vim_alacritty.sh
#
# Change colorscheme for vim and alacritty randomly.
#
# for tmux.conf

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

to_colorscheme_index=$(($RANDOM % ${#colorschemes_without_current_colorscheme[@]}))
to_colorscheme=${colorschemes_without_current_colorscheme[$to_colorscheme_index+1]}

update_config_for_alacritty

change_colorscheme_for_alacritty_vim "$to_colorscheme"

exit 0
