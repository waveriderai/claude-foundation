#!/usr/bin/env bash
# install.sh — replicate the claude-foundation setup into ~/.claude
#
# What it does:
#   1. Backs up any existing ~/.claude to ~/.claude.backup.<timestamp> (nothing is destroyed).
#   2. Copies the framework (CLAUDE.md, FOUNDATION.md, skills, hooks, knowledge, templates,
#      scripts, statusline) into ~/.claude — WITHOUT touching your credentials/history/sessions.
#   3. Generates settings.json from settings.template.json with hook paths pointing at your ~/.claude.
#
# It is safe to re-run. Personal data in an existing ~/.claude is preserved (copy is additive),
# and your old settings.json is backed up before being replaced.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/home-claude"
CLAUDE_HOME="${CLAUDE_HOME:-$HOME/.claude}"

if [ ! -d "$SRC" ]; then
  echo "error: $SRC not found — run this from inside the claude-foundation repo." >&2
  exit 1
fi

echo "Installing claude-foundation into: $CLAUDE_HOME"

# 1) Back up an existing install (settings + whole dir snapshot of framework-managed files).
if [ -d "$CLAUDE_HOME" ]; then
  ts="$(date +%Y%m%d-%H%M%S)"
  backup="$CLAUDE_HOME.backup.$ts"
  echo "  existing ~/.claude found — snapshotting to $backup"
  cp -R "$CLAUDE_HOME" "$backup"
fi

mkdir -p "$CLAUDE_HOME"

# 2) Copy framework files. These overwrite same-named framework files but leave
#    credentials.json / history.jsonl / projects / sessions / etc. untouched.
copy() { # copy <relpath>
  local rel="$1"
  if [ -e "$SRC/$rel" ]; then
    mkdir -p "$CLAUDE_HOME/$(dirname "$rel")"
    cp -R "$SRC/$rel" "$CLAUDE_HOME/$(dirname "$rel")/"
  fi
}

copy CLAUDE.md
copy FOUNDATION.md
copy statusline.py
copy statusline.sh
copy skills
copy workflows
copy hooks
copy templates
copy scripts
copy knowledge
copy agents

chmod +x "$CLAUDE_HOME"/hooks/*.sh 2>/dev/null || true
chmod +x "$CLAUDE_HOME"/statusline.sh 2>/dev/null || true
chmod +x "$CLAUDE_HOME"/scripts/*.sh 2>/dev/null || true

# 3) Generate settings.json from the template, pointing hooks at this user's ~/.claude.
#    If a settings.json already exists it was backed up in step 1; we replace it so hooks resolve.
sed "s#__CLAUDE_HOME__#$CLAUDE_HOME#g" "$SRC/settings.template.json" > "$CLAUDE_HOME/settings.json"

echo
echo "Done."
echo "  - Framework files installed under $CLAUDE_HOME"
echo "  - settings.json written with hook paths -> $CLAUDE_HOME/hooks"
echo "  - Your credentials / history / sessions (if any) were left untouched."

# Self-check: show exactly what landed, so a missing skill/workflow is obvious.
echo
echo "Installed:"
echo "  skills:    $(ls "$CLAUDE_HOME/skills" 2>/dev/null | tr '\n' ' ')"
echo "  workflows: $(ls "$CLAUDE_HOME/workflows" 2>/dev/null | sed 's/\.js$//' | tr '\n' ' ')"
echo "  hooks:     $(ls "$CLAUDE_HOME/hooks" 2>/dev/null | grep -E '\.(sh|py)$' | tr '\n' ' ')"
echo
echo "Note: the anti-drift hooks need python3 on PATH. The daily-learn script (optional) needs the"
echo "      'claude' CLI on PATH or \$CLAUDE_BIN set. Restart Claude Code to load the new settings."
