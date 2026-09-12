zle-line-init() {
  emulate -L zsh

  if [[ $CONTEXT == start ]]; then
    while true; do
      zle .recursive-edit
      local -i ret=$?
      [[ $ret == 0 && $KEYS == $'\4' ]] || break
      [[ -o ignore_eof ]] || exit 0
    done
    local saved_prompt=$PROMPT
    local saved_rprompt=$RPROMPT
    PROMPT='$(starship module character)'
    RPROMPT=''
    zle .reset-prompt
    PROMPT=$saved_prompt
    RPROMPT=$saved_rprompt

    if ((ret)); then
      zle .send-break
    else
      zle .accept-line
    fi
    return ret
  fi
  zle .recursive-edit
}
zle -N zle-line-init

zle-keymap-select() {
  zle .reset-prompt
}
zle -N zle-keymap-select