#!/bin/bash

set -e
git fetch
git tag -l | xargs -I {} git push origin :refs/tags/{}
git tag -l | xargs git tag -d
git switch main
git checkout --orphan temp_branch
git add .
git commit -m "Initial commit"
git branch -D main
git branch -m main
for branch in $(git branch | grep -v "main"); do
  git push origin --delete "$branch"
  git branch -D "$branch"
done
git push -f origin main