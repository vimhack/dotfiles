#!/usr/bin/env zsh
# font_size.zsh
#
# Change font size of Alacritty.
#
# for zshrc


script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.zsh

to_font_size=$1

[[ -z "$to_font_size" ]] && {
    echo "Current font size is '$current_font_size', and it can be changed by:

$ font-size number

* number must between 1.0 and  200.0"

    exit 0
}

[[ "$#" -gt 1 ]] && {
    echo Usage example: font-size 12.0
    exit 1
}

if [[ "$to_font_size" -lt 1 ]] || [[ "$to_font_size" -gt 200 ]]; then
    echo font size must between 1.0 and 200.0
    exit 1
fi

update_config_for_alacritty

change_font_size_for_alacritty "$to_font_size"

exit 0
