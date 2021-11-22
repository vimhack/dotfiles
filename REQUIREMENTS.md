# Requirements Installation

Install requirements for vimhack/dotfiles.

## For MacOS

Install homebrew first if you have not installed homebrew:

```sh
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install necessary packages:

```sh
brew install python poetry go ruby lua@5.3 nodejs
brew install cmake mono yarn ctags rg gsed
```

### Zsh

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- zsh-autosuggestions

```sh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting

```sh
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- powerlevel10k

```sh
git clone --depth=1 https://github.com/vimhack/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

ln -sf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/p10k.zsh $HOME/.p10k.zsh
```

- [fzf](https://github.com/junegunn/fzf)

```sh
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

```sh
# For replace ls
# doc: https://the.exa.website
brew install exa
```

### Vim/Neovim

- [Vim 8.2+](https://github.com/vim/vim)

```sh
export PATH="/usr/local/opt/python3/bin:$PATH"

brew install macvim
```

- [Neovim 0.6+](https://github.com/neovim/neovim)

```sh
export PATH="/usr/local/opt/python3/bin:$PATH"

brew install --HEAD luajit
brew install --HEAD neovim

pip3 install neovim
```

- xkbswitch-macosx

```sh
git clone --depth=1 https://github.com/myshov/xkbswitch-macosx.git
cp xkbswitch-macosx/bin/xkbswitch /usr/local/bin/

git clone --depth=1 https://github.com/myshov/libxkbswitch-macosx
cp libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/lib/
```

- ale linters

```sh
brew install golangci-lint lua luarocks tidy-html5 shellcheck jq

luarocks install luacheck

npm install -g eslint standard eslint-plugin-vue vls \
    proselint alex write-good stylelint markdownlint jsonlint

pip3 install pylint flake8 yamllint

go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.39.0
go get -u github.com/mgechev/revive

sudo gem install mdl
```

- ale fixers

```sh
npm install -g prettier importjs lua-fmt
pip3 install black isort
go get mvdan.cc/sh/v3/cmd/shfmt
```

### Tmux

- [tmux 3.0+](https://github.com/tmux/tmux)

```sh
brew install tmux
```

- iStats

```sh
# For showing cpu temperature and fan speed in the tmux status bar.
sudo gem install iStats
```

- switchaudio-osx

```sh
# For showing audio volume status in the tmux status bar.
brew install switchaudio-osx
```

### Alacritty

- [alacritty 0.8.0+](https://github.com/alacritty/alacritty)

```sh
brew install alacritty
```

- Install fonts

```sh
git clone --depth=1 https://github.com/vimhack/nerd-fonts-patched.git

cd nerd-fonts-patched

./install.sh
```

## For Linux
