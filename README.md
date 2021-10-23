# Vimhack/dotfiles 🍀

Vimhack/dotfiles is a Fantastic Development Environment,
built with [Vim][1]/[Neovim][2], [Tmux][3], [Zsh](4), [Alacritty][5]
and many other related excellent open source softwares.

The supported platforms currently are macOS and Linux.

> For efficient and convenient use of shortcuts,
> I strongly recommend using [HHKB][6] keyboard,
> or a keyboard capable of changing the key position and change <kbd>Caps</kbd> to <kbd>Ctrl</kbd>.
> <br>
> If you use MacBook, you can use [Karabiner-Elements][7]
> to modify the <kbd>Caps</kbd> to left <kbd>Ctrl</kbd> easily.

[1]: https://github.com/vim/vim
[2]: https://github.com/neovim/neovim
[3]: https://github.com/tmux/tmux
[4]: https://ohmyz.sh/
[5]: https://github.com/alacritty/alacritty
[6]: https://happyhackingkb.com/
[7]: https://github.com/pqrs-org/Karabiner-Elements

## Contents

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
    - [Print Icons](#Print-Icons)
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
  - [OhMyZsh Plugins](#OhMyZsh-Plugins)
    - [vi-mode](#vi-mode)
    - [git](#git)
    - [gitignore](#gitignore)
    - [web-search](#web-search)
    - [colorize](#colorize)
    - [sudo](#sudo)
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
  - [Tmux Plugins](#Tmux-Plugins)
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
    - [vimhack/tmux-onlinestatus](#vimhacktmux-onlinestatus)
    - [vimhack/tmux-weather](#vimhacktmux-weather)
    - [vimhack/tmux-moon-phase](#vimhacktmux-moon-phase)
  - [FQA](#FQA)
- [Vim/Neovim](#VimNeovim)
  - [Leader Key](#Leader-Key)
  - [Custom Key Bindings](#Custom-key-bindings)
    - [Tabs Management](#Tabs-management)
    - [Cursor Movement](#Cursor-movement)
    - [Text Edit](#Text-edit)
    - [Others](#Others)
  - [Custom Snippets](#Custom-Snippets)
    - [Markdown](#Markdown)
  - [Vim/Neovim Plugins](#VimNeovim-Plugins)
    - [Code AutoCompletion](#Code-AutoCompletion)
      - [neoclide/coc.nvim](#neoclidecoc.nvim)
      - [SirVer/ultisnips](#SirVerultisnips)
      - [honza/vim-snippets](#honzavim-snippets)
      - [Shougo/neco-vim](#Shougoneco-vim)
      - [neoclide/coc-neco](#neoclidecoc-neco)
      - [Raimondi/delimitMate](#RaimondidelimitMate)
    - [Code Static Check](#Code-Static-Check)
      - [dense-analysis/ale](#dense-analysisale)
    - [Code Debug](#Code-Debug)
      - [puremourning/vimspector](#puremourningvimspector)
    - [User Interface](#User-Interface)
      - [mhinz/vim-startify](#mhinzvim-startify)
      - [voldikss/vim-floaterm](#voldikssvim-floaterm)
      - [majutsushi/tagbar](#majutsushitagbar)
      - [vimhack/lightline.vim](#vimhacklightline.vim)
      - [maximbaz/lightline-ale](#maximbazlightline-ale)
      - [luochen1990/rainbow](#luochen1990rainbow)
      - [Yggdroot/indentLine](#YggdrootindentLine)
      - [machakann/vim-highlightedyank](#machakannvim-highlightedyank)
      - [unblevable/quick-scope](#unblevablequick-scope)
      - [wellle/context.vim](#welllecontext.vim)
      - [uguu-org/vim-matrix-screensaver](#uguu-orgvim-matrix-screensaver)
      - [rrethy/vim-hexokinase](#rrethyvim-hexokinase)
      - [ryanoasis/vim-devicons](#ryanoasisvim-devicons)
      - [tiagofumo/vim-nerdtree-syntax-highlight](#tiagofumovim-nerdtree-syntax-highlight)
    - [Programming Languages](#Programming-Languages)
      - [Go](#Go)
        - [fatih/vim-go](#fatihvim-go)
        - [buoto/gotests-vim](#buotogotests-vim)
      - [Rust](#Rust)
        - [rust-lang/rust.vim](#rust-langrust.vim)
        - [mhinz/vim-crates](#mhinzvim-crates)
      - [OpenResty](#OpenResty)
        - [spacewander/openresty-vim](#spacewanderopenresty-vim)
      - [JS/CSS/Vue/HTML/JSON](#JSCSSVueHTMLJSON)
        - [mattn/emmet-vim](#mattnemmet-vim)
        - [neoclide/jsonc.vim](#neoclidejsonc.vim)
      - [Markdown](#Markdown)
        - [instant-markdown/vim-instant-markdown](#instant-markdownvim-instant-markdown)
        - [dhruvasagar/vim-table-mode](#dhruvasagarvim-table-mode)
      - [Toml](#Toml)
        - [cespare/vim-toml](#cesparevim-toml)
      - [Others](#Others)
        - [sheerun/vim-polyglot](#sheerunvim-polyglot)
    - [File Navigation](#File-Navigation)
      - [preservim/nerdtree](#preservimnerdtree)
      - [Yggdroot/LeaderF](#YggdrootLeaderF)
      - [francoiscabrol/ranger.vim](#francoiscabrolranger.vim)
    - [Text Editing](#Text-Editing)
      - [mg979/vim-visual-multi](#mg979vim-visual-multi)
      - [preservim/nerdcommenter](#preservimnerdcommenter)
      - [tpope/vim-surround](#tpopevim-surround)
      - [matze/vim-move](#matzevim-move)
      - [AndrewRadev/splitjoin.vim](#AndrewRadevsplitjoin.vim)
    - [Cursor Movement](#Cursor-movement)
      - [easymotion/vim-easymotion](#easymotionvim-easymotion)
    - [Git Related](#Git-related)
      - [Xuyuanp/nerdtree-git-plugin](#Xuyuanpnerdtree-git-plugin)
      - [tpope/vim-fugitive](#tpopevim-fugitive)
      - [junegunn/gv.vim](#junegunngv.vim)
      - [rhysd/git-messenger.vim](#rhysdgit-messenger.vim)
    - [Colorschemes](#Colorschemes)
      - [dracula/vim](#draculavim)
      - [morhetz/gruvbox](#morhetzgruvbox)
      - [vimhack/molokai](#vimhackmolokai)
      - [sickill/vim-monokai](#sickillvim-monokai)
      - [lifepillar/vim-solarized8](#lifepillarvim-solarized8)
      - [rakr/vim-one](#rakrvim-one)
      - [sonph/onehalf](#sonphonehalf)
      - [cocopon/iceberg.vim](#cocoponiceberg.vim)
      - [nanotech/jellybeans.vim](#nanotechjellybeans.vim)
      - [arcticicestudio/nord-vim](#arcticicestudionord-vim)
      - [NLKNguyen/papercolor-theme](#NLKNguyenpapercolor-theme)
      - [ayu-theme/ayu-vim](#ayu-themeayu-vim)
      - [Rigellute/rigel](#Rigelluterigel)
      - [preservim/vim-colors-pencil](#preservimvim-colors-pencil)
      - [cormacrelf/vim-colors-github](#cormacrelfvim-colors-github)
      - [srcery-colors/srcery-vim](#srcery-colorssrcery-vim)
      - [rhysd/vim-color-spring-night](#rhysdvim-color-spring-night)
      - [google/vim-colorscheme-primary](#googlevim-colorscheme-primary)
      - [embark-theme/vim](#embark-themevim)
      - [chriskempson/base16-vim](#chriskempsonbase16-vim)
      - [pbrisbin/vim-colors-off](#pbrisbinvim-colors-off)
    - [Others](#Others)
      - [vim-scripts/SyntaxAttr.vim](#vim-scriptsSyntaxAttr.vim)
      - [itchyny/calendar.vim](#itchynycalendar.vim)
      - [lyokha/vim-xkbswitch](#lyokhavim-xkbswitch)
      - [tmux-plugins/vim-tmux](#tmux-pluginsvim-tmux)
      - [takac/vim-hardtime](#takacvim-hardtime)
      - [vim/killersheep](#vimkillersheep)
      - [skywind3000/asynctasks.vim](#skywind3000asynctasks.vim)
      - [skywind3000/asyncrun.vim](#skywind3000asyncrun.vim)
  - [Put Your Own Customization](#Put-Your-Own-Customization)
    - [Add More Plugins](#Add-More-Plugins)
    - [Add More Configurations](#Add-More-Configurations)
    - [Disable Default Plugins](#Disable-Default-Plugins)
- [Show](#show)
- [License](#License)

## 📦 <a name="Requirements-Installation"></a>Requirements Installation [↟](#Contents)

See [here](REQUIREMENTS.md).

## 📀 <a name="Installation"></a>Installation [↟](#Contents)

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

## 🍀 <a name="ColorschemeTheme"></a>Colorscheme/Theme [↟](#Contents)

### <a name="In-Terminal-Command-Line"></a>In Terminal Command Line [⌅](#ColorschemeTheme)

#### <a name="Change-colorscheme-of-VimNeovim-and-Alacritty"></a>Change colorscheme of Vim/Neovim and Alacritty [⌆](#In-Terminal-Command-Line)

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

#### <a name="Change-font-of-Alacritty"></a>Change font of Alacritty [⌆](#In-Terminal-Command-Line)

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

#### <a name="Change-font-size-of-Alacritty"></a>Change font size of Alacritty [⌆](#In-Terminal-Command-Line)

```sh
$ font-size

Current font size is '12', and it can be changed by:

$ font-size number

or

$ fs number

* number must between 1 and  200
```

#### <a name="Change-opacity-of-Alacritty"></a>Change opacity of Alacritty [⌆](#In-Terminal-Command-Line)

```sh
$ opacity

Current opacity is '0.9', and it can be changed by:

$ opacity number

or

$ o number

* number must between 0 and 1
```

#### <a name="Toggle-VimNeovim-background-transparent"></a>Toggle Vim/Neovim background transparent [⌆](#In-Terminal-Command-Line)

```sh
$ toggle-vim-transparent

or

$ tv
```

#### <a name="Toggle-Alacritty-background-transparent"></a>Toggle Alacritty background transparent [⌆](#In-Terminal-Command-Line)

```sh
$ toggle-alacritty-transparent

or

$ to
```

#### <a name="Print-256-colors"></a>Print 256 colors [⌆](#In-Terminal-Command-Line)

```sh
$ colors-print

or

$ c

$ print-256-hex-colors

or

$ hex
```

#### <a name="Print-Icons"></a>Print Icons [⌆](#In-Terminal-Command-Line)

```sh
$ print-icons

or

$ icons
```

### <a name="With-Keyboard-ShortcutsHotkey"></a>With Keyboard Shortcuts/Hotkey [⌅](#ColorschemeTheme)

> `ctrl a` follows is the tmux prefix key.

#### <a name="Change-colorscheme-of-VimNeovim-and-Alacritty-randomly"></a>Change colorscheme of Vim/Neovim and Alacritty randomly [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a v
```

#### <a name="Change-font-of-Alacritty-randomly"></a>Change font of Alacritty randomly [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a shift f
```

#### <a name="Toggle-Alacritty-background-transparent"></a>Toggle Alacritty background transparent [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a shift o
```

#### <a name="Increase-Alacritty-background-transparent"></a>Increase Alacritty background transparent [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a ctrl k
```

#### <a name="Decrease-Alacritty-background-transparent"></a>Decrease Alacritty background transparent [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a ctrl j
```

#### <a name="Toggle-Tmux-status-bar"></a>Toggle Tmux status bar [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a b
```

#### <a name="Toggle-Tmux-pane-border-statuspane-name"></a>Toggle Tmux pane-border-status(pane name) [⌆](#With-Keyboard-Shortcutshotkey)

```text
ctrl a ctrl b
```

### <a name="In-Vim-Normal-Mode"></a>In Vim Normal Mode [⌅](#ColorschemeTheme)

#### <a name="Toggle-VimNeovim-background-colorlight-or-dark"></a>Toggle Vim/Neovim background color(light or dark) [⌆](#In-Vim-Normal-Mode)

```text
,b
```

💡 Only support colorschemes that have both dark and light background color.

#### <a name="Toggle-VimNeovim-background-transparent"></a>Toggle Vim/Neovim background transparent [⌆](#In-Vim-Normal-Mode)

```text
,o
```

💡 Opacity of Alacritty(terminal) must be less than 1.

## 📺 <a name="Alacritty"></a>Alacritty [↟](#Contents)

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

## 🐚 <a name="ZshOhMyZsh"></a>Zsh(OhMyZsh) [↟](#Contents)

### <a name="Reload-zshrc"></a>Reload `~/.zshrc` [⌅](#zshohmyzsh)

```sh
$ omz reload
```

or

```sh
$ exec zsh
```

### <a name="fzf"></a>[fzf](https://github.com/junegunn/fzf) [⌅](#zshohmyzsh)

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

### <a name="Custom-Commands"></a>Custom Commands [⌅](#zshohmyzsh)

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

### <a name="OhMyZsh-Plugins"></a>OhMyZsh Plugins [⌅](#zshohmyzsh)

#### <a name="vi-mode"></a>vi-mode [⌆](#ohmyzsh-plugins)

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

#### <a name="git"></a>git [⌆](#ohmyzsh-plugins)

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

#### <a name="gitignore"></a>gitignore [⌆](#ohmyzsh-plugins)

> ~/.oh-my-zsh/plugins/gitignore/README.md

- `gi list`: List all the currently supported gitignore.io templates.
- `gi [TEMPLATENAME]`: Show git-ignore output on the command line, e.g. `gi java` to exclude class and package files.
- `gi [TEMPLATENAME] >> .gitignore`: Appending programming language settings to your projects .gitignore.

#### <a name="web-search"></a>web-search [⌆](#ohmyzsh-plugins)

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

#### <a name="colorize"></a>colorize [⌆](#ohmyzsh-plugins)

> ~/.oh-my-zsh/plugins/colorize/README.md

- `ccat <file> [files]`: colorize the contents of the file (or files, if more than one are provided).
  If no files are passed it will colorize the standard input.

- `cless [less-options] <file> [files]`: colorize the contents of the file (or files, if more than one are provided) and open less.
  If no files are passed it will colorize the standard input.
  The LESSOPEN and LESSCLOSE will be overwritten for this to work, but only in a local scope.

#### <a name="sudo"></a>sudo [⌆](#ohmyzsh-plugins)

> ~/.oh-my-zsh/plugins/sudo/README.md

Easily prefix your current or previous commands with `sudo` by pressing <kbd>esc</kbd> twice.

#### <a name="copyfile"></a>copyfile [⌆](#ohmyzsh-plugins)

> ~/.oh-my-zsh/plugins/copyfile/README.md

- `copyfile <filename>` : Puts the contents of a file in your system clipboard so you can paste it anywhere.

#### <a name="copydir"></a>copydir [⌆](#ohmyzsh-plugins)

> ~/.oh-my-zsh/plugins/copydir/README.md

- `copydir` : Copy the $PWD to the system clipboard.

#### <a name="aliases"></a>aliases [⌆](#ohmyzsh-plugins)

> ~/.oh-my-zsh/plugins/aliases/README.md

With lots of 3rd-party amazing aliases installed, this plugin helps list the shortcuts
that are currently available based on the plugins you have enabled.

- `acs` : Group all alias
- `acs <keyword>` : Quickly filter alias & highlight

## 🎹 <a name="Tmux"></a>Tmux [↟](#Contents)

### <a name="Prefix-Key"></a>Prefix Key [⌅](#Tmux)

Prefix Key: `Ctrl a`

All the following shortcuts keys must first press the prefix key.

> Note that after pressing the prefix key, you need to release the prefix key first,
> and then press other specific shortcut keys.

### <a name="Common"></a>Common [⌅](#Tmux)

- `?` : List key bindings
- `r` : Reload `~/.tmux.conf`
- `e` : Edit `~/.tmux.conf`
- `K` : View help documents of the object in `~/.tmux.conf`
- `d` : Detach the current client

### <a name="Session"></a>Session [⌅](#Tmux)

- `s` : Choose a session from a list
- `Option/Alt` `f` : Search session
- `Ctrl` `c` : Create new session
- `$` : Rename the current session
- `b` : Toggle status line of the current session

### <a name="Window"></a>Window [⌅](#Tmux)

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

### <a name="Pane"></a>Pane [⌅](#Tmux)

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

### <a name="Copy-Mode"></a>Copy Mode [⌅](#Tmux)

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

### <a name="Sync-mode"></a>Sync Mode [⌅](#Tmux)

- `Ctrl` `y` : Toggle sync mode

### <a name="Tmux-Plugins"></a>Tmux Plugins [⌅](#Tmux)

#### <a name="tmux-pluginstpm"></a>[tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) [⌆](#tmux-plugins)

Tmux Plugin Manager.

- `I` : Install new plugins
- `U` : Update all plugins
- `u` : Uninstall plugins that not in `~/.tmux.conf`

#### <a name="tmux-pluginstmux-prefix-highlight"></a>[tmux-plugins/tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight) [⌆](#tmux-plugins)

Plugin that highlights when you press tmux prefix key.

#### <a name="tmux-pluginstmux-resurrect"></a>[tmux-plugins/tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) [⌆](#tmux-plugins)

This plugin saves all the little details from your tmux environment so it can be completely restored after a system restart (or when you feel like it).

- `Ctrl` `s` : Save sessions
- `Ctrl` `r` : Restore sessions from local backup

#### <a name="tmux-pluginstmux-continuum"></a>[tmux-plugins/tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) [⌆](#tmux-plugins)

Continuous saving of tmux environment. Automatic restore when tmux is started.

#### <a name="tmux-pluginstmux-copycat"></a>[tmux-plugins/tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) [⌆](#tmux-plugins)

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

##### Copycat mode bindings

These are enabled when you search with copycat:

- `n` : Jumps to the next match
- `N` : Jumps to the previous match
- `enter` : Copy a highlighted match

#### <a name="tmux-pluginstmux-yank"></a>[tmux-plugins/tmux-yank](https://github.com/tmux-plugins/tmux-yank) [⌆](#tmux-plugins)

- Tmux Normal Mode
  - `y` : Copies text from the command line to the clipboard.
  - `Y` : Copy the current pane's current working directory to the clipboard.
- Tmux Copy Mode
  - `y` : Copy selection to system clipboard.
  - `Y` : Equivalent to copying a selection, and pasting it to the command line.

#### <a name="tmux-pluginstmux-open"></a>[tmux-plugins/tmux-open](https://github.com/tmux-plugins/tmux-open) [⌆](#tmux-plugins)

Plugin for opening highlighted selection directly from Tmux copy mode.

In Tmux Copy Mode:

- `o` : Open a highlighted selection with the system default program. open for OS X or xdg-open for Linux.
- `Ctrl` `o` : Open a highlighted selection with the $EDITOR
- `S` : Search the highlighted selection directly by Google
- `B` : Search the highlighted selection directly by Bing

#### <a name="ki-chitmux-inputmethod"></a>[ki-chi/tmux-inputmethod](https://github.com/ki-chi/tmux-inputmethod) [⌆](#tmux-plugins)

Display current input method in the Tmux status line.

#### <a name="vimhacktmux-show-colorscheme"></a>[vimhack/tmux-show-colorscheme](https://github.com/vimhack/tmux-show-colorscheme#main) [⌆](#tmux-plugins)

Display current colorscheme/opacity/font/font-size of Vim and Alacritty in the Tmux status line.

#### <a name="vimhacktmux-audio-volume"></a>[vimhack/tmux-audio-volume](https://github.com/vimhack/tmux-audio-volume) [⌆](#tmux-plugins)

Display system volume in the Tmux status line.

#### <a name="vimhacktmux-battery"></a>[vimhack/tmux-battery](https://github.com/vimhack/tmux-battery) [⌆](#tmux-plugins)

Display battery status in the Tmux status line.

#### <a name="vimhacktmux-cpu"></a>[vimhack/tmux-cpu](https://github.com/vimhack/tmux-cpu) [⌆](#tmux-plugins)

Display cpu utilization and fan speed in the Tmux status line.

#### <a name="vimhacktmux-onlinestatus"></a>[vimhack/tmux-onlinestatus](https://github.com/vimhack/tmux-onlinestatus) [⌆](#tmux-plugins)

Display online status in the Tmux status line.

#### <a name="vimhacktmux-weather"></a>[vimhack/tmux-weather](https://github.com/vimhack/tmux-weather) [⌆](#tmux-plugins)

Display local weather information in the Tmux status line.

#### <a name="vimhacktmux-moon-phase">[vimhack/tmux-moon-phase](https://github.com/vimhack/tmux-moon-phase) [⌆](#tmux-plugins)

Display moon phase emoji or icon or text in the Tmux status line.

### <a name="FQA"></a>FQA [⌅](#Tmux)

- In some cases, modifying `~/.tmux.conf` cannot take effect after reload or restart Tmux, how to fix it?

```sh
$ tmux kill-server
```

- Even if execute `tmux kill-server`, the new configuration still does not take effect.

```sh
$ ps axu|grep -v grep|grep tmux|awk '{print $2}'|xargs kill -9
```

## 💯 <a name="VimNeovim"></a>Vim/Neovim [↟](#Contents)

### <a name="Leader-Key"></a>Leader Key [⌅](#VimNeovim)

The vim leader key has been changed from `\`(default) to `,`.

`,` in the following shortcut keys represent the leader key.

### <a name="Custom-key-bindings"></a>Custom Key Bindings [⌅](#VimNeovim)

#### <a name="Tabs-management"></a>Tabs Management [⌆](#Custom-key-bindings)

- Normal Mode

  - `Ctrl` `t` : Create new tab
  - `,` `1`/`2`/`3`... : Go to the specific tab
  - `,` `0` : Go to the last tab
  - `Option/Alt` `1`/`2`/`3`... : Go to the specific tab
  - `Option/Alt` `0` : Go to the last tab
  - `,` `fn` : Go to the next tab
  - `,` `fp` : Go to the previous tab
  - `,` `fh` : Move the tab to the left
  - `,` `fl` : Move the tab to the right
  - `,` `qo` : Close all tabs except current one
  - `,` `qq` : Close current tab
  - `,` `q` `1`/`2`/`3` ... : Close the specific tab
  - `,` `q` `0` : Close the last tab

- Insert Mode

  - `Option/Alt` `1`/`2`/`3`... : Go to the specific tab
  - `Option/Alt` `0` : Go to the last tab

#### <a name="Cursor-movement"></a>Cursor Movement [⌆](#Custom-key-bindings)

- Normal Mode

  - `Ctrl` `k`/`j`/`h`/`l` : Move the cursor to up/down/left/right window
  - `Ctrl` `e`/`y` : Move the screen down or up by 3 lines step
  - `0` : Move the cursor to the first non-blank character,
    if already at the first character, then to the first character.

- Insert Mode

  - `Ctrl` `p`/`n`/`b`/`f` : Move the cursor to up/down/left/right
  - `Ctrl` `e` : Move the cursor to the end of the line
  - `Ctrl` `a`: Press twice for moving the cursor to the first non-blank character,
    and press twice once again for moving the cursor to the first character.
    > NOTE: Press twice coz `Ctrl` `a` is also the tmux prefix key.
  - `Option/Alt` `b`/`f` : Move the cursor to left/right by one word step

- Visual Mode

  - `0` : Move the cursor to the first non-blank character,
    if it already at the first character, then to the first character.

- Command-Line Mode

  - `Ctrl` `b`/`f` : Move the cursor to left/right
  - `Ctrl` `p`/`n` : Go through history commands from up/down
  - `Ctrl` `a`/`e` : Move the cursor to the first character or the end of the line
  - `Option/Alt` `b`/`f` : Move the cursor to left/right by one word step

#### <a name="Text-Edit"></a>Text Edit [⌆](#Custom-key-bindings)

- Insert Mode

  - `Ctrl` `h`/`l` : Delete a character from left/right
  - `Ctrl` `d` : Delete from the cursor position to the end of the line.
  - `Ctrl` `u` : Delete from the cursor position to the head of the line.
  - `Ctrl` `w` : Delete a word from left

- Visual Mode

  - `,` `)`/`]`/`}`/`"`/`'` : Surround the selected text by `)` or `]` or `}` or `"` or `'`
  - `>`/`<`: Use `>` or `<` to indent without exiting visual mode

- Command-Line Mode

  - `Ctrl` `h`/`l` : Delete a character from left/right
  - `Ctrl` `d` : Delete from the cursor position to the end of the line.
  - `Ctrl` `u` : Delete from the cursor position to the head of the line.
  - `Ctrl` `w` : Delete a word from left

#### <a name="Others"></a>Others [⌆](#Custom-key-bindings)

- Normal Mode

  - `E` : Edit `~/.vimrc` or `~/.config/nvim/init.vim` in the new split window
  - `R` : Reload `~/.vimrc` or `~/.config/nvim/init.vim`
  - `Y` : Copy from the cursor position to the end of the line
  - `Ctrl` `s`: Toggle spell check
  - `,` `z` : Zoom window
  - `,` `n` : Toggle line number
  - `,` `va` : Select all lines
  - `,` `vf` : Select from the current line to the end of line
  - `,` `vb` : Select from the current line to the first of line
  - `,` `ya` : Yank all lines
  - `,` `yf` : Yank from the current line to the end of line
  - `,` `yb` : Yank from the current line to the first of line

- Insert Mode

  - `Ctrl` `s`: Toggle spell check

- Command-Line Mode

  - `:W` : Use sudo to save

### <a name="Custom-Snippets"></a>Custom Snippets [⌅](#VimNeovim)

#### <a name="Markdown"></a>Markdown [⌆](#Custom-Snippets)

| Shortcut | Output        |
| -------- | ------------- |
| `,b`     | **Bold**      |
| `,s`     | ~~sliced~~    |
| `,i`     | _italic_      |
| `,d`     | `inline code` |
| `,c`     | `block code`  |
| `,m`     | `- [ ]`       |
| `,p`     | `![img]()`    |
| `,a`     | `[link]()`    |
| `,l`     | `---`         |
| `,1`     | # H1          |
| `,2`     | ## H2         |
| `,3`     | ### H3        |
| `,4`     | #### H4       |
| `,5`     | #### H5       |
| `,6`     | #### H6       |

`,f` : Almost every shortcut above generates a placeholder (<++>),
pressing `,f` will jump the cursor to the placeholder and delete it at the same time.

`,w` : The same as `,f`, but it will generate a blank line for you.

> **NOTE:** <br>
> All above shortcuts are in the _Vim Insert Mode_.

### <a name="VimNeovim-Plugins"></a>Vim/Neovim Plugins [⌅](#VimNeovim)

#### <a name="Code-AutoCompletion"></a>Code AutoCompletion [⌅](#VimNeovim)

##### <a name="neoclidecoc.nvim"></a>[neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) [⌆](#Code-AutoCompletion)

###### 1. Symbol description of the completion menu

```text
   [LS]  Language Server
    [S]  Snippets
   [US]  UltiSnips
   [TN]  TabNine
  [GOC]  Gocode
  [NEC]  Neco-vim
    [A]  Around
    [B]  Buffer
    [F]  File
      M  Module
      I  Interface
      S  Struct
      f  func
```

###### 2. Key bindings

- `:C` : Open ~/.vim/coc-settings.json
- `[`/`]` `g` : Navigate chunks of current buffer
- `[`/`]` `c` : Navigate conflicts of current buffer
- `,` `gd` : Show chunk diff at current position
- `,` `gc` : Show commit contains current position
- `<tab>` : Use tab for trigger completion with characters ahead and navigate
- `g` `d`/`l` : Go to definition position by create new tab way
- `g` `y` : Go to type definition
- `g` `i` : Go to implementation position
- `g` `r` : Show related items in location list, and select one to go to
- `K` : Use K to show documentation in preview window
- `,` `rn` : Symbol renaming
- `Ctrl` `f`/`b`: Scroll float windows/popups
- `<Space>` `e` : Show all coc extensions
- `<Space>` `c` : Show all coc commands
- `<Space>` `s` : Show all completion sources of the current file type
- `<Space>` `p` : Resume latest coc list

##### <a name="SirVerultisnips"></a>[SirVer/ultisnips](https://github.com/SirVer/ultisnips) [⌆](#Code-AutoCompletion)

UltiSnips is the ultimate solution for snippets in Vim.

##### <a name="honzavim-snippets"></a>[honza/vim-snippets](https://github.com/honza/vim-snippets) [⌆](#Code-AutoCompletion)

- `snippets/*` : snippets using snipMate format
- `UltiSnips/*` : snippets using UltiSnips format

##### <a name="Shougoneco-vim"></a>[Shougo/neco-vim](https://github.com/Shougo/neco-vim) [⌆](#Code-AutoCompletion)

The Vim Script completion source.

##### <a name="neoclidecoc-neco"></a>[neoclide/coc-neco](https://github.com/neoclide/coc-neco) [⌆](#Code-AutoCompletion)

Vim completon source for coc.nvim using [neco-vim](https://github.com/Shougo/neco-vim).

##### <a name="RaimondidelimitMate"></a>[Raimondi/delimitMate](https://github.com/Raimondi/delimitMate) [⌆](#Code-AutoCompletion)

Provides insert mode auto-completion for quotes, parens, brackets, etc.

### <a name="Put-Your-Own-Customization"></a>Put Your Own Customization [⌅](#VimNeovim)

#### <a name="Add-More-Plugins"></a>Add More Plugins [⌆](#Put-your-own-customization)

If you want to use other plugins that not in `$HOME/.vimrc` or `$HOME/.config/nvim/init.vim`,
you can put them in `$HOME/.vimrc.plugins.local`.

For example:

```vim
" For distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'
```

> NOTE:<br>
> Do not put other configurations in `$HOME/.vimrc.plugins.local`,
> you should put them in `$HOME/.vimrc.local`.

#### <a name="Add-More-Configurations"></a>Add More Configurations [⌆](#Put-your-own-customization)

You can put your own configurations in `$HOME/.vimrc.local`,
it will be soured at the end of `$HOME/.vimrc` or `$HOME/.config/nvim/init.vim`.

For example:

```vim
" *** For plugin 'junegunn/goyo.vim'
" doc: https://github.com/junegunn/goyo.vim
" Usage:
"   :Goyo              Toggle Goyo
"   :Goyo [dimension]  Turn on or resize Goyo
"   :Goyo!             Turn Goyo off

let g:goyo_width = 120 " default: 80
let g:goyo_height = '85%' " default: 85%
let g:goyo_linenr = 1 " default: 0

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" **********************************
```

#### <a name="Disable-Default-Plugins"></a>Disable Default Plugins [⌆](#Put-your-own-customization)

If you want to disable some plugins in `$HOME/.vimrc` or `$HOME/.config/nvim/init.vim`,
you can `UnPlug` them in `$HOME/.vimrc.plugins.local`.

For example:

```vim
" Disable input method auto switch feature.
UnPlug 'lyokha/vim-xkbswitch'
" Disable vim hardtime feature.
UnPlug 'takac/vim-hardtime'
```

## 🔮 <a name="Show"></a>Show [↟](#Contents)

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

## ⚖️ <a name="License"></a>License [↟](#Contents)

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
