#!/usr/bin/env zsh
# env.zsh
#

# windvalley/dotfiles root dir
dotfiles_dir=~/.dotfiles

# fonts file for Alacritty
fonts_file=$dotfiles_dir/FONTS

# colorschemes file for Alacritty and Vim/Neovim
colorschemes_file=$dotfiles_dir/COLORSCHEMES

vim_colorscheme_file=~/.vim/colorscheme.vim

vim_transparency_file=~/.vim/transparency.vim

vim_colorscheme_toggle_tmpfile=~/.vim/signal.tmp

alacritty_conf=~/.config/alacritty/alacritty.yml
alacritty_conf_temp=~/.config/alacritty/.alacritty.yml.temp

# last opacity value of Alacritty
last_opacity_file=~/.config/alacritty/.opacity.last

# default opacity value of Alacritty
default_opacity=0.9

# value of adjusting opacity each time
opacity_step=0.05

colorschemes=($(grep -Ev '#|//|"|^$' "$colorschemes_file" | xargs))

fonts=($(grep -Ev '#|//|"|^$' "$fonts_file" | awk -F:: '{print $1}' | xargs))

[[ ! -f "$alacritty_conf" ]] && {
    \cp "$dotfiles_dir"/alacritty/alacritty.yml $alacritty_conf
}

current_colorscheme=$(awk -F'*' '/^colors:/{print $2}' $alacritty_conf)
current_opacity=$(awk '/^background_opacity/{print $NF}' $alacritty_conf)
current_font_size=$(awk '/^  size:/{print $NF}' $alacritty_conf)

current_offset_x=$(gsed -n  '/^  offset:$/{N;N;p}' $alacritty_conf |
    awk '/x:/{print $NF}')
current_offset_y=$(gsed -n  '/^  offset:$/{N;N;p}' $alacritty_conf |
    awk '/y:/{print $NF}')

current_font_family=$(awk '/^    family:/{print $(NF-2)}' $alacritty_conf |
    head -1)
current_font_styles=$(grep "^    style:" $alacritty_conf |
    awk -F: '{print $NF}' | sed 's/ //')
current_font_styles_linenr=$(grep -n "^    style:" \
    $dotfiles_dir/alacritty/alacritty.yml | awk -F: '{print $1}' | xargs)
current_font_regular_style=$(echo "$current_font_styles" | head -1)
current_font=${current_font_family}_$current_font_regular_style

colorschemes_without_current_colorscheme=(
    $(echo ${colorschemes[@]} | xargs -n1 |
        grep -vw $current_colorscheme | xargs)
)

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

trim_opacity_suffix() {
    local to_opacity=$1

    if echo $to_opacity | grep -qE '^1\.'; then
        echo -n 1
        return
    fi

    if echo $to_opacity | grep -qE '^(0\.|\.)[0-9]+$'; then
        to_opacity=$(echo -n ${to_opacity} | gsed -r 's/[0]+$//')
    fi

    if echo $to_opacity | grep -qE '^\.'; then
        to_opacity=$(echo -n 0$to_opacity)
    fi

    if echo $to_opacity | grep -qE '^[0.]+$'; then
        to_opacity=0
    fi

    echo -n $to_opacity
}

update_config_for_alacritty() {
    \cp "$dotfiles_dir"/alacritty/alacritty.yml $alacritty_conf_temp

    regular_style=$(echo $current_font_styles | sed -n 1p)
    bold_style=$(echo $current_font_styles | sed -n 2p)
    italic_style=$(echo $current_font_styles | sed -n 3p)
    bold_italic_style=$(echo $current_font_styles | sed -n 4p)

    read -r regular_style_ln bold_style_ln italic_style_ln bold_italic_style_ln \
        <<<$current_font_styles_linenr

    gsed -i "/^colors/s/^.*$/colors: *$current_colorscheme/;
        /^  size:/s/^.*$/  size: $current_font_size/;
        /^background_opacity/s/^.*$/background_opacity: $current_opacity/;
        / family:/s/^.*$/    family: $current_font_family Nerd Font/;
        ${regular_style_ln}s/^.*$/    style: $regular_style/;
        ${bold_style_ln}s/^.*$/    style: $bold_style/;
        ${italic_style_ln}s/^.*$/    style: $italic_style/;
        ${bold_italic_style_ln}s/^.*$/    style: $bold_italic_style/;
        /^  offset:$/{N;N;s/^.*$/  offset:\n    x: $current_offset_x\n    y: $current_offset_y/}" \
            $alacritty_conf_temp

    \cp $alacritty_conf_temp $alacritty_conf
}

