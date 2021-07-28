#!/usr/bin/env bash
# toggle_transparency_for_alacritty.sh
#
# for tmux.conf

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

update_config_for_alacritty

if [[ $current_opacity = "1.0" ]] || [[ $current_opacity = "1" ]]; then
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $last_opacity/" $alacritty_conf
else
    gsed -i "/^background_opacity/s/^.*$/background_opacity: 1.0/" $alacritty_conf
    echo "$current_opacity" >$last_opacity_file
fi

exit 0
