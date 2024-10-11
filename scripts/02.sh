#!/bin/bash
git switch main
git checkout --orphan temp_branch
git add .
git commit -m "Initial commit"
git branch -D main
git branch -m main
git push -f origin main
git branch -D release
git push origin --delete main
git tag -l | xargs git tag -d
git tag -l | xargs -I {} git push origin :refs/tags/{}
