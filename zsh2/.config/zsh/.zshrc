# General
setopt COMBINING_CHARS
setopt INTERACTIVE_COMMENTS
setopt RC_QUOTES
unsetopt MAIL_WARNING
[[ -r ${TTY:-} && -w ${TTY:-} && $+commands[stty] == 1 ]] && stty -ixon <$TTY >$TTY

# Jobs
setopt LONG_LIST_JOBS
setopt AUTO_RESUME
setopt NOTIFY
unsetopt BG_NICE
unsetopt HUP
unsetopt CHECK_JOBS

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# Directory
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Completion
autoload -Uz compinit
_zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${_zcompdump:h}"
compinit -d "$_zcompdump"
unset _zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Vi key bindings
bindkey -v
export KEYTIMEOUT=1

# zsh-autosuggestions
for _plugin in \
  "$(brew --prefix 2>/dev/null)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  [[ -f "$_plugin" ]] && { source "$_plugin"; break }
done

# zsh-syntax-highlighting (must be sourced last among plugins)
for _plugin in \
  "$(brew --prefix 2>/dev/null)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh; do
  [[ -f "$_plugin" ]] && { source "$_plugin"; break }
done

# zsh-history-substring-search
for _plugin in \
  "$(brew --prefix 2>/dev/null)/share/zsh-history-substring-search/zsh-history-substring-search.zsh" \
  /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh \
  /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh; do
  [[ -f "$_plugin" ]] && { source "$_plugin"; break }
done
unset _plugin

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Local configs
[[ -f "$ZDOTDIR/alias" ]]       && source "$ZDOTDIR/alias"
[[ -f "$ZDOTDIR/alias.local" ]] && source "$ZDOTDIR/alias.local"
[[ -f "$ZDOTDIR/env" ]]         && source "$ZDOTDIR/env"
[[ -f "$ZDOTDIR/env.local" ]]   && source "$ZDOTDIR/env.local"
[[ -f "$ZDOTDIR/nvm" ]]         && source "$ZDOTDIR/nvm"
[[ -f "$ZDOTDIR/uv" ]]          && source "$ZDOTDIR/uv"

# Starship
eval "$(starship init zsh)"
