#!/usr/bin/env bash
# Nightly: Claude writes the next chapter part and opens a pull request for review.
# Nothing is published until the pull request is merged; release-next.sh then publishes it.
set -euo pipefail

REPO_DIR="${REPO_DIR:-/mnt/hdd/the-floors-before}"

if [ ! -d "$REPO_DIR/.git" ]; then
  echo "$(date -Is) repo not found at $REPO_DIR (is the HDD mounted?)" >&2
  exit 1
fi

cd "$REPO_DIR"
git checkout --quiet main
git pull --rebase --quiet origin main

branch="draft/$(date +%Y-%m-%d)"
git checkout --quiet -B "$branch"

summary=$(claude -p "$(cat scripts/pi/draft-prompt.md)" \
  --allowedTools "Read,Write,Edit,Glob,Grep" \
  --permission-mode acceptEdits)

if [ -z "$(git status --porcelain)" ]; then
  echo "$(date -Is) Claude made no changes"
  git checkout --quiet main
  exit 0
fi

git add queue characters.md
git commit --quiet -m "Draft: $summary"
git push --quiet --force -u origin "$branch"
gh pr create --base main --head "$branch" --title "Draft for review: $(date +%Y-%m-%d)" \
  --body "$summary

Merge to add this part to the release queue. Comment with changes otherwise." || true
git checkout --quiet main
echo "$(date -Is) drafted: $summary"
