#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find /Volumes/Crucial/Code/Sites /Volumes/Crucial/Code -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected

    tmux new-window -d -c $selected

    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected "nvim"

    tmux new-window -d -t=$selected_name -c $selected
fi

# Attach tmux if it is not already attached
if [[ -z $TMUX ]]; then
	tmux attach
fi

tmux switch-client -t $selected_name
