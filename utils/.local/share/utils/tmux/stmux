#!/usr/bin/env bash

# Fixed ANSI Escape Codes (more portable)
GREEN=$(printf '\033[0;32m')
BLUE=$(printf '\033[0;34m')
NC=$(printf '\033[0m')

# 1. Get running sessions with Green color
if pgrep tmux > /dev/null; then
    sessions=$(tmux list-sessions -F "#S" | sed "s|^|${GREEN}|;s|$|${NC}|")
else
    sessions=""
fi

# 2. Get project directories with Blue color
# Adjust these paths to your actual project folders
projects=$(find ~/code  -mindepth 1 -maxdepth 1 -type d | sed "s|^|${BLUE}|;s|$|${NC}|")

# 3. The Preview Command (A mini-script inside fzf)
# It strips the color, checks if it's a directory or session, and shows info.
PREVIEW_STRATEGY='
    item=$(echo {} | sed "s/\x1b\[[0-9;]*m//g");
    if tmux has-session -t "$item" 2>/dev/null; then
        echo "--- WINDOWS IN SESSION: $item ---";
        tmux list-windows -t "$item" -F "#I: #W #{?window_active,(active),}";
    elif [ -d "$item" ]; then
        echo "--- FILES IN: $(basename $item) ---";
        ls -F --color=always "$item" | head -10;
        if [ -d "$item/.git" ]; then
            echo -e "\n--- GIT STATUS ---";
            git -C "$item" status -s;
        fi
    fi
'

# 4. The Fuzzy Finder Popup
selected=$(printf "%s\n%s" "$sessions" "$projects" | fzf \
    --ansi \
    --tmux center,80%,70% \
    --reverse \
    --border \
    --prompt="Jump to > " \
    --header="CTRL-D to delete session | TAB to toggle" \
    --preview="$PREVIEW_STRATEGY" \
    --preview-window="right:50%:wrap")

if [[ -z $selected ]]; then
    exit 0
fi

# 5. Clean selection for processing
clean_selected=$(echo "$selected" | sed 's/\x1b\[[0-9;]*m//g')

# 6. Logic to switch/create
if [[ -d "$clean_selected" ]]; then
    selected_name=$(basename "$clean_selected" | tr . _)
    if ! tmux has-session -t="$selected_name" 2> /dev/null; then
        tmux new-session -ds "$selected_name" -c "$clean_selected"
    fi
else
    selected_name="$clean_selected"
fi

# 7. Final Attach/Switch
if [[ -z $TMUX ]]; then
    tmux attach-session -t "$selected_name"
else
    tmux switch-client -t "$selected_name"
fi
