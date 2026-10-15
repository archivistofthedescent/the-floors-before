#!/usr/bin/env bash
# Releases the next chapter from queue/ by moving it into _chapters/ and pushing.
# GitHub Pages rebuilds the site on push. Run once a day from cron.
set -euo pipefail

REPO_DIR="${REPO_DIR:-/mnt/hdd/the-floors-before}"

# If the HDD isn't mounted, stop rather than writing to the SD card.
if [ ! -d "$REPO_DIR/.git" ]; then
  echo "$(date -Is) repo not found at $REPO_DIR (is the HDD mounted?)" >&2
  exit 1
fi

cd "$REPO_DIR"
git pull --rebase --quiet origin main

next=$(find queue -maxdepth 1 -name '*.md' | sort | head -n 1)
if [ -z "$next" ]; then
  echo "$(date -Is) queue empty, nothing to release"
  exit 0
fi

name=$(basename "$next")
git mv "$next" "_chapters/$name"
git commit --quiet -m "Release $name"
git push --quiet origin main
echo "$(date -Is) released $name"
