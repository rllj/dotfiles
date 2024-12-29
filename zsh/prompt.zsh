# prompt
setopt prompt_subst

git_prompt_info() {
  local dirstatus=""
  local dirty="*"

  if [[ ! -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
    dirstatus=$dirty
  fi

  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo " %{$fg[yellow]%}git:(${ref#refs/heads/}$dirstatus%{$reset_color%})%{$reset_color%}"
}

PROMPT='%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %(!.#.λ) '
