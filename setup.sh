#!/bin/bash

# 设置错误处理
set -e

# 安装 nvm
echo "正在安装 nvm..."
curl -o- https://gitee.com/mirrors/nvm/raw/v0.39.7/install.sh | bash

# 加载 nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 验证 nvm 安装
if ! command -v nvm &> /dev/null; then
    echo "nvm 安装失败，请检查安装日志"
    exit 1
fi

# 重新加载 .bashrc 以使 nvm 生效
source ~/.bashrc

# 使用 nvm 安装 Node.js LTS 版本
echo "正在安装 Node.js..."
nvm install --lts

# 验证 Node.js 安装
if ! command -v node &> /dev/null; then
    echo "Node.js 安装失败，请检查安装日志"
    exit 1
fi

# 使用 npm 安装 pnpm
echo "正在安装 pnpm..."
npm install -g pnpm

# 验证 pnpm 安装
if ! command -v pnpm &> /dev/null; then
    echo "pnpm 安装失败，请检查安装日志"
    exit 1
fi

# 运行 pnpm setup
pnpm setup

# 再次重新加载 .bashrc 以使 pnpm 的配置生效
source ~/.bashrc

echo "安装完成！"
echo "Node.js 版本: $(node -v)"
echo "npm 版本: $(npm -v)"
echo "pnpm 版本: $(pnpm -v)"