#!/usr/bin/env bash

set -euo pipefail

directory=$PWD
session="d-$(printf '%s' "$directory" | sha256sum | cut -c 1-6)"

if ! tmux has-session -t "=$session" 2>/dev/null; then
  tmux new-session -d -s "$session" -c "$directory" -n shell
  tmux new-window -d -t "$session:" -c "$directory" -n workspace nvim .
  tmux new-window -d -t "$session:" -c "$directory" -n lazygit lazygit
fi

if [[ -n ${TMUX:-} ]]; then
  tmux switch-client -t "$session"
else
  tmux attach-session -t "$session"
fi
