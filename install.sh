#!/usr/bin/env bash
# Symlink the mycelium skills into ~/.claude/skills so they work in every project.
# Symlinks (not copies) mean `git pull` in this repo updates everyone's skills.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
dest="$HOME/.claude/skills"
mkdir -p "$dest"

for skill in "$repo"/.claude/skills/*/; do
  name="$(basename "$skill")"
  if [ -e "$dest/$name" ] && [ ! -L "$dest/$name" ]; then
    echo "skip $name: $dest/$name exists and is not a symlink"
    continue
  fi
  ln -sfn "${skill%/}" "$dest/$name"
  echo "linked /$name -> $dest/$name"
done

echo
echo "Next: in Claude Code run /mcp and make sure the claude.ai Miro connector is connected,"
echo "then try: /search-team-knowledge why do our tests fail overnight"
