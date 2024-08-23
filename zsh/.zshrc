export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="geoffgarside"

DISABLE_AUTO_TITLE="true"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias vim=nvim

alias gp="git push"
alias gpu="git pull"
alias gc="git commit"
alias gcm="git commit -m"
alias gck="git checkout"
alias gap="git add -p"
alias rgf='rg --files | rg'

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export CC="/opt/homebrew/opt/llvm/bin/clang"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
