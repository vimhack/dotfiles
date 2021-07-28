#!/usr/bin/env bash
# vim_bgtransparency.sh
#
# 开启或关闭 Vim 背景透明色, 参数为 1 表示开启, 参数为 0 表示关闭.
#
# for zshrc

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd "$script_dir" || exit 1

source env.sh

to_value=$1

if [[ "$to_value" != 1 ]] && [[ "$to_value" != 0 ]]; then
    current_value=$(awk -F= '/^let g:bgtransparency=/{print $2}' $vim_transparency_file 2>/dev/null)

    if [[ "$current_value" = 1 ]]; then
        echo "Vim background transparency is currently enabled, to disable:
$ vim-bgtransparency 0"

    elif [[ "$current_value" = 0 ]]; then
        echo "Vim background transparency is currently disabled, to enable:

$ vim-bgtransparency 1"
    else
        echo "Vim background transparency is in default value(0 or 1), to enable:

$ vim-bgtransparency 1

to disable:

$ vim-bgtransparency 0"

    fi
else
    echo "let g:bgtransparency=$to_value" >$vim_transparency_file
fi

exit 0
