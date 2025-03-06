# Aliases
# Git
alias gp="git push"
alias gpu="git pull"
alias gc="git commit"
alias gcm="git commit -m"
alias gck="git checkout"
alias gap="git add -p"
alias gst="git status"
alias gcl="git clone"
alias gr="git rebase -i"
alias gcb='gck $(git branch -l | \fzf)'

alias vim=nvim

# Edit/Source zsh config
alias ez="vim $HOME/zsh/.zshrc"
alias sz="source $HOME/.zshrc"

# fzf
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
# ripgrep
alias rg="rg --hidden"
# ls colors
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -lh"

# Start server for llama.cpp
alias start-llama="llama-server \
    -hf ggml-org/Qwen2.5-Coder-7B-Q8_0-GGUF \
    --port 8012 -ngl 99 -fa -ub 1024 -b 1024 \
    --ctx-size 0 --cache-reuse 256"
