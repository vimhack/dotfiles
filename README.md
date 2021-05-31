# Windvalley's dotfiles 🍀

This is my personal development environment focusing on
Go, Python, OpenResty/Lua, Bash and JavaScript programming.

## 💝 Powers

- [Vim](https://github.com/vim/vim)
- [Tmux](https://github.com/tmux/tmux)
- [Zsh](https://ohmyz.sh/)
- [Ranger](https://github.com/ranger/ranger)
- [Alacritty](https://github.com/alacritty/alacritty)

## 📀 Installation

Requirements:

- [vim 8.2+](https://github.com/vim/vim) or
  [MacVim](https://github.com/macvim-dev/macvim)(for macOS only)
- [tmux 3.0+](https://github.com/tmux/tmux)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [alacritty](https://github.com/alacritty/alacritty)
- [ranger](https://github.com/ranger/ranger)

To install, run the following from your terminal:
(please backup your existing dotfiles first)

```bash
$ git clone https://github.com/windvalley/dotfiles.git ~/.dotfiles

$ ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
$ ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
$ ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
$ ln -sf ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
$ ln -sf ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

$ cp ~/.dotfiles/alacritty/alacritty_private.yml ~/.alacritty_private.yml
```

💡 You can go to the beginning of each dotfile to view the detailed installation steps.

To update:

```bash
$ cd ~/.dotfiles
$ git pull
```

## 📜 Tips

Almost every dotfile has usage tips at the end of it for reference.

## 🔮 Show

![show](images/show.png)

## ⚖️ License

This project is under the MIT License.
See the [LICENSE](LICENSE) file for the full license text.
