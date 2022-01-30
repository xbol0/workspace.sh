# Workspace.sh

快速在服务器上部署开发环境的脚本

### 已测试的服务器

- [x] 腾讯云 Ubuntu 18+

### 使用方法

作为初始化脚本或登录服务器后运行：

```shell
curl -fsSL https://cdn.jsdelivr.net/gh/orzv/workspace.sh/workspace.sh | bash -E -
```

### 部署的内容

- Deno
- Node.js
- Zsh + Oh-my-zsh
- Starship
- NeoVim
- gcc g++ make
- 更换ssh端口到10022

---

感谢[GHProxy.com](https://ghproxy.com) 老哥提供加速服务
