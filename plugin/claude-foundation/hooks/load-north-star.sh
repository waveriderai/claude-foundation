#!/usr/bin/env bash
# SessionStart hook — inject the current project's north-star.md (if present) into context,
# so the agent is always anchored to the project's goal. Anti-drift mechanism.
# Outputs SessionStart hookSpecificOutput JSON with additionalContext (injected into the model).
set -euo pipefail

base="${CLAUDE_PROJECT_DIR:-$PWD}"
ns=""
for f in "$base/north-star.md" "$base/.claude/north-star.md"; do
  if [ -f "$f" ]; then ns="$f"; break; fi
done

# No north star in this project -> inject nothing.
[ -z "$ns" ] && exit 0

python3 - "$ns" <<'PY'
import json, sys
with open(sys.argv[1]) as f:
    content = f.read().strip()
out = {
    "hookSpecificOutput": {
        "hookEventName": "SessionStart",
        "additionalContext": (
            "# NORTH STAR — this project's goal (stay anchored to it)\n"
            "The user set the following as the objective/constraints for this project. "
            "Keep work aligned to it; if asked to do something that drifts from it, note that.\n\n"
            + content
        ),
    }
}
print(json.dumps(out))
PY
