#!/usr/bin/env python3
"""
proof-gate.py — PreToolUse hook enforcing "proof over claims" on ACTIONS (not prose).

When a Bash command would publish/merge (git push, gh pr merge, git merge, npm publish, gh release)
but NO test command ran earlier this session, it denies once with a reason to run tests first.
Re-running the same command proceeds (conscious override for docs/config/WIP).

Why this is better than the prose Stop-hook it replaces:
- It reads PRIOR executed tool commands + the CURRENT command (from tool_input) — no stale-transcript
  race, no keyword-guessing of intent. It judges what you DID, not what you SAID.
- Deterministic, no model, fail-open (any read error -> allow).

Disable: remove the PreToolUse entry from ~/.claude/settings.json. Tune: the regexes below.
"""
import sys, json, re, os, hashlib

PUBLISH = re.compile(
    r"\bgit\s+push\b|\bgh\s+pr\s+merge\b|\bgit\s+merge\b|\bnpm\s+publish\b|\bgh\s+release\s+create\b",
    re.IGNORECASE,
)
TESTRUN = re.compile(
    r"\b(pytest|npm\s+(?:run\s+)?test|yarn\s+test|pnpm\s+test|go\s+test|cargo\s+test|jest|vitest|"
    r"mvn\s+test|gradle\s+test|rspec|phpunit|make\s+test|tox|ctest|dotnet\s+test|"
    r"python\s+-m\s+pytest|eval\.py)\b",
    re.IGNORECASE,
)


def session_test_ran(transcript_path):
    """True if any executed Bash tool_use command this session matches a test runner."""
    try:
        with open(transcript_path, encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    o = json.loads(line)
                except Exception:
                    continue
                content = o.get("message", o).get("content")
                if not isinstance(content, list):
                    continue
                for b in content:
                    if isinstance(b, dict) and b.get("type") == "tool_use":
                        inp = b.get("input") or {}
                        cmd = inp.get("command", "") if isinstance(inp, dict) else ""
                        if isinstance(cmd, str) and TESTRUN.search(cmd):
                            return True
    except Exception:
        return True  # fail-open: can't read -> don't block
    return False


def main():
    try:
        data = json.load(sys.stdin)
    except Exception:
        return 0
    if data.get("tool_name") != "Bash":
        return 0
    cmd = (data.get("tool_input") or {}).get("command", "")
    if not isinstance(cmd, str) or not PUBLISH.search(cmd):
        return 0
    tp = data.get("transcript_path")
    if tp and session_test_ran(tp):
        return 0  # tests ran this session -> allow

    # No tests ran. Deny once; allow on immediate re-run (conscious override).
    sid = data.get("session_id", "s")
    key = hashlib.sha1((sid + "|" + cmd).encode("utf-8")).hexdigest()
    d = os.path.join(os.environ.get("HOME", "/tmp"), ".claude", "cache", "proofgate")
    os.makedirs(d, exist_ok=True)
    marker = os.path.join(d, key)
    if os.path.exists(marker):
        os.remove(marker)  # second attempt -> proceed
        return 0
    open(marker, "w").write("1")
    reason = (
        "⚠️ Proof-gate: this publishes/merges, but no test command (pytest / npm test / go test / …) "
        "ran this session. Per proof-over-claims: run your tests and confirm they pass first, then state "
        "the result. If tests genuinely don't apply (docs/config/WIP), re-run this exact command to proceed."
    )
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": reason,
        }
    }))
    return 0


if __name__ == "__main__":
    sys.exit(main())
