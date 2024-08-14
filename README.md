# My dot files


## Install
First install the useful package from the appropriate file in ./packages

Add the following to `/etc/zsh/zshenv` on your systemes or  `$ZDOTDIR/.zshenv` on shared system.
This will update configuration directory. You can also run those command in your current terminal

```
# XDG Variable
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$ZDOTDIR"/.zsh_history
```

Clone this repository in `~/.local/share`
```
git clone --recursive https://github.com/riyoth/dotfile.git "${XDG_DATA_HOME}/dotfiles"
```

For a server with no UI
```
stow -t ~ nvim git zsh bash tmux screen
```

For a workstation with UI
```
stow -t ~ nvim git zsh bash tmux screen alacritty
```

### Zsh

Install Prezto with the following command:
```
git clone --recursive https://github.com/riyoth/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

### Alacritty
The configuration refere to theme from github. To install themes:

```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Some of the config are different between OSX and Arch, you can hardlink the appropriate configuration to activate it.
```
ln ~/.config/alacritty/_arch.toml ~/.config/alacritty/arch.toml
ln ~/.config/alacritty/_osx.toml ~/.config/alacritty/osx.toml
```
 
### Neovim

To install my config clone, make sure you have the following install:
 - git, make, unzip and gcc
 - ripgrep
 - Nerd font

```
git clone https://github.com/riyoth/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### Mac OSX
You can run the command `osx/setup.sh` to configure OSX my way. This include:

 * Move the dock to the left, reduce the size and hide it
 * Configure right bottom hot corner to lock
 * Disable mouse natural scroll and increase mouse acceleration


