#!/bin/bash

# @author orzv
# @email orzv@outlook.com

set -e

# 这玩意给ubuntu 18+用的 其他的还没兼容

echo "Add neovim repo"
sudo add-apt-repository -y ppa:neovim-ppa/stable

# 安装node.js，copilot要用到
echo "Add node.js repo"
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

echo "apt update"
sudo apt update
# 安装目录
sudo mkdir -p /opt/bin

# 安装必要依赖
echo "apt install"
sudo apt install -y gcc g++ unzip zsh neovim make nodejs

# 下载猫猫
echo "Download and Install clash"
curl -fsSLO https://mirror.ghproxy.com/github.com/Dreamacro/clash/\
  releases/download/v1.9.0/clash-linux-amd64-v1.9.0.gz
gunzip clash-linux-amd64-v1.9.0.gz
sudo mv clash-linux-amd64-v1.9.0 /opt/bin/clash
sudo chmod +x /opt/bin/clash

# 下载deno
echo "Download and Install deno"
curl -fsSL https://x.deno.js.cn/install.sh | sudo DENO_INSTALL=/opt sh

# 添加其他配置
echo 'source ~/workspace.sh/zshrc' >> ~/.zshrc

# 添加deno completion
mkdir ~/.funcs
deno completions zsh > ~/.funcs/_deno

# 修改ssh默认端口
# sudo chmod 777 /etc/ssh/sshd_config
# sudo echo 'Port 10022' >> /etc/ssh/sshd_config
# sudo chmod 644 /etc/ssh/sshd_config
# sudo service ssh restart
