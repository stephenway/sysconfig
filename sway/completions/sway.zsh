if [[ ! -o interactive ]]; then
    return
fi

compctl -K _sway sway

_sway() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(sway commands)"
  else
    completions="$(sway completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
