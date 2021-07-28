#!/usr/bin/env zsh
# decrease_opacity_of_alacritty.sh
#
# for tmux.conf

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

update_config_for_alacritty

to_opacity=0$(echo "scale=2;$current_opacity-$opacity_step" | bc)

[[ $to_opacity = 00 ]] && to_opacity=0.0

[[ $to_opacity -lt 0 ]] && exit 0

gsed -i "/^background_opacity/s/^.*$/background_opacity: $to_opacity/" $alacritty_conf

exit 0
