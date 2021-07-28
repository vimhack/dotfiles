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
themes_without_current_theme=($(echo ${themes[@]} | xargs -n1 | grep -vw $current_theme | xargs))

to_theme=${themes_without_current_theme[$RANDOM % ${#themes_without_current_theme[@]}]}

update_config_for_alacritty

gsed -i "/^colors/s/^.*$/colors: *$to_theme/" $alacritty_conf

if [[ "$to_theme" = "ayu" ]]; then
    echo "let ayucolor='dark'
colorscheme ayu" >$vim_colorscheme_file
elif [[ "$to_theme" = "ayu_mirage" ]]; then
    echo "let ayucolor='mirage'
colorscheme ayu" >$vim_colorscheme_file
elif [[ "$to_theme" = "ayu_light" ]]; then
    echo "let ayucolor='light'
colorscheme ayu" >$vim_colorscheme_file
else
    if echo "$to_theme" | grep -q "_light"; then
        echo "set background=light
colorscheme ${to_theme/_light/}" >$vim_colorscheme_file
    else
        echo "set background=dark
colorscheme ${to_theme/_light/}" >$vim_colorscheme_file
    fi
fi

exit 0
