# Windvalley's dotfiles 🍀

Windvalley/dotfiles is a Fantastic Development Environment,
built with Vim/Neovim, Tmux, Zsh, Alacritty
and many other related excellent open source softwares.

The supported platforms currently are macOS and Linux.

## 💝 Powers

- [Vim](https://github.com/vim/vim) or [Neovim](https://github.com/neovim/neovim)
- [Tmux](https://github.com/tmux/tmux)
- [Zsh](https://ohmyz.sh/)
- [Alacritty](https://github.com/alacritty/alacritty)

## 📦 Requirements Installation

See [here](REQUIREMENTS.md).

## 📀 Dotfiles Installation

To install, run the following from your terminal:
(please backup your existing dotfiles first)

```bash
# Clone windvalley/dotfiles, please make sure the target directory is '~/.dotfiles'
git clone --depth=1 https://github.com/windvalley/dotfiles.git ~/.dotfiles

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
\cp ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
\cp ~/.dotfiles/alacritty/alacritty_private.yml ~/.alacritty_private.yml
```

Then open or reopen the alacritty,
if it is the first time to run, you may need to wait a while,
because the tmux plugins are automatically installed in the background.

In addition, when vim or nvim is started,
if there are vim plugins that have been configured but not yet installed,
they will be installed automatically.

To update:

```bash
cd ~/.dotfiles
git pull
```

Enjoy it😘

## 📜 Tips

**Change colorscheme of Vim/Neovim and Alacritty in terminal command line:**

```text
colorscheme

The current colorscheme is 'dracula', and it can be changed to one of the following list:

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

For example, change colorscheme to 'vadelma_light':

$ colorscheme vadelma_light

or

$ cs vadelma_light
```

💡 Light colorschemes are good in the morning or at a place with natural light.

**Change font of Alacritty in terminal command line:**

```text
font

The current font is 'SauceCodePro_Light', and it can be changed to one of the following list:

* Hack_Regular
* Iosevka_Thin
* Iosevka_Extralight
* Iosevka_Light
* Iosevka_Regular
* Iosevka_Oblique
* FantasqueSansMono_Regular
* FiraCode_Light
* FiraCode_Regular
* FiraCode_Retina
* JetBrainsMono_Thin
* JetBrainsMono_ExtraLight
* JetBrainsMono_Light
* JetBrainsMono_Regular
* JetBrainsMono_Medium
* CodeNewRoman_Book
* Hasklug_ExtraLight
* Hasklug_Light
* Hasklug_Regular
* Hasklug_Medium
* GoMono_Book
* mononoki_Regular
* Cousine_Regular
* DaddyTimeMono_Book
* SpaceMono_Regular
* BlexMono_Thin
* BlexMono_ExtraLight
* BlexMono_Light
* BlexMono_Book
* SauceCodePro_ExtraLight
* SauceCodePro_Regular
* CaskaydiaCove_ExtraLight
* CaskaydiaCove_Light
* CaskaydiaCove_Regular
* DejaVuSansMono_Book
* DejaVuSansMono_Oblique
* Hurmit_light
* Hurmit_medium

For example, change font to 'Hurmit_medium':

$ font Hurmit_medium
```

**Change font size of Alacritty in terminal command line:**

```text
font-size

Current font size is '12.0', and it can be changed by:

$ font-size number

or

$ fs number

* number must between 1.0 and  200.0
```

**Change opacity of Alacritty in terminal command line:**

```text
opacity

Current opacity is '0.90', and it can be changed by:

$ opacity number

or

$ o number

* number must between 0.00 and 1.00
```

**Toggle Vim/Neovim background transparency in terminal command line:**

```text
vim-bgtransparency

Vim background transparency is currently enabled, to disable:

$ vim-bgtransparency 0

or

$ v 0
```

**Print 256 colors in terminal command line:**

```text
$ colors-print

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

💡 Opacity of Alacritty(terminal) must be less than 1.

**Change colorscheme of Vim/Neovim and Alacritty randomly with hot key:**

```text
ctrl a v
```

**Change font of Alacritty randomly with hot key:**

```text
ctrl a f
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
VimBgTransparency: `1`

![dracula](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/dracula.png)

ColorScheme: `gruvbox`
FontSize: `12`
Opacity: `0.9`
VimBgTransparency: `1`

![gruvbox](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/gruvbox.png)

ColorScheme: `iceberg`
FontSize: `12`
Opacity: `0.9`
VimBgTransparency: `1`

![iceberg](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/iceberg.png)

ColorScheme: `base16-default-dark`
FontSize: `12`
Opacity: `0.9`
VimBgTransparency: `1`

![base16-default-dark](https://raw.githubusercontent.com/windvalley/bigfiles/main/dotfiles/images/base16-default-dark.png)

## ⚖️ License

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
