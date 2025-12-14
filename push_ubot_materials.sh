#!/bin/bash
# push_ubot_materials.sh
# 一键提交并推送 ubot-materials 仓库的新增文件

# 仓库目录（修改为你本地路径）
REPO_DIR="$HOME/ubot-materials"

# 提交信息，默认为当前时间
COMMIT_MSG=${1:-"Update ubot materials $(date '+%Y-%m-%d %H:%M:%S')"}

# 进入仓库
cd "$REPO_DIR" || { echo "目录不存在: $REPO_DIR"; exit 1; }

# 检查是否为 git 仓库
if [ ! -d ".git" ]; then
    echo "当前目录不是 git 仓库: $REPO_DIR"
    exit 1
fi

# 添加新增或修改文件
git add .

# 提交
git commit -m "$COMMIT_MSG"

# 推送到默认远程和分支
git push origin main