change_font_for_alacritty() {
    local to_font_fullname=$1

    to_font_family=$(echo "$to_font_fullname" | awk -F_ '{print $1}')
    to_font_styles=$(echo "$to_font_fullname" | awk -F_ '{print $2}')
    offset_x=$(echo $to_font_fullname|awk -F:: '{print $5}'|awk -F_ '{print $1}')
    offset_y=$(echo $to_font_fullname|awk -F:: '{print $5}'|awk -F_ '{print $2}')

    regular_style=$(echo $to_font_styles | awk -F:: '{print $1}')
    bold_style=$(echo $to_font_styles | awk -F:: '{print $2}')
    italic_style=$(echo $to_font_styles | awk -F:: '{print $3}')
    bold_italic_style=$(echo $to_font_styles | awk -F:: '{print $4}')

    read -r regular_style_ln bold_style_ln italic_style_ln bold_italic_style_ln \
        <<<$current_font_styles_linenr

    gsed -i "/ family:/s/^.*$/    family: $to_font_family Nerd Font/;
        ${regular_style_ln}s/^.*$/    style: $regular_style/;
        ${bold_style_ln}s/^.*$/    style: $bold_style/;
        ${italic_style_ln}s/^.*$/    style: $italic_style/;
        ${bold_italic_style_ln}s/^.*$/    style: $bold_italic_style/;
        /^  offset:$/{N;N;s/^.*$/  offset:\n    x: $offset_x\n    y: $offset_y/}" \
            $alacritty_conf
}

change_font_size_for_alacritty() {
    local to_font_size=$1
    gsed -i "/^  size:/s/^.*$/  size: $to_font_size/" $alacritty_conf
}

change_colorscheme_for_alacritty_vim() {
    local to_colorscheme=$1

    gsed -i "/^colors/s/^.*$/colors: *$to_colorscheme/" $alacritty_conf

    [[ "$to_colorscheme" = "base16" ]] && to_colorscheme="base16-default-dark"
    [[ "$to_colorscheme" = "onehalf" ]] && to_colorscheme="onehalfdark"
    [[ "$to_colorscheme" = "onehalf_light" ]] && to_colorscheme="onehalflight"
    [[ "$to_colorscheme" = "solarized" ]] && to_colorscheme="solarized8"
    [[ "$to_colorscheme" = "solarized_light" ]] && to_colorscheme="solarized8_light"
    [[ "$to_colorscheme" = "springnight" ]] && to_colorscheme="spring-night"
    [[ "$to_colorscheme" = "google" ]] && to_colorscheme="primary"
    [[ "$to_colorscheme" = "google_light" ]] && to_colorscheme="primary_light"
    [[ "$to_colorscheme" = "flat" ]] && to_colorscheme="base16-flat"
    [[ "$to_colorscheme" = "cupertino" ]] && to_colorscheme="base16-cupertino"
    [[ "$to_colorscheme" = "materia" ]] && to_colorscheme="base16-materia"

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

    touch $vim_colorscheme_toggle_tmpfile
}

change_opacity_for_alacritty() {
    local to_opacity=$1
    gsed -i "/^background_opacity/s/^.*$/background_opacity: $to_opacity/" \
        $alacritty_conf
}

toggle_transparancy_for_alacritty() {
    if [[ $current_opacity = "1.0" ]] || [[ $current_opacity = "1" ]]; then
        gsed -i "/^background_opacity/s/^.*$/background_opacity: $last_opacity/" \
            $alacritty_conf
    else
        gsed -i "/^background_opacity/s/^.*$/background_opacity: 1/" \
            $alacritty_conf
        echo "$current_opacity" >$last_opacity_file
    fi
}

toggle_vim_background_transparency() {
    local to_value=$1

    if [[ "$to_value" != 1 ]] && [[ "$to_value" != 0 ]]; then
        current_value=$(
            awk -F= '/^let g:bgtransparency=/{print $2}' \
                $vim_transparency_file 2>/dev/null
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

    touch $vim_colorscheme_toggle_tmpfile
}
