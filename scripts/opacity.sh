#!/usr/bin/env zsh
# opacity.sh
#
# Alacritty terminal background transparency adjustment.
#
# for zshrc


script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

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

change_opacity_for_alacritty "$to_opacity"

exit 0