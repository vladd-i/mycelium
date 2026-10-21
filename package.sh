#!/usr/bin/env bash
# Build dist/<skill>.zip for uploading to claude.ai (Settings → Capabilities → Skills).
# Re-run after editing a SKILL.md and commit the zips.
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$repo/dist"

for skill in "$repo"/.claude/skills/*/; do
  name="$(basename "$skill")"
  rm -f "$repo/dist/$name.zip"
  (cd "$repo/.claude/skills" && zip -qr "$repo/dist/$name.zip" "$name" -x '.*')
  echo "built dist/$name.zip"
done
