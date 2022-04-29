#!/bin/sh

set -e

# add neovim repo
sudo add-apt-repository -y ppa:neovim-ppa/stable > /dev/null

# update apt-get
sudo apt update > /dev/null

# init dir
mkdir -p ~/.local/bin
mkdir -p ~/.config

# install apps
sudo apt install -y gcc g++ make unzip neovim tmux > /dev/null

# install clash
curl -fsSL \
  https://release.dreamacro.workers.dev/latest/clash-linux-amd64-latest.gz | \
	gunzip > ~/.local/bin/clash && chmod +x ~/.local/bin/clash

# update bashrc
cat <<EOF >> ~/.mybashrc
export PATH=~/.local/bin:\$PATH
EOF
echo "source ~/.mybashrc" >> ~/.bashrc

# update tmux
cat <<EOF >> ~/.tmux.conf
set -g status off
set-option -g prefix C-a
bind-key C-a last-window
set-option -g prefix C-a
bind-key C-a last-window
set -g base-index 1
set -s escape-time 50
setw -g aggressive-resize on
bind-key a send-prefix
setw -g monitor-activity on
set -g visual-activity on
bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."
set-window-option -g automatic-rename
set -g mouse on
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",screen-256color:Tc"
set -g default-terminal "screen-256color"
EOF

curl -fsSL https://x.deno.js.cn/install.sh | sudo DENO_INSTALL="~/.local" sh > /dev/null
