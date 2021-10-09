# Vimhack/dotfiles 🍀

Vimhack/dotfiles is a Fantastic Development Environment,
built with Vim/Neovim, Tmux, Zsh, Alacritty
and many other related excellent open source softwares.

The supported platforms currently are macOS and Linux.

> NOTE:<br>
> For efficient and convenient use of shortcuts,
> I strongly recommend using [HHKB](https://happyhackingkb.com/) keyboard,
> or a keyboard capable of changing the key position and change <kbd>Caps</kbd> to <kbd>Ctrl</kbd>.

## Contents

- [Powers](#Powers)
- [Requirements Installation](#Requirements-Installation)
- [Installation](#Installation)
- [Colorscheme/Theme](#ColorschemeTheme)
  - [In Terminal Command Line](#In-Terminal-Command-Line)
    - [Change colorscheme of Vim/Neovim and Alacritty](#Change-colorscheme-of-VimNeovim-and-Alacritty)
    - [Change font of Alacritty](#Change-font-of-Alacritty)
    - [Change font size of Alacritty](#Change-font-size-of-Alacritty)
    - [Change opacity of Alacritty](#Change-opacity-of-Alacritty)
    - [Toggle Vim/Neovim background transparent](#Toggle-VimNeovim-background-transparent)
    - [Toggle Alacritty background transparent](#Toggle-Alacritty-background-transparent)
    - [Print 256 colors](#Print-256-colors)
  - [With Keyboard Shortcuts/Hotkey](#With-Keyboard-shortcutsHotkey)
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
  - [Prefix Key](#Prefix-key)
  - [Common](#Common)
  - [Session](#Session)
  - [Window](#Window)
  - [Pane](#Pane)
  - [Copy Mode](#Copy-Mode)
  - [Sync Mode](#Sync-Mode)
  - [Plugins](#Plugins)
    - [tmux-plugins/tpm](#tmux-pluginstpm)
    - [tmux-plugins/tmux-prefix-highlight](#tmux-pluginstmux-prefix-highlight)
    - [tmux-plugins/tmux-resurrect](#tmux-pluginstmux-resurrect)
    - [tmux-plugins/tmux-continuum](#tmux-pluginstmux-continuum)
    - [tmux-plugins/tmux-copycat](#tmux-pluginstmux-copycat)
    - [tmux-plugins/tmux-yank](#tmux-pluginstmux-yank)
    - [tmux-plugins/tmux-open](#tmux-pluginstmux-open)
    - [ki-chi/tmux-inputmethod](#ki-chitmux-inputmethod)
    - [vimhack/tmux-show-colorscheme](#vimhacktmux-show-colorscheme)
    - [vimhack/tmux-audio-volume](#vimhacktmux-audio-volume)
    - [vimhack/tmux-battery](#vimhacktmux-battery)
    - [vimhack/tmux-cpu](#vimhacktmux-cpu)
    - [vimhack/tmux-weather](#vimhacktmux-weather)
  - [FQA](#FQA)
- [Vim/Neovim](#VimNeovim)
- [Show](#show)
- [License](#License)

## 💝 Powers [↟](#Contents)

- [Vim](https://github.com/vim/vim) or [Neovim](https://github.com/neovim/neovim)
- [Tmux](https://github.com/tmux/tmux)
- [Zsh](https://ohmyz.sh/)
- [Alacritty](https://github.com/alacritty/alacritty)

## 📦 Requirements Installation [↟](#Contents)

See [here](REQUIREMENTS.md).

## 📀 Installation [↟](#Contents)

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

## 🍀 Colorscheme/Theme [↟](#Contents)

### In Terminal Command Line

#### Change colorscheme of Vim/Neovim and Alacritty

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

#### Change font of Alacritty

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

#### Change font size of Alacritty

```sh
$ font-size

Current font size is '12', and it can be changed by:

$ font-size number

or

$ fs number

* number must between 1 and  200
```

#### Change opacity of Alacritty

```sh
$ opacity

Current opacity is '0.9', and it can be changed by:

$ opacity number

or

$ o number

* number must between 0 and 1
```

#### Toggle Vim/Neovim background transparent

```sh
$ toggle-vim-transparent

or

$ tv
```

#### Toggle Alacritty background transparent

```sh
$ toggle-alacritty-transparent

or

$ to
```

#### Print 256 colors

```sh
$ colors-print

or

$ c

$ print-256-hex-colors

or

$ hex
```

### With Keyboard Shortcuts/Hotkey

> `ctrl a` follows is the tmux prefix key.

#### Change colorscheme of Vim/Neovim and Alacritty randomly

```text
ctrl a v
```

#### Change font of Alacritty randomly

```text
ctrl a shift f
```

#### Toggle Alacritty background transparent

```text
ctrl a shift o
```

#### Increase Alacritty background transparent

```text
ctrl a ctrl k
```

#### Decrease Alacritty background transparent

```text
ctrl a ctrl j
```

#### Toggle Tmux status bar

```text
ctrl a b
```

#### Toggle Tmux pane-border-status(pane name)

```text
ctrl a ctrl b
```

### In Vim Normal Mode

#### Toggle Vim/Neovim background color(light or dark)

```text
,b
```

💡 Only support colorschemes that have both dark and light background color.

#### Toggle Vim/Neovim background transparent

```text
,o
```

💡 Opacity of Alacritty(terminal) must be less than 1.

## 📺 Alacritty [↟](#Contents)

### Keyboard Shortcuts

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

## 🐚 Zsh(OhMyZsh) [↟](#Contents)

### Reload `~/.zshrc`

```sh
$ omz reload
```

or

```sh
$ exec zsh
```

### [fzf](https://github.com/junegunn/fzf)

- `$ ff`

  Search file by `fzf` and then open it by `vim`.

- `Ctrl` `t`

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

### Custom Commands

#### Adjust the system volume

```sh
$ vol

Usage of audio-volume:
  digit             Set volume value, 1~100
  -p, --print       Print all audio devices
  -n, --next        Switch to the next audio device
  -i device_id      Switch to the given audio device
```

#### Batch ssh remote hosts in multi-tmux-panes

```sh
$ s

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

### Plugins

#### vi-mode

> ~/.oh-my-zsh/plugins/web-search/README.md

##### Enter `Normal Mode`

First of all, use <kbd>esc</kbd> or `Ctrl [` to enter `Normal mode`.

##### History

- `ctrl` `p` : Previous command in history
- `ctrl` `n` : Next command in history
- `/` : Search backward in history
- `n` : Repeat the last `/`

##### Vim edition

- `vv` : Edit current command line in Vim

##### Movement

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

##### Insertion

- `i` : Insert text before the cursor
- `I` : Insert text before the first character in the line
- `a` : Append text after the cursor
- `A` : Append text at the end of the line
- `o` : Insert new command line below the current one
- `O` : Insert new command line above the current one

##### Delete and Insert

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

#### git

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

#### gitignore

> ~/.oh-my-zsh/plugins/gitignore/README.md

- `gi list`: List all the currently supported gitignore.io templates.
- `gi [TEMPLATENAME]`: Show git-ignore output on the command line, e.g. `gi java` to exclude class and package files.
- `gi [TEMPLATENAME] >> .gitignore`: Appending programming language settings to your projects .gitignore.

#### web-search

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

#### colorize

> ~/.oh-my-zsh/plugins/colorize/README.md

- `ccat <file> [files]`: colorize the contents of the file (or files, if more than one are provided).
  If no files are passed it will colorize the standard input.

- `cless [less-options] <file> [files]`: colorize the contents of the file (or files, if more than one are provided) and open less.
  If no files are passed it will colorize the standard input.
  The LESSOPEN and LESSCLOSE will be overwritten for this to work, but only in a local scope.

#### sudo

> ~/.oh-my-zsh/plugins/sudo/README.md

Easily prefix your current or previous commands with `sudo` by pressing <kbd>esc</kbd> twice.

#### themes

> ~/.oh-my-zsh/plugins/themes/README.md

- `theme <theme_name>` : Changes the Zsh theme to specified theme.

- `theme` : Changes the Zsh theme to some random theme.

- `lstheme` : Lists installed Zsh themes.

#### copyfile

> ~/.oh-my-zsh/plugins/copyfile/README.md

- `copyfile <filename>` : Puts the contents of a file in your system clipboard so you can paste it anywhere.

#### copydir

> ~/.oh-my-zsh/plugins/copydir/README.md

- `copydir` : Copy the $PWD to the system clipboard.

#### aliases

> ~/.oh-my-zsh/plugins/aliases/README.md

With lots of 3rd-party amazing aliases installed, this plugin helps list the shortcuts
that are currently available based on the plugins you have enabled.

- `acs` : Group all alias
- `acs <keyword>` : Quickly filter alias & highlight

## 🎹 Tmux [↟](#Contents)

### Prefix Key

Prefix Key: `Ctrl a`

All the following shortcuts keys must first press the prefix key.

> Note that after pressing the prefix key, you need to release the prefix key first,
> and then press other specific shortcut keys.

### Common

- `?` : List key bindings
- `r` : Reload `~/.tmux.conf`
- `e` : Edit `~/.tmux.conf`
- `K` : View help documents of the object in `~/.tmux.conf`
- `d` : Detach the current client

### Session

- `s` : Choose a session from a list
- `Option/Alt` `f` : Search session
- `Ctrl` `c` : Create new session
- `$` : Rename the current session
- `b` : Toggle status line of the current session

### Window

- `c` : Create new window
- `,` : Rename current window
- `.` : Move current window
- `n` : Select the next window
- `p` : Select the previous window
- `0-9`: Select window 0-9
- `&` : Kill current window
- `w` : Choose a window from a list
- `f` : Search window
- `i` : Display window information

### Pane

- `%` : Split window horizontally
- `"` : Split window vertically
- `<Space>` : Select next layout
- `Ctrl` `E` : Spread panes out evenly
- `x` : Kill the active pane
- `z` : Zoom the active pane
- `{` / `<` : Swap the active pane with the pane above
- `}` / `>` : Swap the active pane with the pane below
- `q` : Display pane numbers(it will also display a letter if the number gather than 10),
  then press the specified number(or letter) to select it.
- `t` : Show a clock in current pane
- `!` : Break pane to a new window
- `;` : Move to the previously active pane
- `k` : Select the pane above the active pane
- `j` : Select the pane below the active pane
- `h` : Select the pane to the left of the active pane
- `l` : Select the pane to the right of the active pane
- `o` : Select the next pane
- `Ctrl` `o` : Rotate through the panes
- `Option/Alt` `o` : Rotate through the panes in reverse
- `m` : Toggle the marked pane
- `K` : Resize the pane up
- `J` : Resize the pane down
- `H` : Resize the pane left
- `L` : Resize the pane right
- `Ctrl` `l` : Clear all the messages(include history messages) in the active pane
- `Ctrl` `b` : Toggle pane name of the current window's all panes

### Copy Mode

- `[` : Enter copy mode
- `]` : Paste the most recent paste buffer

**NOTE**: The followings is the operations after entered copy mode, **no need** to press the Prefix Key first.

- `q` : Exit from copy mode
- `hjhl` : Movements
- `v` : Text select
- `V` : Text line select
- `Ctrl` `v` : Text block select
- `enter`: Copy the selected text
- `esc` : Escape from text selected
- `/` : Search down
- `?` : Search up

Enabled `vi-mode`, many vi shortcuts can be used in this scenario.

### Sync Mode

- `Ctrl` `y` : Toggle sync mode

### Plugins

#### [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)

Tmux Plugin Manager.

- `I` : Install new plugins
- `U` : Update all plugins
- `u` : Uninstall plugins that not in `~/.tmux.conf`

#### [tmux-plugins/tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)

Plugin that highlights when you press tmux prefix key.

#### [tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)

This plugin saves all the little details from your tmux environment so it can be completely restored after a system restart (or when you feel like it).

- `Ctrl` `s` : Save sessions
- `Ctrl` `r` : Restore sessions from local backup

#### [tmux-plugins/tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

Continuous saving of tmux environment. Automatic restore when tmux is started.

#### [tmux-plugins/tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)

##### Search

- `/` : Regex search (strings work too)

  Example search entries:

  - `foo` : Searches for string foo
  - `[0-9]+` : Regex search for numbers

##### Predefined searches

- `Ctrl` `f` : Simple file search
- `Ctrl` `g` : Jumping over git status files (best used after git status command: `git status -sb`)
- `Ctrl` `h` : Jumping over SHA-1/SHA-256 hashes (best used after git log command)
- `Ctrl` `u` : URL search (http, ftp and git urls)
- `Ctrl` `d` : Number search (mnemonic d, as digit)
- `Ctrl` `i` : IP address search
- `S` : Jumping over string surrounded by `""`

These start "copycat mode" and jump to first match.

##### `Copycat mode` bindings

These are enabled when you search with copycat:

- `n` : Jumps to the next match
- `N` : Jumps to the previous match
- `enter` : Copy a highlighted match

#### [tmux-plugins/tmux-yank](https://github.com/tmux-plugins/tmux-yank)

- Tmux Normal Mode
  - `y` : Copies text from the command line to the clipboard.
  - `Y` : Copy the current pane's current working directory to the clipboard.
- Tmux Copy Mode
  - `y` : Copy selection to system clipboard.
  - `Y` : Equivalent to copying a selection, and pasting it to the command line.

#### [tmux-plugins/tmux-open](https://github.com/tmux-plugins/tmux-open)

Plugin for opening highlighted selection directly from Tmux copy mode.

In Tmux Copy Mode:

- `o` : Open a highlighted selection with the system default program. open for OS X or xdg-open for Linux.
- `Ctrl` `o` : Open a highlighted selection with the $EDITOR
- `S` : Search the highlighted selection directly by Google
- `B` : Search the highlighted selection directly by Bing

#### [ki-chi/tmux-inputmethod](https://github.com/ki-chi/tmux-inputmethod)

Display current input method in the Tmux status line.

#### [vimhack/tmux-show-colorscheme](https://github.com/vimhack/tmux-show-colorscheme#main)

Display current colorscheme/opacity/font/font-size of Vim and Alacritty in the Tmux status line.

#### [vimhack/tmux-audio-volume](https://github.com/vimhack/tmux-audio-volume)

Display system volume in the Tmux status line.

#### [vimhack/tmux-battery](https://github.com/vimhack/tmux-battery)

Display battery status in the Tmux status line.

#### [vimhack/tmux-cpu](https://github.com/vimhack/tmux-cpu)

Display cpu utilization and fan speed in the Tmux status line.

#### [vimhack/tmux-weather](https://github.com/vimhack/tmux-weather)

Display local weather information in the Tmux status line.

### FQA

- In some cases, modifying `~/.tmux.conf` cannot take effect after reload or restart Tmux, how to fix it?

```sh
$ tmux kill-server
```

- Even if execute `tmux kill-server`, the new configuration still does not take effect.

```sh
$ ps axu|grep -v grep|grep tmux|awk '{print $2}'|xargs kill -9
```

## 💯 Vim/Neovim [↟](#Contents)

## 🔮 Show [↟](#Contents)

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

## ⚖️ License [↟](#Contents)

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
