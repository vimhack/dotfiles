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
  - [Keyboard Shortcuts](#Keyboard-Shortcuts)
- [Zsh(OhMyZsh)](#ZshOhMyZsh)
  - [Reload ~/.zshrc](#Reload-zshrc)
  - [fzf](#fzf)
  - [Custom Commands](#Custom-Commands)
    - [Adjust the system volume](#Adjust-the-system-volume)
    - [Batch ssh remote hosts in multi-tmux-panes](#Batch-ssh-remote-hosts-in-multi-tmux-panes)
  - [Plugins](#Plugins)
    - [vi-mode](#vi-mode)
    - [git](#git)
    - [gitignore](#gitignore)
    - [web-search](#web-search)
    - [colorize](#colorize)
    - [sudo](#sudo)
    - [themes](#themes)
    - [copyfile](#copyfile)
    - [copydir](#copydir)
    - [aliases](#aliases)
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

#### Keyboard Shortcuts

| Shortcut               | Action                                                   |
| ---------------------- | -------------------------------------------------------- |
| `Command` `h`          | Hide the current Alacritty terminal                      |
| `Command` `m`          | Minimize the current Alacritty to the Dock               |
| `Command` `q`/`w`      | Quit Alacritty                                           |
| `Command` `n`          | Spawn new instance of Alacritty                          |
| `Command` `f`/`b`      | Search forward or backward                               |
| `Command` `+`/`-`/`0`  | Increase/Decrease/Reset font size                        |
| `Ctrl` `Command` `f`   | Toggle full screen                                       |
| `Ctrl` `l`             | Clear warning/error messages of Alacritty in status line |
| `Command` `Option` `h` | Hiding all windows other than the current Alacritty      |

### Zsh(OhMyZsh)

#### Reload `~/.zshrc`

```sh
$ omz reload
```

or

```sh
$ exec zsh
```

#### fzf

> <https://github.com/junegunn/fzf>

- `$ ff`

  Search file by `fzf` and then open it by `vim`.

- `Ctrl t`

  List all files and dirs of the current dir, then select one and `enter`,
  it will paste the selected file name to the command line.

- `Option`/`Alt` `c`

  List all dirs of the current dir, then select one and `enter`,
  it will switch to the selected dir.

- `Ctrl` `r`

  List history commands, then input keywords and select the specific one,
  and `enter`, it will paste the selected command to the command line.

- `Ctrl` `k`/`j`

  Select up or down in file/dir list or history command list.

- `Ctrl` `p`/`n`

  The same as `Ctrl` `k`/`j`.

- `Ctrl` `c` / `Ctrl` `g` / `esc`

  Quit from file/dir list or history command list.

#### Custom Commands

##### Adjust the system volume

```sh
$ vol

Usage of audio-volume:
  digit             Set volume value, 1~100
  -p, --print       Print all audio devices
  -n, --next        Switch to the next audio device
  -i device_id      Switch to the given audio device
```

##### Batch ssh remote hosts in multi-tmux-panes

```sh
Usage:
    ssh-sessions /yourpath/tmux_window[.extension]

Content format of /yourpath/tmux_window[.extension]:
    node1.example.com
    node2.example.com
    node3.exmaple.com
    ...

Note:
    Make sure the hosts in /yourpath/tmux_window.extension
    can login without password by ssh public key authentication.

Examples:
    $ ssh-sessions ~/.xxxhosts.ssh

    or

    $ ssh-sessions ~/.xxxhosts

    or

    $ ssh-sessions ~/xxxhosts
```

#### Plugins

##### vi-mode

> ~/.oh-my-zsh/plugins/web-search/README.md

###### Enter `Normal Mode`

Use `ESC` or `CTRL-[` to enter `Normal mode`.

###### History

- `ctrl-p` : Previous command in history
- `ctrl-n` : Next command in history
- `/` : Search backward in history
- `n` : Repeat the last `/`

###### Vim edition

- `vv` : Edit current command line in Vim

###### Movement

- `$` : To the end of the line
- `^` : To the first non-blank character of the line
- `0` : To the first character of the line
- `w` : [count] words forward
- `W` : [count] WORDS forward
- `e` : Forward to the end of word [count] inclusive
- `E` : Forward to the end of WORD [count] inclusive
- `b` : [count] words backward
- `B` : [count] WORDS backward
- `t{char}` : Till before [count]'th occurrence of {char} to the right
- `T{char}` : Till before [count]'th occurrence of {char} to the left
- `f{char}` : To [count]'th occurrence of {char} to the right
- `F{char}` : To [count]'th occurrence of {char} to the left
- `;` : Repeat latest f, t, F or T [count] times
- `,` : Repeat latest f, t, F or T in opposite direction

###### Insertion

- `i` : Insert text before the cursor
- `I` : Insert text before the first character in the line
- `a` : Append text after the cursor
- `A` : Append text at the end of the line
- `o` : Insert new command line below the current one
- `O` : Insert new command line above the current one

###### Delete and Insert

- `ctrl-h` : While in _Insert mode_: delete character before the cursor
- `ctrl-w` : While in _Insert mode_: delete word before the cursor
- `d{motion}` : Delete text that {motion} moves over
- `dd` : Delete line
- `D` : Delete characters under the cursor until the end of the line
- `c{motion}` : Delete {motion} text and start insert
- `cc` : Delete line and start insert
- `C` : Delete to the end of the line and start insert
- `r{char}` : Replace the character under the cursor with {char}
- `R` : Enter replace mode: Each character replaces existing one
- `x` : Delete `count` characters under and after the cursor
- `X` : Delete `count` characters before the cursor

##### git

> ~/.oh-my-zsh/plugins/git/README.md

- `gst` : git status
- `gsh` : git show
- `ga` : git add
- `gc` : git commit -v
- `gp` : git push
- `gpf` : git push -f
- `glo` : git log --oneline --decorate
- `glog` : git log --oneline --decorate --graph
- `gl` : git pull

##### gitignore

> ~/.oh-my-zsh/plugins/gitignore/README.md

- `gi list`: List all the currently supported gitignore.io templates.
- `gi [TEMPLATENAME]`: Show git-ignore output on the command line, e.g. `gi java` to exclude class and package files.
- `gi [TEMPLATENAME] >> .gitignore`: Appending programming language settings to your projects .gitignore.

##### web-search

> ~/.oh-my-zsh/plugins/web-search/README.md

You can use the `web-search` plugin in these two forms:

- `web_search <context> <term> [more terms if you want]`
- `<context> <term> [more terms if you want]`

For example, these two are equivalent:

```sh
$ web_search google oh-my-zsh
$ google oh-my-zsh
```

Available search contexts are:

| Context               | URL                                      |
| --------------------- | ---------------------------------------- |
| `bing`                | `https://www.bing.com/search?q=`         |
| `google`              | `https://www.google.com/search?q=`       |
| `yahoo`               | `https://search.yahoo.com/search?p=`     |
| `ddg` or `duckduckgo` | `https://www.duckduckgo.com/?q=`         |
| `sp` or `startpage`   | `https://www.startpage.com/do/search?q=` |
| `yandex`              | `https://yandex.ru/yandsearch?text=`     |
| `github`              | `https://github.com/search?q=`           |
| `baidu`               | `https://www.baidu.com/s?wd=`            |
| `ecosia`              | `https://www.ecosia.org/search?q=`       |
| `goodreads`           | `https://www.goodreads.com/search?q=`    |
| `qwant`               | `https://www.qwant.com/?q=`              |
| `givero`              | `https://www.givero.com/search?q=`       |
| `stackoverflow`       | `https://stackoverflow.com/search?q=`    |
| `wolframalpha`        | `https://wolframalpha.com/input?i=`      |
| `archive`             | `https://web.archive.org/web/*/`         |
| `scholar`             | `https://scholar.google.com/scholar?q=`  |

##### colorize

> ~/.oh-my-zsh/plugins/colorize/README.md

- `ccat <file> [files]`: colorize the contents of the file (or files, if more than one are provided).
  If no files are passed it will colorize the standard input.

- `cless [less-options] <file> [files]`: colorize the contents of the file (or files, if more than one are provided) and open less.
  If no files are passed it will colorize the standard input.
  The LESSOPEN and LESSCLOSE will be overwritten for this to work, but only in a local scope.

##### sudo

> ~/.oh-my-zsh/plugins/sudo/README.md

Easily prefix your current or previous commands with `sudo` by pressing <kbd>esc</kbd> twice.

##### themes

> ~/.oh-my-zsh/plugins/themes/README.md

- `theme <theme_name>` : Changes the Zsh theme to specified theme.

- `theme` : Changes the Zsh theme to some random theme.

- `lstheme` : Lists installed Zsh themes.

##### copyfile

> ~/.oh-my-zsh/plugins/copyfile/README.md

- `copyfile <filename>` : Puts the contents of a file in your system clipboard so you can paste it anywhere.

##### copydir

> ~/.oh-my-zsh/plugins/copydir/README.md

- `copydir` : Copy the $PWD to the system clipboard.

##### aliases

> ~/.oh-my-zsh/plugins/aliases/README.md

With lots of 3rd-party amazing aliases installed, this plugin helps list the shortcuts
that are currently available based on the plugins you have enabled.

- `acs` : Group all alias
- `acs <keyword>` : Quickly filter alias & highlight

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
