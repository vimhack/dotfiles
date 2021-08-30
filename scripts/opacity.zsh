#!/usr/bin/env zsh
# opacity.zsh
#
# Alacritty terminal background transparency adjustment.
#
# for zshrc


script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.zsh

to_opacity=$1

[[ -z "$to_opacity" ]] && {
    echo "Current opacity is '$current_opacity', and it can be changed by:

$ opacity number

* number must between 0 and 1"

    exit 0
}

[[ "$#" -gt 1 ]] && {
    echo Usage example: opacity 0.6
    exit 1
}

echo $to_opacity | grep -qE '^[0-1]?\.[0-9]+$|^1$|^0$' || {
    echo "opacity must between 0 and 1"
    exit 1
}

if [[ "$to_opacity" -lt 0 ]] || [[ "$to_opacity" -gt 1 ]]; then
    echo "opacity must between 0 and 1"
    exit 1
fi

to_opacity=$(trim_opacity_suffix $to_opacity)

update_config_for_alacritty

change_opacity_for_alacritty "$to_opacity"

exit 0
