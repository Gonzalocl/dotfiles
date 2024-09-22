#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ll="ls -lah"
alias pactree='pactree -c'
alias diff='diff --color'

HISTCONTROL=ignoredups
HISTSIZE=20000
HISTTIMEFORMAT="%F %T "

COLOR_RED="\[$(tput setaf 1)\]"
COLOR_GREEN="\[$(tput setaf 2)\]"
COLOR_YELLOW="\[$(tput setaf 3)\]"
COLOR_BLUE="\[$(tput setaf 4)\]"
COLOR_RESET="\[$(tput sgr0)\]"

USER_COLOR="${COLOR_GREEN}"
HOST_COLOR="${COLOR_BLUE}"
PWD_COLOR="${COLOR_RED}"
RET_COLOR="${COLOR_YELLOW}"

PS1="${RET_COLOR}[${USER_COLOR}\u${RET_COLOR}@${HOST_COLOR}\h${COLOR_RESET} ${PWD_COLOR}\W${RET_COLOR}]\$${COLOR_RESET} "

complete -F _command prime-run
