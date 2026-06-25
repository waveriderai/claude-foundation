#!/usr/bin/env bash
# sync-plugin.sh — mirror the canonical framework content into the plugin tree.
#
# Single source of truth = home-claude/. The plugin/ tree (used by the Claude Code
# plugin marketplace) is a GENERATED mirror of the shareable dirs. Run this after
# editing any skill / workflow / agent / hook so the two install paths never drift.
#
# Preserved (NOT overwritten): plugin/claude-foundation/hooks/hooks.json and
# plugin/claude-foundation/.claude-plugin/ (plugin-only manifest files).
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SRC="$REPO_DIR/home-claude"
DST="$REPO_DIR/plugin/claude-foundation"

if [ ! -d "$SRC" ] || [ ! -d "$DST" ]; then
  echo "error: expected $SRC and $DST to exist — run from inside the claude-foundation repo." >&2
  exit 1
fi

# Dirs that are pure shareable content: replace wholesale from the canonical source.
for dir in skills workflows agents; do
  if [ -d "$SRC/$dir" ]; then
    rm -rf "${DST:?}/$dir"
    mkdir -p "$DST/$dir"
    cp -R "$SRC/$dir/." "$DST/$dir/"
  fi
done

# Hooks: mirror the executable hook scripts but KEEP the plugin-only hooks.json.
if [ -d "$SRC/hooks" ]; then
  mkdir -p "$DST/hooks"
  find "$SRC/hooks" -maxdepth 1 -type f \( -name '*.sh' -o -name '*.py' \) -exec cp {} "$DST/hooks/" \;
fi

echo "synced home-claude/{skills,workflows,agents,hooks/*.sh,*.py} -> plugin/claude-foundation/"
echo "(preserved: plugin hooks.json + .claude-plugin/ manifest)"
