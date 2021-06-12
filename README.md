# Windvalley's dotfiles 🍀

This is my personal development environment focusing on
Go, Python, OpenResty/Lua, Bash and JavaScript programming.

## 💝 Powers

- [Vim](https://github.com/vim/vim) or [Neovim](https://github.com/neovim/neovim)
- [Tmux](https://github.com/tmux/tmux)
- [Zsh](https://ohmyz.sh/)
- [Alacritty](https://github.com/alacritty/alacritty)

## 📀 Installation

Requirements:

- [vim 8.2+](https://github.com/vim/vim) or
  [Neovim 0.4.0+](https://github.com/neovim/neovim)
- [tmux 3.0+](https://github.com/tmux/tmux)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [alacritty](https://github.com/alacritty/alacritty)

To install, run the following from your terminal:
(please backup your existing dotfiles first)

```bash
git clone https://github.com/windvalley/dotfiles.git ~/.dotfiles

# vim
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json

# nvim
mkdir -p ~/.config/nvim && ln -sf ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

# tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# zsh
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

# alacritty
ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp ~/.dotfiles/alacritty/alacritty_private.yml ~/.alacritty_private.yml
```

💡 You can go to the beginning of each dotfile to view the detailed installation steps.

To update:

```bash
cd ~/.dotfiles
git pull
```

## 📜 Tips

**Change colorscheme of Vim/Neovim and Alacritty:**

```text
theme

Current theme is 'dracula', you can change to follows:

* molokai
* rigel
* jellybeans
* base16-default-dark
* nord
* tender
* gruvbox
* solarized
* one
* iceberg
* papercolor
* gruvbox_light
* solarized_light
* one_light
* iceberg_light
* papercolor_light

For example, change theme to 'papercolor_light':

$ theme papercolor_light
```

**Change font size of Alacritty:**

```text
font

Current font size is '12.0', you can change by:

$ font number

* number should between 1.0 and  200.0
```

**Change opacity of Alacritty:**

```text
opacity

Current opacity is '0.9', you can change by:

$ opacity number

* number should between 0.0 and 1.0
```

**Toggle Vim/Neovim transparent background color:**

```text
vim-bgtransparent

Vim background transparent was enabled, to disable:

$ vim-bgtransparent 0
```

**Print 256 colors in terminal:**

```text
colors_print

rgb
```

💡 Almost every dotfile has usage tips at the end of it for reference.

## 🔮 Show

ColorScheme: `dracula`
FontSize: `11`
Opacity: `0.9`
VimBgTransparent: `1`

![dracula](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/dracula.png)

ColorScheme: `gruvbox`
FontSize: `11`
Opacity: `0.95`
VimBgTransparent: `1`

![gruvbox](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/gruvbox.png)

ColorScheme: `iceberg`
FontSize: `11`
Opacity: `0.9`
VimBgTransparent: `1`

![iceberg](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/iceberg.png)

ColorScheme: `solarized`
FontSize: `11`
Opacity: `0.95`
VimBgTransparent: `1`

![solarized](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/solarized.png)

ColorScheme: `one`
FontSize: `11`
Opacity: `1`
VimBgTransparent: `1`

![one](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/one.png)

ColorScheme: `jellybeans`
FontSize: `12`
Opacity: `0.8`
VimBgTransparent: `0`

![jellybeans](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/jellybeans.png)

ColorScheme: `molokai`
FontSize: `12`
Opacity: `0.9`
VimBgTransparent: `1`

![molokai](https://raw.githubusercontent.com/windvalley/dotfiles/main/images/molokai.png)

## ⚖️ License

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
