#!/bin/bash

git switch main
git commit --allow-empty -m "fix: 这是一个空提交. $(date) on $(git rev-parse --abbrev-ref HEAD)"
sleep 1
git commit --allow-empty -m "feat: 这是一个空提交. $(date) on $(git rev-parse --abbrev-ref HEAD)"
sleep 1
git push origin main:main

# git switch release
# git merge main

# git push origin release:release
# git switch main

# git switch release
# git rebase main --reapply-cherry-picks -X theirs
# git rebase release --reapply-cherry-picks