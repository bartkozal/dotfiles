if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then
  function update_terminalapp_cwd() {
    emulate -L zsh

    local URL_PATH="$PWD"
    [[ $? != 0 ]] && return 1

    printf '\e]7;%s\a' "file://$HOST$URL_PATH"
  }

  precmd_functions+=(update_terminalapp_cwd)
  update_terminalapp_cwd
fi
