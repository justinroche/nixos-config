if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux new-session \; set-option destroy-unattached
fi