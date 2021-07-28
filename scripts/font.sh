#!/usr/bin/env bash
# font.sh
#
# Alacritty 字体切换命令.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

font_name=$1

if [[ "$font_name" = "list" ]] || [[ "$font_name" = "" ]]; then
    echo -e "The current font is '$current_font', and it can be changed to one of the following list:\n"

    for i in ${fonts[*]}; do
        [[ "$i" != "$current_font" ]] && {
            echo "* $i"
            example_font=$i
        }
    done

    cat <<EOF

For example, change font to '$example_font':

$ font $example_font
EOF
    exit 0
fi

exist_flag=1
for i in ${fonts[*]}; do
    [[ "$i" = "$font_name" ]] && {
        exist_flag=0
        break
    }
done

[[ "$exist_flag" -eq 1 ]] && {
    echo "no such font: \"$font_name\""
    exit 1
}

update_config_for_alacritty

gsed -i "/ family:/s/^.*$/    family: $font_name Nerd Font/" $alacritty_conf

exit 0
