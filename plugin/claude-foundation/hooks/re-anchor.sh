#!/usr/bin/env bash
# UserPromptSubmit hook — every N prompts, inject a re-anchor checkpoint to fight goal drift
# on long sessions. Anti-drift mechanism. Reads session_id from hook stdin to keep a per-session
# counter, so the reminder fires periodically rather than every turn.
set -euo pipefail

N="${REANCHOR_EVERY:-10}"
input="$(cat || true)"

sid="$(printf '%s' "$input" | python3 -c "import sys,json
try: print(json.load(sys.stdin).get('session_id','default'))
except Exception: print('default')" 2>/dev/null || echo default)"

dir="${HOME:-/tmp}/.claude/cache/reanchor"
mkdir -p "$dir"
cf="$dir/$sid"
count=0
[ -f "$cf" ] && count="$(cat "$cf" 2>/dev/null || echo 0)"
count=$((count + 1))
echo "$count" > "$cf"

# Only fire on every Nth prompt.
[ $((count % N)) -ne 0 ] && exit 0

python3 - <<'PY'
import json
print(json.dumps({
    "hookSpecificOutput": {
        "hookEventName": "UserPromptSubmit",
        "additionalContext": (
            "# RE-ANCHOR CHECKPOINT\n"
            "Pause for one line: restate this project's north-star goal in your own words and "
            "confirm the current work still advances it. If we've drifted from the original "
            "objective, or are skipping planned/backlog items, say so and realign before continuing."
        ),
    }
}))
PY
