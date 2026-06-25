#!/usr/bin/env bash
# doctor.sh — health check for the claude-foundation repo.
#
# Catches the two failure modes that let "deep-research" ship as a phantom:
#   1. PARITY  — the plugin/ mirror has drifted from the canonical home-claude/ source.
#   2. PHANTOM — a skill/workflow is referenced by name (e.g. "the `deep-research` skill")
#                but no such skill or workflow is actually shipped.
#
# Exit 0 = healthy, 1 = problems found. Safe to run in CI.
set -uo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SRC="$REPO_DIR/home-claude"
DST="$REPO_DIR/plugin/claude-foundation"
fail=0

echo "== claude-foundation doctor =="

# --- shipped inventory (canonical source) ---------------------------------
shipped_skills="$(ls "$SRC/skills" 2>/dev/null | sort -u)"
shipped_workflows="$(ls "$SRC/workflows" 2>/dev/null | sed 's/\.js$//' | sort -u)"
SHIPPED="$(printf '%s\n%s\n' "$shipped_skills" "$shipped_workflows" | sort -u | grep -v '^$')"

echo
echo "Shipped skills:    $(echo "$shipped_skills" | tr '\n' ' ')"
echo "Shipped workflows: $(echo "$shipped_workflows" | tr '\n' ' ')"

# --- 1) PARITY: plugin mirror must equal canonical source -----------------
echo
echo "-- parity (home-claude vs plugin) --"
for dir in skills workflows agents; do
  if [ -d "$SRC/$dir" ] || [ -d "$DST/$dir" ]; then
    if diff -rq "$SRC/$dir" "$DST/$dir" >/dev/null 2>&1; then
      echo "  ok: $dir in sync"
    else
      echo "  DRIFT: $dir differs — run scripts/sync-plugin.sh"
      fail=1
    fi
  fi
done

# --- 2) PHANTOM: every "\`name\` skill" reference must be shipped ----------
# Matches the idiom the repo uses to point at a sibling skill, e.g.
#   "Use the `deep-research` skill" / "the `optimize-prompt` skill".
# EXTERNAL = skills we intentionally reference but don't ship (official/plugin skills).
EXTERNAL="frontend-design"
echo
echo "-- phantom references --"
referenced="$(grep -rhoE '`[a-z][a-z0-9-]+`[[:space:]]+skill' \
  "$SRC/CLAUDE.md" "$SRC/FOUNDATION.md" "$SRC/skills" 2>/dev/null \
  | grep -oE '`[a-z][a-z0-9-]+`' | tr -d '`' | sort -u)"

phantom=0
for name in $referenced; do
  if printf '%s\n' "$SHIPPED" | grep -qx "$name"; then continue; fi
  if printf '%s\n' $EXTERNAL | grep -qx "$name"; then
    echo "  external: \"$name\" (referenced, intentionally not shipped)"
    continue
  fi
  echo "  PHANTOM: \"$name\" is referenced as a skill but not shipped (no skills/$name or workflows/$name.js)"
  phantom=1; fail=1
done
[ "$phantom" -eq 0 ] && echo "  ok: every referenced skill resolves to a shipped skill, workflow, or known external"

echo
if [ "$fail" -eq 0 ]; then echo "doctor: healthy ✓"; else echo "doctor: problems found ✗"; fi
exit "$fail"
