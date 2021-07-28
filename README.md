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
  [neovim 0.4.0+](https://github.com/neovim/neovim)
- [tmux 3.0+](https://github.com/tmux/tmux)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [alacritty 0.8.0+](https://github.com/alacritty/alacritty)

To install, run the following from your terminal:
(please backup your existing dotfiles first)

```bash
git clone https://github.com/windvalley/dotfiles.git ~/.dotfiles

# vim
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json

# neovim
mkdir -p ~/.config/nvim && ln -sf ~/.dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

# tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# zsh
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc

# alacritty
cp ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp ~/.dotfiles/alacritty/alacritty_private.yml ~/.alacritty_private.yml
```

💡 You can go to the beginning of each dotfile to view the detailed installation steps.

To update:

```bash
cd ~/.dotfiles
git pull
```

## 📜 Tips

**Change colorscheme of Vim/Neovim and Alacritty in terminal command line:**

```text
theme

The current theme is 'dracula', and it can be changed to one of the following list:

* molokai
* rigel
* jellybeans
* base16-default-dark
* nord
* tender
* gruvbox
* one
* iceberg
* papercolor
* ayu
* ayu_mirage
* onehalfdark
* vadelma
* gruvbox_light
* one_light
* iceberg_light
* papercolor_light
* ayu_light
* onehalflight
* vadelma_light

For example, change theme to 'vadelma_light':

$ theme vadelma_light

or

$ t vadelma_light
```

💡 Light colorschemes are good in the morning or at a place with natural light.

**Change font of Alacritty in terminal command line:**

```text
The current font is 'Hack', and it can be changed to one of the following list:

* Iosevka
* FantasqueSansMono
* FiraCode
* JetBrainsMono
* CodeNewRoman
* Hasklug
* GoMono
* mononoki
* Cousine
* DaddyTimeMono
* SpaceMono
* BlexMono
* SauceCodePro
* CaskaydiaCove
* DejaVuSansMono

For example, change font to 'DejaVuSansMono':

$ font DejaVuSansMono

or

$ f DejaVuSansMono
```

**Change font size of Alacritty in terminal command line:**

```text
font-size

Current font size is '12.0', you can change by:

$ font-size number

or

$ fs number

* number should between 1.0 and  200.0
```

**Change opacity of Alacritty in terminal command line:**

```text
opacity

Current opacity is '0.9', you can change by:

$ opacity number

or

$ o number

* number should between 0.0 and 1.0
```

**Toggle Vim/Neovim background transparency in terminal command line:**

```text
vim-bgtransparent

Vim background transparency is currently enabled, to disable:

$ vim-bgtransparent 0

or

$ v 0
```

**Print 256 colors in terminal command line:**

```text
$ colors_print

or

$ c

$ rgb
```

**Toggle Vim/Neovim background color(light or dark) in Vim Normal Mode:**

```text
,b
```

💡 Support colorschemes:

- `gruvbox`
- `gruvbox_light`
- `iceberg`
- `iceberg_light`
- `one`
- `one_light`
- `papercolor`
- `papercolor_light`
- `vadelma`
- `vadelma_light`
- `onehalfdark`
- `onehalflight`

**Toggle Vim/Neovim background transparency in Vim Normal Mode:**

```text
,v
```

💡 Opacity of Alacritty(terminal) should be less than 1.

**Change colorscheme of Vim/Neovim and Alacritty randomly with hot key:**

```text
ctrl a v
```

**Toggle transparency of Alacritty with hot key:**

```text
ctrl a o
```

**Increase transparency of Alacritty with hot key:**

```text
ctrl a ctrl k
```

**Decrease transparency of Alacritty with hot key:**

```text
ctrl a ctrl j
```

**Toggle status bar of Tmux with hot key:**

```text
ctrl a b
```

💡 `ctrl a` aboves is the tmux prefix key.

**NOTE:**

_Almost every dotfile has usage tips at the end of it for reference._

## 🔮 Show

ColorScheme: `dracula`
FontSize: `12`
Opacity: `0.9`
VimBgTransparent: `1`

![dracula](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/dracula.png)

ColorScheme: `gruvbox`
FontSize: `12`
Opacity: `0.9`
VimBgTransparent: `1`

![gruvbox](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/gruvbox.png)

ColorScheme: `iceberg`
FontSize: `12`
Opacity: `0.9`
VimBgTransparent: `1`

![iceberg](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/iceberg.png)

ColorScheme: `base16-default-dark`
FontSize: `12`
Opacity: `0.9`
VimBgTransparent: `1`

![base16-default-dark](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/base16-default-dark.png)

## ⚖️ License

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
