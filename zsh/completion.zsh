# Completion
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd
# Completion ignores case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
# Shift-tab to go backwards in completions
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
