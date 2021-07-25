#!/usr/bin/env zsh
# decrease_opacity_of_alacritty.sh
#

dotfiles_dir=~/.dotfiles
alacritty_conf=~/.config/alacritty/alacritty.yml
step=0.05

[[ ! -f "$alacritty_conf" ]] && {
    \cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
}

value=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)

to_value=0$(echo "scale=2;$value-$step" | bc)

[[ $to_value = 00 ]] && to_value=0.0

[[ $to_value -lt 0 ]] && exit 0

current_color=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)
current_font_size=$(awk -F: '/  size:/{print $2}' $alacritty_conf)

\cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
gsed -i "/^colors/s/^.*$/colors: *$current_color/" $alacritty_conf
gsed -i "/^  size:/s/^.*$/  size: $current_font_size/" $alacritty_conf

gsed -i "/^background_opacity/s/^.*$/background_opacity: $to_value/" $alacritty_conf

exit 0
