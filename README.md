# Vimhack/dotfiles 🍀

Vimhack/dotfiles is a Fantastic Development Environment,
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

```sh
# Make sure the target directory is '~/.dotfiles'
git clone --depth=1 https://github.com/vimhack/dotfiles.git ~/.dotfiles

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

```sh
cd ~/.dotfiles
git pull
```

Enjoy it😘

## 📜 Tips

- [Colorscheme/Theme](#ColorschemeTheme)
  - [In Terminal Command Line](#In-Terminal-Command-Line)
    - [Change colorscheme of Vim/Neovim and Alacritty](#Change-colorscheme-of-VimNeovim-and-Alacritty)
    - [Change font of Alacritty](#Change-font-of-Alacritty)
    - [Change font size of Alacritty](#Change-font-size-of-Alacritty)
    - [Change opacity of Alacritty](#Change-opacity-of-Alacritty)
    - [Toggle Vim/Neovim background transparent](#Toggle-VimNeovim-background-transparent)
    - [Toggle Alacritty background transparent](#Toggle-Alacritty-background-transparent)
    - [Print 256 colors](#Print-256-colors)
  - [With Keyboard Shortcuts/Hot key](#With-Keyboard-shortcutsHot-key)
    - [Change colorscheme of Vim/Neovim and Alacritty randomly](#Change-colorscheme-of-VimNeovim-and-Alacritty-randomly)
    - [Change font of Alacritty randomly](#Change-font-of-Alacritty-randomly)
    - [Toggle Alacritty background transparent](#Toggle-Alacritty-background-transparent)
    - [Increase Alacritty background transparent](#Increase-Alacritty-background-transparent)
    - [Decrease Alacritty background transparent](#Decrease-Alacritty-background-transparent)
    - [Toggle Tmux status bar](#Toggle-Tmux-status-bar)
    - [Toggle Tmux pane-border-status(pane name)](#Toggle-Tmux-pane-border-statuspane-name)
  - [In Vim Normal Mode](#In-Vim-Normal-Mode)
    - [Toggle Vim/Neovim background color(light or dark)](#Toggle-VimNeovim-background-colorlight-or-dark)
    - [Toggle Vim/Neovim background transparent](#Toggle-VimNeovim-background-transparent)
- [Alacritty](#Alacritty)
- [Zsh(OhMyZsh)](#ZshOhMyZsh)
- [Tmux](#Tmux)
- [Vim/Neovim](#VimNeovim)

### Colorscheme/Theme

#### In Terminal Command Line

##### Change colorscheme of Vim/Neovim and Alacritty

```sh
$ colorscheme

Current colorscheme is 'dracula', and it can be changed to one of the following list:

* gruvbox
* solarized
* molokai
* monokai
* rigel
* jellybeans
* nord
* tender
* one
* iceberg
* papercolor
* ayu
* ayu_mirage
* onehalf
* vadelma
* pencil
* srcery
* springnight
* google
* github
* embark
* off
* base16
* flat
* materia
* atelierdune
* oceanicnext
* gruvbox_light
* solarized_light
* one_light
* iceberg_light
* papercolor_light
* ayu_light
* onehalf_light
* vadelma_light
* pencil_light
* google_light
* github_light
* off_light
* cupertino
* atelierdune_light

For example, change colorscheme to 'atelierdune_light':

$ colorscheme atelierdune_light

or

$ cs atelierdune_light
```

💡 Light colorschemes are good in the morning or at a place with natural light.

##### Change font of Alacritty

```sh
$ font

Current font is 'Hasklug_Light', and it can be changed to one of the following list:

* Hack_Regular
* BlexMono_Book
* BlexMono_Light
* BlexMono_ExtraLight
* BlexMono_Thin
* SauceCodePro_Regular
* SauceCodePro_Light
* SauceCodePro_ExtraLight
* JetBrainsMono_Regular
* JetBrainsMono_Light
* JetBrainsMono_ExtraLight
* JetBrainsMono_Thin
* RobotoMono_Regular
* RobotoMono_Light
* RobotoMono_Thin
* Hasklug_Regular
* Hasklug_ExtraLight
* VictorMono_Regular
* VictorMono_Light
* VictorMono_ExtraLight
* VictorMono_Thin
* FantasqueSansMono_Regular
* LiterationMono_Book
* Lekton_Regular
* DejaVuSansMono_Book
* GoMono_Book
* mononoki_Regular
* Cousine_Regular
* SpaceMono_Regular
* UbuntuMono_Regular
* CodeNewRoman_Book
* CaskaydiaCove_Regular
* CaskaydiaCove_Light
* CaskaydiaCove_SemiLight
* CaskaydiaCove_ExtraLight
* FiraCode_Regular
* FiraCode_Light
* Hurmit_light
* DaddyTimeMono_Book
* OpenDyslexicMono_Regular
* Monofur_Book

For example, change font to 'Monofur_Book':

$ font Monofur_Book

or

$ ft Monofur_Book
```

##### Change font size of Alacritty

```sh
$ font-size

Current font size is '12', and it can be changed by:

$ font-size number

or

$ fs number

* number must between 1 and  200
```

##### Change opacity of Alacritty

```sh
$ opacity

Current opacity is '0.9', and it can be changed by:

$ opacity number

or

$ o number

* number must between 0 and 1
```

##### Toggle Vim/Neovim background transparent

```sh
$ toggle-vim-transparent

or

$ tv
```

##### Toggle Alacritty background transparent

```sh
$ toggle-alacritty-transparent

or

$ to
```

##### Print 256 colors

```sh
$ colors-print

or

$ c

$ print-256-hex-colors

or

$ hex
```

#### With Keyboard Shortcuts/Hot key

> `ctrl a` follows is the tmux prefix key.

##### Change colorscheme of Vim/Neovim and Alacritty randomly

```text
ctrl a v
```

##### Change font of Alacritty randomly

```text
ctrl a shift f
```

##### Toggle Alacritty background transparent

```text
ctrl a shift o
```

##### Increase Alacritty background transparent

```text
ctrl a ctrl k
```

##### Decrease Alacritty background transparent

```text
ctrl a ctrl j
```

##### Toggle Tmux status bar

```text
ctrl a b
```

##### Toggle Tmux pane-border-status(pane name)

```text
ctrl a ctrl b
```

#### In Vim Normal Mode

##### Toggle Vim/Neovim background color(light or dark)

```text
,b
```

💡 Only support colorschemes that have both dark and light background color.

##### Toggle Vim/Neovim background transparent

```text
,o
```

💡 Opacity of Alacritty(terminal) must be less than 1.

### Alacritty

### Zsh(OhMyZsh)

### Tmux

### Vim/Neovim

## 🔮 Show

ColorScheme: `gruvbox`
Opacity: `0.9`
Font: `Hasklug_Light`
FontSize: `12`
VimBgTransparency: `1`

![gruvbox](https://user-images.githubusercontent.com/6139938/131994883-47e0c72f-2a34-401d-acfe-0759a6c592e8.png)

ColorScheme: `dracula`
Opacity: `1`
Font: `Hurmit_light`
FontSize: `11`
VimBgTransparency: `1`

![dracula](https://user-images.githubusercontent.com/6139938/132120978-b1ec27f1-f79d-492f-955f-76dffd2c1e00.png)

ColorScheme: `papercolor`
Opacity: `0.85`
Font: `Lekton_Regular`
FontSize: `11.5`
VimBgTransparency: `1`

![papercolor](https://user-images.githubusercontent.com/6139938/132120994-61a63c06-03a3-4c96-996b-bf84b52cc039.png)

## ⚖️ License

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
