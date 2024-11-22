# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/data/data/com.termux/files/home/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ll="ls -lah"
alias grep="grep --color"
alias diff="diff --color"
alias history="history -t '%F %T'"

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

setopt EXTENDED_HISTORY
