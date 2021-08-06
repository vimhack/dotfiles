# Requirements Installation

Install requirements for windvalley/dotfiles.

## For MacOS

### Vim/Neovim

- Vim 8.2+ and [Neovim 0.4.0+](https://github.com/neovim/neovim)

```bash
brew install cmake python poetry mono go ruby lua@5.3 nodejs yarn ctags rg

brew install macvim

brew install neovim
pip3 install neovim
```

- xkbswitch-macosx

```bash
git clone --depth=1 https://github.com/myshov/xkbswitch-macosx.git
cp xkbswitch-macosx/bin/xkbswitch /usr/local/bin/

git clone --depth=1 https://github.com/myshov/libxkbswitch-macosx
cp libxkbswitch-macosx/bin/libxkbswitch.dylib /usr/local/lib/
```

- ale linters

```bash
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

```bash
npm install -g prettier importjs lua-fmt
pip3 install black isort
go get mvdan.cc/sh/v3/cmd/shfmt
```

### Tmux

- [tmux 3.0+](https://github.com/tmux/tmux)

```bash
brew install tmux
```

- iStats

```bash
# For showing cpu temperature and fan speed in the tmux status bar.
sudo gem install iStats
```

### Zsh

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- zsh-autosuggestions

```bash
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting

```bash
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

### Alacritty

- [alacritty 0.8.0+](https://github.com/alacritty/alacritty)

```bash
brew install alacritty
```

- Install fonts

```bash
git clone --depth=1 https://github.com/windvalley/nerd-fonts-patched.git

cd nerd-fonts-patched/patched-fonts

./install.sh
```

## For Linux
