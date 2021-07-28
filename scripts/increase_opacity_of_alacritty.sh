#!/usr/bin/env zsh
# increase_opacity_of_alacritty.sh
#
# for tmux.conf

script_dir=$(cd "$(dirname $0)" && pwd)

source $script_dir/env.sh

update_config_for_alacritty

to_opacity=0$(echo "scale=2;$current_opacity+$opacity_step" | bc)

[[ $to_opacity -gt 1 ]] && exit 0

gsed -i "/^background_opacity/s/^.*$/background_opacity: $to_opacity/" $alacritty_conf

exit 0
