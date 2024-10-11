#!/bin/bash

set -e

rm -f CHANGELOG.md
git fetch
latest_tag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
git tag -l | xargs -I {} git push origin :refs/tags/{}
git tag -l | xargs git tag -d
git switch main
git checkout --orphan temp_branch
git add .
git commit -m "Initial commit"
git branch -D main
git branch -m main
git branch --set-upstream-to=origin/main main
for branch in $(git branch | grep -v "main"); do
  git push origin --delete "$branch"
  git branch -D "$branch"
done
git push -f origin main
git tag "$latest_tag"
git push origin "$latest_tag"