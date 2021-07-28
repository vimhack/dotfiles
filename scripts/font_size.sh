#!/usr/bin/env bash
# font_size.sh
#
# Alacritty 终端字体大小调整命令.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_font_size=$1

[[ -z "$to_font_size" ]] && {
    echo "Current font size is '$current_font_size', and it can be changed by:

$ font-size number

* number should between 1.0 and  200.0"

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

gsed -i "/^  size:/s/^.*$/  size: $to_font_size/" $alacritty_conf

exit 0
