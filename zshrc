setopt autocd
setopt nocaseglob
setopt sharehistory
setopt appendhistory
setopt correct

# PATH
export PATH="$HOME/.local/opt/nvim/bin:$PATH"
export PATH="$HOME/.local/opt/go/bin:$PATH"
export PATH=$HOME/.deno/bin:$PATH
export PATH=~/go/bin:$PATH

# FPATH
export FPATH=~/workspace.sh/funcs:$FPATH
export FPATH=~/.funcs:$FPATH

# acme.sh
if [[ -e ~/.acme.sh && -f ~/.acme.sh/acme.sh.env ]]; then
  eval "$(cat ~/.acme.sh/acme.sh.env)"
fi

WORK_DIR=~/Desktop

if [[ -e ~/project ]]; then
  WORK_DIR=~/project
fi

# alias
alias -g ll='ls -lAh --color=auto'
alias -g l='ls -lh --color=auto'
alias -g vi='nvim'
alias d="cd $WORK_DIR"
alias ds='du -sh'
alias tma='tmux attach'

autoload -Uz compinit && compinit -u
autoload -Uz colors && colors
autoload dotenv

source ~/workspace.sh/zsh/completion.zsh

export EDITOR=nvim
PROMPT='%F{126}%n%f %B%F{25}%3~%f%b %(?.👍.👎%F{204}%?%f) '
# RPROMPT="%F{202}%B%m%b%f"
