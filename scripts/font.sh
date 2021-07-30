#!/usr/bin/env bash
# font.sh
#
# Switch font for Alacritty.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_font_and_style=$1

if [[ "$to_font_and_style" = "list" ]] || [[ "$to_font_and_style" = "" ]]; then
    echo -e "The current font is '$current_font_and_style', and it can be changed to one of the following list:\n"

    for i in ${fonts[*]}; do
        [[ "$i" != "$current_font_and_style" ]] && {
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
    [[ "$i" = "$to_font_and_style" ]] && {
        exist_flag=0
        break
    }
done

[[ "$exist_flag" -eq 1 ]] && {
    echo "no such font: '$to_font_and_style'"
    exit 1
}

update_config_for_alacritty

change_font_for_alacritty "$to_font_and_style"

exit 0
