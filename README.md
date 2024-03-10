# My dot files


## Install
First install the useful package from the appropriate file in ./packages

Add the following to `/etc/zsh/zshenv` on your systemes or  `$ZDOTDIR/.zshenv` on shared system.
This will update configuration directory
```
# XDG Variable
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Settings for specific application
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export HISTFILE="$ZDOTDIR"/.zsh_history
export KUBECONFIG="$XDG_CONFIG_HOME"/kube/config
export KUBECACHEDIR="$XDG_CACHE_HOME"/kube
export LESSHISTFILE="-"
export MYSQL_HISTFILE="$XDG_CACHE_HOME"/mysql_history
export NVM_DIR="$XDG_CONFIG_HOME"/nvm
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export `VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'`
```

For a server with no UI
```
stow -t ~ nvim git zsh bash tmux screen
```

For a workstation with UI
```
stow -t ~ nvim git zsh bash tmux screen alacritty
```
