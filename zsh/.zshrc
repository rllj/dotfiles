autoload -Uz compinit; compinit
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload colors; colors

# Work secrets
source $HOME/zsh/secrets.zsh
# History
source $HOME/zsh/history.zsh
# Prompt
source $HOME/zsh/prompt.zsh
# Completion
source $HOME/zsh/completion.zsh

# Aliases
# Git
alias vim=nvim
alias gp="git push"
alias gpu="git pull"
alias gc="git commit"
alias gcm="git commit -m"
alias gck="git checkout"
alias gap="git add -p"
alias gst="git status"
alias gcl="git clone"
alias gri="git rebase -i"

# Edit/Source zsh config
alias ez="vim $HOME/zsh/.zshrc"
alias sz="source $HOME/.zshrc"

# fzf
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
# ripgrep
alias rg="rg --hidden"
# ls colors
alias ls="ls --color=auto"

# Start server for llama.cpp
alias start-llama="llama-server \
    -hf ggml-org/Qwen2.5-Coder-7B-Q8_0-GGUF \
    --port 8012 -ngl 99 -fa -ub 1024 -b 1024 \
    --ctx-size 0 --cache-reuse 256"


# Override macOS' default C-compilers
#export CC="/opt/homebrew/opt/llvm/bin/clang"
#export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export LSCOLORS="Gxfxcxdxbxegedabagacad"

export EDITOR='nvim'
export BAT_THEME="gruvbox-dark"

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

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/m01632/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
