setopt autocd
setopt nocaseglob
setopt sharehistory
setopt appendhistory
setopt correct

export PATH=/opt/bin:$PATH
export PATH=/opt/nvim/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH

[[ -d ~/workspace.sh/funcs ]] && export FPATH=~/workspace.sh/funcs:$FPATH
[[ -d ~/go/bin ]] && export PATH=~/go/bin:$PATH

# acme.sh
if [[ -e ~/.acme.sh && -f ~/.acme.sh/acme.sh.env ]]; then
  eval "$(cat ~/.acme.sh/acme.sh.env)"
fi

alias -g ll='ls -lAh --color=auto'
alias -g l='ls -lh --color=auto'
alias -g vi='nvim'
[ -d ~/Desktop ] && alias d='cd ~/Desktop'
alias ds='du -sh'

autoload -Uz compinit && compinit -u
autoload -Uz colors && colors
autoload dotenv

source ~/workspace.sh/zsh/completion.zsh

bindkey -M menuselect '^[[Z' reverse-menu-complete

export EDITOR=nvim
PROMPT='%B%F{25}%3~%f%b %(?.👍.👎%F{204}%?%f) '
RPROMPT="%F{126}%n%f🌝%F{202}%B%m%b%f"
