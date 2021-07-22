#!/usr/bin/env bash
# toggle_transparency_for_alacritty.sh
#

dotfiles_dir=~/.dotfiles
alacritty_conf=~/.config/alacritty/alacritty.yml
last_opacity_file=$dotfiles_dir/tmux/.opacity.alacritty.last
default_opacity=0.9

[[ ! -f "$alacritty_conf" ]] && {
    \cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
}

[[ ! -s $last_opacity_file ]] && {
    value=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
    if [[ $value = "1.0" ]] || [[ $value = "1" ]]; then
        echo $default_opacity >$last_opacity_file
    else
        echo "$value" >$last_opacity_file
    fi
}

last_opacity=$(cat $last_opacity_file)
current_opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
current_color=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)
current_font_size=$(awk -F: '/  size:/{print $2}' $alacritty_conf)

\cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
gsed -i "/^colors/s/^.*$/colors: *$current_color/" $alacritty_conf
gsed -i "/^  size:/s/^.*$/  size: $current_font_size/" $alacritty_conf

if [[ $current_opacity = "1.0" ]] || [[ $current_opacity = "1" ]]; then
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $last_opacity/" $alacritty_conf
else
    gsed -i "/^background_opacity/s/^.*$/background_opacity: 1.0/" $alacritty_conf
    echo "$current_opacity" >$last_opacity_file
fi

exit 0
