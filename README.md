# My dot files


## Install

Before anything else, set the XDG variables so all tools write to the right locations. Add the following to `/etc/zsh/zshenv` on your system or `$ZDOTDIR/.zshenv` on a shared system, then reload your shell (or export them in your current terminal):

```
# XDG Variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$ZDOTDIR"/.zsh_history
```

Then install the useful packages from the appropriate file in `./packages`.

Clone this repository in `~/.local/share`:
```
git clone --recursive https://github.com/riyoth/dotfile.git "${XDG_DATA_HOME}/dotfiles"
```

For a server with no UI:
```
stow -t ~ git zsh2 bash tmux screen utils
```

For a workstation with UI:
```
stow -t ~ git zsh2 bash tmux screen utils alacritty
```

### Zsh

Install the required packages for your platform:

**macOS:**
```
brew bundle --file packages/osx-brew
brew bundle --file packages/zsh-brew
```

**Arch Linux:**
```
pacman -S $(cat packages/arch-headless packages/zsh-arch)
```

**Fedora:**
```
dnf install $(cat packages/fedora-ui packages/zsh-fedora)
```

Then deploy the zsh config:
```
stow -t ~ zsh2
```

### Alacritty
The configuration refers to themes from GitHub. To install themes:

```
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Some configs differ between OSX and Arch. Hardlink the appropriate configuration to activate it:
```
ln ~/.config/alacritty/_arch.toml ~/.config/alacritty/arch.toml
ln ~/.config/alacritty/_osx.toml ~/.config/alacritty/osx.toml
```

### Neovim

To install my config, make sure you have the following installed:
 - git, make, unzip and gcc
 - ripgrep
 - Nerd font

```
git clone https://github.com/riyoth/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

### IdeaVim

IdeaVim configuration for JetBrains IDEs (e.g. PyCharm) is managed via stow:
```
stow -t ~ ideavim
```

This links `~/.ideavimrc` and `~/.config/ideavim/ideavimrc`.

### uv

Python toolchain configuration for [uv](https://github.com/astral-sh/uv):
```
stow -t ~ uv
```

This links `~/.config/uv/uv.toml` and a helper script `uv-codeartifact` for authenticating with AWS CodeArtifact. Sample configs are provided in `.config/uv/*.sample`.

A list of global uv tools is maintained in `packages/uv-tools.txt` and can be installed via:
```
bash packages/uv-tools.txt
```

### Karabiner Elements

Keyboard remapping configuration for [Karabiner-Elements](https://karabiner-elements.pqrs.org/) on macOS. To install:
```
mkdir -p ~/.config/karabiner
stow -t ~ karabiner
```

### Mac OSX

You can run `osx/setup.sh` to configure macOS my way. This includes:

 * Move the dock to the left, reduce the size and hide it
 * Configure bottom-right hot corner to lock the screen
 * Disable mouse natural scroll and increase mouse acceleration
 * Fix Bluetooth/Wi-Fi coexistence lag with wireless peripherals
 * Move the Screenshots folder to `~/Pictures/Screenshots` and pin it to the dock

To install all macOS packages (brew, casks, VS Code extensions, etc.) use the Brewfile:
```
brew bundle --file packages/osx-brew
```

### Wallpapers

A collection of wallpapers is included in the `wallpapers/` directory. To link them to `~/Pictures/wallpapers`:
```
stow -t ~ wallpapers
```
