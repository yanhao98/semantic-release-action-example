#!/bin/bash

git switch main
commit_types=(
  "feat: 一项新功能"
  "fix: 错误修复"
  "docs: 仅更改文档"
  "style: 不影响代码含义的更改（空格、格式、缺少分号等）"
  "refactor: 既不修复错误也不添加功能的代码更改"
  "perf: 提高性能的代码更改"
  "test: 添加缺失的或纠正现有的测试"
  "chore: 对构建过程或辅助工具和库（例如文档生成）的更改"
)
i=1
for commit_type in "${commit_types[@]}"; do
  git commit --allow-empty -m "$commit_type $i. $(date) on $(git rev-parse --abbrev-ref HEAD)"
  ((i++))
done
git push origin main:main
