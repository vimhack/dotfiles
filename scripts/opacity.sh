#!/usr/bin/env bash
# opacity.sh
#
# Alacritty 终端背景透明度调整命令.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_opacity=$1

[[ -z "$to_opacity" ]] && {
    current_opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)

    echo "Current opacity is '$current_opacity', and it can be changed by:

$ opacity number

* number must between 0.0 and 1.0"

    exit 0
}

[[ "$#" -gt 1 ]] && {
    echo Usage example: opacity 0.6
    exit 1
}

if [[ "$to_opacity" -lt 0 ]] || [[ "$to_opacity" -gt 1 ]]; then
    echo "opacity must between 0.0 and 1.0"
    exit 1
fi

update_config_for_alacritty

gsed -i "/^background_opacity/s/^.*$/background_opacity: $to_opacity/" $alacritty_conf

exit 0
