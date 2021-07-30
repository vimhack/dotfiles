#!/usr/bin/env bash
# env.sh
#

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# windvalley/dotfiles root dir
dotfiles_dir=${script_dir%/*}

vim_colorscheme_file=~/.vim/colorscheme.vim

vim_transparency_file=~/.vim/transparency.vim

alacritty_conf=~/.config/alacritty/alacritty.yml

# fonts file for Alacritty
fonts_file=$dotfiles_dir/FONTS

# colorschemes file for  Alacritty and Vim/Neovim
colorschemes_file=$dotfiles_dir/COLORSCHEMES

# last opacity value of Alacritty
last_opacity_file=~/.config/alacritty/.opacity.last

# default opacity value of Alacritty
default_opacity=0.9

# value of adjusting opacity each time
# shellcheck disable=SC2034
opacity_step=0.05

# shellcheck disable=SC2034,SC2207
colorschemes=($(grep -Ev '#|//|"|^$' "$colorschemes_file" | xargs))

# shellcheck disable=SC2207
fonts=($(grep -Ev '#|//|"|^$' "$fonts_file" | xargs))

[[ ! -f "$alacritty_conf" ]] && {
    \cp "$dotfiles_dir"/alacritty/alacritty.yml $alacritty_conf
}

# shellcheck disable=SC2206,SC2207,SC2068,SC2086,SC2034
current_colorscheme=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)
current_opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
current_font=$(awk '/ family:/{print $(NF-2)}' $alacritty_conf | head -1)
current_font_size=$(awk '/  size:/{print $NF}' $alacritty_conf)
current_font_style=$(grep 'style:' $alacritty_conf | head -1 | awk '{print $NF}')
current_font_and_style=${current_font}_$current_font_style

# shellcheck disable=SC2207,SC2068,SC2086,SC2034
fonts_without_current_font=(
    $(
        echo ${fonts[@]} | xargs -n1 | grep -vw $current_font_and_style | xargs
    )
)

[[ ! -s $last_opacity_file ]] && {
    if [[ $current_opacity = "1.0" ]] || [[ $current_opacity = "1" ]]; then
        echo $default_opacity >$last_opacity_file
    else
        echo "$current_opacity" >$last_opacity_file
    fi
}

last_opacity=$(cat $last_opacity_file)

update_config_for_alacritty() {
    \cp "$dotfiles_dir"/alacritty/alacritty.yml $alacritty_conf

    gsed -i "/^colors/s/^.*$/colors: *$current_colorscheme/" $alacritty_conf
    gsed -i "/ family:/s/^.*$/    family: $current_font Nerd Font/" $alacritty_conf
    gsed -i "/^  size:/s/^.*$/  size: $current_font_size/" $alacritty_conf
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $current_opacity/" $alacritty_conf
}

change_font_for_alacritty() {
    local to_font=$1

    font=$(echo "$to_font" | awk -F_ '{print $1}')
    style=$(echo "$to_font" | awk -F_ '{print $2}')

    gsed -i "/ family:/s/^.*$/    family: $font Nerd Font/" $alacritty_conf
    gsed -i "s/#style: Regular$/style: $style/" $alacritty_conf
}

change_colorscheme_for_alacritty_vim() {
    local to_colorscheme=$1

    gsed -i "/^colors/s/^.*$/colors: *$to_colorscheme/" $alacritty_conf

    if [[ "$to_colorscheme" = "ayu" ]]; then
        echo "let ayucolor='dark'
colorscheme ayu" >$vim_colorscheme_file
    elif [[ "$to_colorscheme" = "ayu_mirage" ]]; then
        echo "let ayucolor='mirage'
colorscheme ayu" >$vim_colorscheme_file
    elif [[ "$to_colorscheme" = "ayu_light" ]]; then
        echo "let ayucolor='light'
colorscheme ayu" >$vim_colorscheme_file
    else
        if echo "$to_colorscheme" | grep -q "_light"; then
            echo "set background=light
colorscheme ${to_colorscheme/_light/}" >$vim_colorscheme_file
        else
            echo "set background=dark
colorscheme ${to_colorscheme/_light/}" >$vim_colorscheme_file
        fi
    fi
}

change_opacity_for_alacritty() {
    local to_opacity=$1

    gsed -i "/^background_opacity/s/^.*$/background_opacity: $to_opacity/" $alacritty_conf
}

toggle_transparancy_for_alacritty() {
    if [[ $current_opacity = "1.0" ]] || [[ $current_opacity = "1" ]]; then
        gsed -i "/^background_opacity/s/^.*$/background_opacity: $last_opacity/" $alacritty_conf
    else
        gsed -i "/^background_opacity/s/^.*$/background_opacity: 1.0/" $alacritty_conf
        echo "$current_opacity" >$last_opacity_file
    fi
}

toggle_vim_background_transparency() {
    local to_value=$1

    if [[ "$to_value" != 1 ]] && [[ "$to_value" != 0 ]]; then
        current_value=$(
            awk -F= '/^let g:bgtransparency=/{print $2}' $vim_transparency_file 2>/dev/null
        )

        if [[ "$current_value" = 1 ]]; then
            echo "Vim background transparency is currently enabled, to disable:

$ vim-bgtransparency 0"

        elif [[ "$current_value" = 0 ]]; then
            echo "Vim background transparency is currently disabled, to enable:

$ vim-bgtransparency 1"
        else
            echo "Vim background transparency is currently the default value(0 or 1), to enable:

$ vim-bgtransparency 1

to disable:

$ vim-bgtransparency 0"
        fi
    else
        echo "let g:bgtransparency=$to_value" >$vim_transparency_file
    fi
}
