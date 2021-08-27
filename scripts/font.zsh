#!/usr/bin/env zsh
# font.zsh
#
# Switch font for Alacritty.
#
# for zshrc

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.zsh

to_font=$1

if [[ "$to_font" = "list" ]] || [[ "$to_font" = "" ]]; then
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
    [[ "$i" = "$to_font" ]] && {
        exist_flag=0
        break
    }
done

[[ "$exist_flag" -eq 1 ]] && {
    echo "no such font: '$to_font'"
    exit 1
}

to_font_fullname=$(grep "^$to_font::" $fonts_file)

update_config_for_alacritty

change_font_for_alacritty "$to_font_fullname"

exit 0
