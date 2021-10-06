export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="$ZSH/custom/plugins/fzf/"
export NVM_LAZY_LOAD=true
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
#plugins=(git fzf zsh-syntax-highlighting zsh-autosuggestions zsh-nvm)
plugins=(git fzf zsh-autosuggestions zsh-nvm extract)

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
# Sources
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases
[ -f $HOME/.profile ] && source $HOME/.profile

unsetopt share_history

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Widgets
# bindkey to list current bindings
bindkey '^j' down-line-or-history
bindkey '^k' up-line-or-history
