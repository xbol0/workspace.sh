setopt autocd
setopt nocaseglob
setopt sharehistory
setopt appendhistory
setopt correct
setopt correctall

export PATH=/opt/bin:$PATH
export PATH=/opt/nvim/bin:$PATH

[ -d ~/.funcs ] && export FPATH=~/.funcs:$FPATH

alias -g ll='ls -lahG'
alias -g l='ls -lAhG'
alias -g vi='nvim'
[ -d ~/Desktop ] && alias d='cd ~/Desktop'
alias ds='du -sh'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload gmt

zstyle ':completion:*' menu select

EDITOR=nvim
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{cyan}%3~%f%b %F{magenta}%#%f '

