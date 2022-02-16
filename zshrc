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

deno completions zsh > ~/workspace.sh/funcs/_deno

# acme.sh
if [[ -e ~/.acme.sh && -f ~/.acme.sh/acme.sh.env ]]; then
  eval "$(cat ~/.acme.sh/acme.sh.env)"
fi

alias -g ll='ls -lAh --color=auto'
alias -g l='ls -lh --color=auto'
alias -g vi='nvim'
[ -d ~/Desktop ] && alias d='cd ~/Desktop'
alias ds='du -sh'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload dotenv

zstyle ':completion:*' menu select

if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi

zmodload zsh/complist

bindkey ';3D' backward-word
bindkey ';3C' forward-word
bindkey -M menuselect '^[[Z' reverse-menu-complete

export EDITOR=nvim
PROMPT='%B%F{cyan}%3~%f%b %(?.👍.👎%F{204}%?%f) '
RPROMPT="%F{177}%n%f🌝%F{202}%B%m%b%f"
