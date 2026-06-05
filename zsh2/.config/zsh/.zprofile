if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"
export LANG="${LANG:-en_US.UTF-8}"

if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

typeset -gU path
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /opt/homebrew/opt/libpq/bin(N)
  $HOME/.local/share/go/bin(N)
  $path
)
