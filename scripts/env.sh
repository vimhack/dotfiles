#!/usr/bin/env bash
# env.sh
#

# windvalley/dotfiles 仓库目录.
dotfiles_dir=~/.dotfiles

# Vim/Neovim 的颜色方案文件.
# shellcheck disable=SC2034
vim_colorscheme_file=~/.vim/colorscheme.vim
# shellcheck disable=SC2034
vim_transparency_file=~/.vim/transparenc.yvim

# Alacritty 的配置文件.
alacritty_conf=~/.config/alacritty/alacritty.yml

last_opacity_file=~/.config/alacritty/.opacity.last
default_opacity=0.9
# shellcheck disable=SC2034
opacity_step=0.05

# shellcheck disable=SC2034
themes=(
    # dark
    dracula molokai rigel jellybeans base16-default-dark nord tender
    gruvbox one iceberg papercolor ayu ayu_mirage onehalfdark vadelma
    # light
    gruvbox_light one_light iceberg_light papercolor_light
    ayu_light onehalflight vadelma_light
)

# shellcheck disable=SC2034
fonts=(
    Hack Iosevka FantasqueSansMono FiraCode JetBrainsMono CodeNewRoman
    Hasklug GoMono mononoki Cousine DaddyTimeMono SpaceMono BlexMono
    SauceCodePro CaskaydiaCove DejaVuSansMono
)

[[ ! -f "$alacritty_conf" ]] && {
    \cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
}

current_theme=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)
current_opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
current_font=$(awk '/ family:/{print $(NF-2)}' $alacritty_conf | head -1)
current_font_size=$(awk '/  size:/{print $NF}' $alacritty_conf)

[[ ! -s $last_opacity_file ]] && {
    if [[ $current_opacity = "1.0" ]] || [[ $current_opacity = "1" ]]; then
        echo $default_opacity >$last_opacity_file
    else
        echo "$current_opacity" >$last_opacity_file
    fi
}

# shellcheck disable=SC2034
last_opacity=$(cat $last_opacity_file)

update_config_for_alacritty() {
    \cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf

    gsed -i "/^colors/s/^.*$/colors: *$current_theme/" $alacritty_conf
    gsed -i "/ family:/s/^.*$/    family: $current_font Nerd Font/" $alacritty_conf
    gsed -i "/^  size:/s/^.*$/  size: $current_font_size/" $alacritty_conf
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $current_opacity/" $alacritty_conf
}
