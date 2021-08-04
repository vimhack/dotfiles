#!/usr/bin/env zsh
# env.sh
#

# windvalley/dotfiles root dir
dotfiles_dir=~/.dotfiles

# fonts file for Alacritty
fonts_file=$dotfiles_dir/FONTS

# colorschemes file for Alacritty and Vim/Neovim
colorschemes_file=$dotfiles_dir/COLORSCHEMES

vim_colorscheme_file=~/.vim/colorscheme.vim

vim_transparency_file=~/.vim/transparency.vim

alacritty_conf=~/.config/alacritty/alacritty.yml

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
fonts=($(grep -Ev '#|//|"|^$' "$fonts_file" | awk -F:: '{print $1}' | xargs))

[[ ! -f "$alacritty_conf" ]] && {
    \cp "$dotfiles_dir"/alacritty/alacritty.yml $alacritty_conf
}

# shellcheck disable=SC2206,SC2207,SC2068,SC2086,SC2034
current_colorscheme=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)
current_opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
current_font_size=$(awk '/  size:/{print $NF}' $alacritty_conf)

current_font_family=$(awk '/ family:/{print $(NF-2)}' $alacritty_conf | head -1)
current_font_styles=$(grep -n "    style:" $alacritty_conf | awk -F: '{print $1"_"$NF}' | sed 's/ //')
current_font_regular_style=$(echo "$current_font_styles" | awk -F_ '{print $2}' | head -1)
current_font=${current_font_family}_$current_font_regular_style

colorschemes_without_current_colorscheme=(
    $(echo ${colorschemes[@]} | xargs -n1 | grep -vw $current_colorscheme | xargs)
)

# shellcheck disable=SC2207,SC2068,SC2086,SC2034
fonts_without_current_font=(
    $(
        echo ${fonts[@]} | xargs -n1 | grep -vw $current_font | xargs
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
    gsed -i "/^  size:/s/^.*$/  size: $current_font_size/" $alacritty_conf
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $current_opacity/" $alacritty_conf

    gsed -i "/^    style:/s/style:/#style:/" $alacritty_conf
    gsed -i "/ family:/s/^.*$/    family: $current_font_family Nerd Font/" $alacritty_conf

    while read -r line; do
        line_number=$(echo "$line" | awk -F_ '{print $1}')
        style=$(echo "$line" | awk -F_ '{print $2}')

        gsed -i "${line_number}s/^.*$/    style: $style/" $alacritty_conf
    done <<<"$current_font_styles"
}

change_font_for_alacritty() {
    local to_font_fullname=$1

    to_font_family=$(echo "$to_font_fullname" | awk -F_ '{print $1}')
    to_font_styles=$(echo "$to_font_fullname" | awk -F_ '{print $2}')
    regular_style=$(echo $to_font_styles | awk -F:: '{print $1}')
    bold_style=$(echo $to_font_styles | awk -F:: '{print $2}')
    italic_style=$(echo $to_font_styles | awk -F:: '{print $3}')
    bold_italic_style=$(echo $to_font_styles | awk -F:: '{print $4}')

    styles_line_numbers=$(echo $current_font_styles | awk -F_ '{print $1}' | xargs)

    read -r regular_style_ln bold_style_ln italic_style_ln bold_italic_style_ln <<<$styles_line_numbers

    gsed -i "/^    style:/s/style:/#style:/" $alacritty_conf

    gsed -i "/ family:/s/^.*$/    family: $to_font_family Nerd Font/" $alacritty_conf

    gsed -i "${regular_style_ln}s/^.*$/    style: $regular_style/" $alacritty_conf
    gsed -i "${bold_style_ln}s/^.*$/    style: $bold_style/" $alacritty_conf
    gsed -i "${italic_style_ln}s/^.*$/    style: $italic_style/" $alacritty_conf
    gsed -i "${bold_italic_style_ln}s/^.*$/    style: $bold_italic_style/" $alacritty_conf
}

change_font_size_for_alacritty() {
    local to_font_size=$1
    gsed -i "/^  size:/s/^.*$/  size: $to_font_size/" $alacritty_conf
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
