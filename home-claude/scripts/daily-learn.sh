#!/usr/bin/env bash
# Daily self-learning — refresh the global knowledge base from the thinker pool.
# Run by launchd/cron. Logs to ~/.claude/logs/daily-learn.log.
#
# Token-efficient: a FREE no-LLM sensor (check-sources.py) checks every source first; Claude only
# runs when something actually changed, and is fed ONLY the changed sources. Quiet days cost 0 tokens.
set -uo pipefail
# HOME is inherited from the environment; override by exporting HOME before calling this script.
: "${HOME:?HOME must be set}"
# Locate the claude CLI: honor $CLAUDE_BIN, else search PATH, else common install location.
CLAUDE="${CLAUDE_BIN:-$(command -v claude || echo "$HOME/.local/bin/claude")}"
SCRIPTS="$HOME/.claude/scripts"
KB="$HOME/.claude/knowledge"
LOGDIR="$HOME/.claude/logs"; mkdir -p "$LOGDIR"
LOG="$LOGDIR/daily-learn.log"

{
  echo "==================== daily-learn $(date +%FT%H:%M:%S) ===================="
  cd "$KB" || { echo "knowledge dir missing"; exit 1; }

  # 1) FREE sensor: which sources changed since last baseline? (no model tokens)
  changed="$(python3 "$SCRIPTS/check-sources.py")"
  if [ -z "$changed" ]; then
    echo "sensor: no source changes — skipping the LLM run (0 tokens)."
    echo "==================== done $(date +%FT%H:%M:%S) ===================="; echo
    exit 0
  fi
  echo "sensor: changed sources:"; echo "$changed" | sed 's/^/  - /'
  list="$(echo "$changed" | paste -sd, - | sed 's/,/, /g')"

  # 2) Expensive step only on real changes, scoped to just those sources.
  if "$CLAUDE" -p "Use the ingest-source flow for ONLY these tracked sources that changed since the last check: ${list}. For each, find the genuinely new material (newer than that thinker's page), extract the thinking, update pages/thinkers/<name>.md + index.md + log.md + cross-refs, then commit the ~/.claude/knowledge git repo with a dated message. End with one line per source: what's new and where it plugs in. Be honest if a flagged source has nothing substantive (a page may have changed for trivial reasons)." \
      --dangerously-skip-permissions 2>&1; then
    # 3) Only advance the baseline after a successful ingest (so failures retry next run).
    python3 "$SCRIPTS/check-sources.py" --promote
    echo "baseline advanced."
  else
    echo "ingest run failed; keeping old baseline so changed sources retry next run."
  fi
  echo "==================== done $(date +%FT%H:%M:%S) ===================="; echo
} >> "$LOG" 2>&1
