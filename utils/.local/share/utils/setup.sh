#!/bin/bash


if [ ! -f "$HOME/.local/bin/mkvenv" ]; then
	ln -s $XDG_DATA_HOME/utils/python-tools/mkvenv $HOME/.local/bin
fi

if [ ! -f "$HOME/.local/bin/stmux" ]; then
	ln -s $XDG_DATA_HOME/utils/tmux/stmux $HOME/.local/bin
fi

if [ ! -f "$HOME/.local/bin/git-sprout" ]; then
	ln -s $XDG_DATA_HOME/utils/git/git-sprout $HOME/.local/bin
fi

if [ ! -f "$HOME/.local/bin/uv-codeartifact" ]; then
	ln -s $XDG_DATA_HOME/utils/python-tools/uv-codeartifact $HOME/.local/bin
fi
