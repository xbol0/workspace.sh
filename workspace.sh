#!/bin/bash

# @author orzv
# @email orzv@outlook.com

set -e

# 这玩意给ubuntu 18+用的 其他的还没兼容

sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update

# 安装node.js，copilot要用到
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -

# 安装目录
sudo mkdir -p /opt/bin

# 安装必要依赖
sudo apt install -y gcc g++ unzip zsh neovim make nodejs

# 下载猫猫
curl -fsSLO https://mirror.ghproxy.com/github.com/Dreamacro/clash/releases/download/v1.9.0/clash-linux-amd64-v1.9.0.gz
gunzip clash-linux-amd64-v1.9.0.gz
sudo mv clash-linux-amd64-v1.9.0 /opt/bin/clash
sudo chmod +x /opt/bin/clash

# 下载装逼神器starship
curl -fsSLO https://mirror.ghproxy.com/github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar -xzf starship-x86_64-unknown-linux-musl.tar.gz
sudo mv starship /opt/bin/starship
sudo chmod +x /opt/bin/starship
rm starship-x86_64-unknown-linux-musl.tar.gz

# 下载deno
curl -fsSL https://x.deno.js.cn/install.sh | sudo DENO_INSTALL=/opt sh

# 安装oh-my-zsh
curl -fssLO https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh

# 切换国内镜像
sed -i 's/-ohmyzsh/-mirrors/' install.sh
sed -i 's/-https:\/\/github.com/-https:\/\/gitee.com/' install.sh
chmod +x install.sh

./install.sh --unattended
rm install.sh

# 添加其他配置
sed -i '2a export PATH=/opt/bin:$PATH' ~/.zshrc
sed -i '2a export PATH=$HOME/.deno/bin:$PATH' ~/.zshrc
echo 'alias vi=nvim' >> ~/.zshrc
echo 'alias ds=du -sh' >> ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
sudo chmod 777 /etc/ssh/sshd_config
sudo echo 'Port 10022' >> /etc/ssh/sshd_config
sudo chmod 644 /etc/ssh/sshd_config
sudo service ssh restart
