#!/usr/bin/env bash
# theme.sh
#
# Vim/Neovim 和 Alacritty 颜色方案主题切换命令.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_theme=$1

if [[ "$to_theme" = "list" ]] || [[ "$to_theme" = "" ]]; then
    echo -e "The current theme is '$current_theme', and it can be changed to one of the following list:\n"

    for i in ${themes[*]}; do
        [[ "$i" != "$current_theme" ]] && {
            echo "* $i"
            example_theme=$i
        }
    done

    cat <<EOF

For example, change theme to '$example_theme':

$ theme $example_theme
EOF
    exit 0
fi

exist_flag=1
for i in ${themes[*]}; do
    [[ "$i" = "$to_theme" ]] && {
        exist_flag=0
        break
    }
done

[[ "$exist_flag" -eq 1 ]] && {
    echo "no such theme: \"$to_theme\""
    exit 1
}

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
fi

if echo "$to_theme" | grep -q "_light"; then
    echo "set background=light
colorscheme ${to_theme/_light/}" >$vim_colorscheme_file
else
    echo "set background=dark
colorscheme ${to_theme/_light/}" >$vim_colorscheme_file
fi

exit 0
