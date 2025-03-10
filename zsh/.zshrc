autoload -Uz compinit; compinit
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload colors; colors

# Secrets
source "$HOME/zsh/secrets.zsh"
# History
source "$HOME/zsh/history.zsh"
# Prompt
source "$HOME/zsh/prompt.zsh"
# Completion
source "$HOME/zsh/completion.zsh"
# Aliases
source "$HOME/zsh/aliases.zsh"

# Override macOS' default C-compilers
#export CC="/opt/homebrew/opt/llvm/bin/clang"
#export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export LSCOLORS="Gxfxcxdxbxegedabagacad"

export EDITOR='nvim'
export BAT_THEME="gruvbox-dark"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_HOME="$HOME"

# Hook direnv only if it is installed
if type direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi

# OPAM
[[ ! -r '/Users/m01632/.opam/opam-init/init.zsh' ]] || source '/Users/m01632/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

#pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"

[ -f "/Users/m01632/.ghcup/env" ] && . "/Users/m01632/.ghcup/env" # ghcup-env
