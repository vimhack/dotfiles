#!/usr/bin/env bash
# random_colorscheme_for_vim_alacritty.sh
#
# Change colorscheme for vim and alacritty randomly.

# windvalley/dotfiles 仓库所在目录.
dotfiles_dir=~/.dotfiles

# Vim/Neovim 的颜色方案文件.
vim_colorscheme_file=~/.vim/colorscheme.vim

# Alacritty 的配置文件.
alacritty_conf=~/.config/alacritty/alacritty.yml

themes=(
    # dark
    dracula molokai rigel jellybeans base16-default-dark nord tender
    gruvbox one iceberg papercolor ayu ayu_mirage onehalfdark vadelma
    # light
    gruvbox_light one_light iceberg_light papercolor_light
    ayu_light onehalflight vadelma_light
)

current_theme=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)

# shellcheck disable=SC2206,SC2207,SC2068,SC2086
themes_del_current_theme=($(echo ${themes[@]} | xargs -n1 | grep -vw $current_theme | xargs))

theme_name=${themes_del_current_theme[$RANDOM % ${#themes_del_current_theme[@]}]}

if [[ -f "$alacritty_conf" ]]; then
    opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
    font_size=$(awk -F: '/  size:/{print $2}' $alacritty_conf)

    \cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
    gsed -i "/^colors/s/^.*$/colors: *$theme_name/" $alacritty_conf
    gsed -i "/^  size:/s/^.*$/  size: $font_size/" $alacritty_conf
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $opacity/" $alacritty_conf
else
    \cp $dotfiles_dir/alacritty/alacritty.yml $alacritty_conf
    gsed -i "/^colors/s/^.*$/colors: *$theme_name/" $alacritty_conf
fi

if [[ "$theme_name" = "ayu" ]]; then
    echo "let ayucolor='dark'
colorscheme ayu" >$vim_colorscheme_file
elif [[ "$theme_name" = "ayu_mirage" ]]; then
    echo "let ayucolor='mirage'
colorscheme ayu" >$vim_colorscheme_file
elif [[ "$theme_name" = "ayu_light" ]]; then
    echo "let ayucolor='light'
colorscheme ayu" >$vim_colorscheme_file
else
    if echo "$theme_name" | grep -q "_light"; then
        echo "set background=light
colorscheme ${theme_name/_light/}" >$vim_colorscheme_file
    else
        echo "set background=dark
colorscheme ${theme_name/_light/}" >$vim_colorscheme_file
    fi
fi

exit 0
