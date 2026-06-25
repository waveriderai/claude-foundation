#!/usr/bin/env bash
# selfcheck.sh — INSTALL doctor. Verifies that a ~/.claude install of claude-foundation is COMPLETE
# and that every skill's dependencies actually exist, so "install done" can't silently leave gaps.
#
# Complements scripts/doctor.sh (which checks the *repo*: home-claude↔plugin parity + phantom refs).
# This one checks the *installed* result on a user's machine. Run after install.sh:
#   bash ~/.claude/scripts/selfcheck.sh
# Prints ✓ / ⚠ / ✗ per check; exits non-zero if any ✗. ⚠ = optional/should-do, not fatal.
set -uo pipefail
H="${CLAUDE_HOME:-$HOME/.claude}"
pass=0; warn=0; fail=0
ok(){ printf '  ✓ %s\n' "$1"; pass=$((pass+1)); }
wn(){ printf '  ⚠ %s\n' "$1"; warn=$((warn+1)); }
no(){ printf '  ✗ %s\n' "$1"; fail=$((fail+1)); }
have(){ command -v "$1" >/dev/null 2>&1; }

echo "== tools on PATH =="
for t in claude python3 git; do
  have "$t" && ok "$t ($(command -v "$t"))" || no "$t missing (required)"
done
have node && ok "node ($(command -v node))" || wn "node missing (optional — needed to lint/run workflows)"

echo "== skills present + frontmatter =="
for s in deep-research design-taste ingest-source learn-from-thinkers new-project optimize-prompt validate-idea; do
  f="$H/skills/$s/SKILL.md"
  if [ -f "$f" ]; then
    grep -q '^name:' "$f" && grep -q '^description:' "$f" && ok "skill $s" || no "skill $s: SKILL.md missing name/description"
  else no "skill $s: not installed"; fi
done

echo "== skill/workflow dependency integrity =="
# deep-research is referenced by ingest-source/learn-from-thinkers/validate-idea — it must resolve to a
# shipped skill OR workflow (this is the 'phantom reference' class of bug, checked here on the install).
if [ -f "$H/skills/deep-research/SKILL.md" ] || [ -f "$H/workflows/deep-research.js" ]; then
  ok "deep-research resolves (skill and/or workflow installed)"
else no "deep-research MISSING — ingest-source/learn-from-thinkers/validate-idea reference it"; fi
if have claude && claude plugin list 2>/dev/null | grep -q frontend-design; then ok "frontend-design plugin enabled (design-taste)"; \
  else wn "frontend-design plugin not enabled — design-taste UI craft degraded"; fi

echo "== hooks =="
for hk in load-north-star.sh re-anchor.sh proof-gate.py; do
  [ -f "$H/hooks/$hk" ] && ok "hook file $hk" || no "hook file $hk missing"
done
S="$H/settings.json"
if [ -f "$S" ]; then
  python3 - "$S" <<'PY' && ok "settings.json valid JSON + hook paths resolve" || no "settings.json: invalid or a hook path doesn't exist"
import json,sys,re,os
d=json.load(open(sys.argv[1]))
paths=re.findall(r'(/[^"]+/hooks/[A-Za-z0-9_.-]+)', json.dumps(d))
sys.exit(0 if all(os.path.exists(p) for p in paths) else 1)
PY
else no "settings.json missing"; fi
# Shared-machine landmine: per-session hook state must be per-user, not a bare shared /tmp path
# (a fixed /tmp/<name> is created by whoever runs first, then fails 'Permission denied' for everyone else).
if grep -RqE '/tmp/claude-[a-z]' "$H/hooks/" 2>/dev/null; then
  no "a hook writes to a shared /tmp path — collides between users; use \$HOME/.claude/cache/..."
else ok "hooks use per-user state paths (no shared /tmp collision)"; fi

echo "== proof-gate functional =="
tmpx=$(mktemp); printf '{"message":{"content":[{"type":"tool_use","input":{"command":"ls"}}]}}\n' >"$tmpx"
pg=$(printf '{"tool_name":"Bash","tool_input":{"command":"git push origin main"},"session_id":"selfcheck","transcript_path":"%s"}' "$tmpx" \
   | python3 "$H/hooks/proof-gate.py" 2>/dev/null)
rm -f "$tmpx" "$HOME/.claude/cache/proofgate/"* 2>/dev/null
echo "$pg" | grep -q '"permissionDecision": *"deny"' && ok "proof-gate denies a testless publish" || no "proof-gate did NOT deny a testless publish"

echo "== knowledge base =="
for p in index.md log.md CLAUDE.md sources/tracked.md; do
  [ -s "$H/knowledge/$p" ] && ok "knowledge/$p" || no "knowledge/$p missing/empty"
done
tn=$(ls "$H/knowledge/pages/thinkers/"*.md 2>/dev/null | wc -l | tr -d ' ')
[ "$tn" -ge 1 ] && ok "thinker pages: $tn" || wn "no thinker pages ingested yet"

echo "== workflows =="
[ -f "$H/workflows/deep-research.js" ] && ok "deep-research workflow installed" || wn "no deep-research workflow (built-in /deep-research may still apply)"

echo "== statusline =="
if [ -x "$H/statusline.sh" ]; then
  printf '{"model":{"display_name":"x"},"workspace":{"current_dir":"%s"}}' "$HOME" | "$H/statusline.sh" >/dev/null 2>&1 \
    && ok "statusline runs" || wn "statusline present but errored"
else wn "statusline.sh missing/not executable"; fi

echo "== optional automation =="
[ -f "$H/knowledge/sources/last-seen.json" ] && ok "daily-learn baselined" || wn "daily-learn not baselined (scripts/check-sources.py --promote)"

echo
echo "== summary: ✓ $pass  ⚠ $warn  ✗ $fail =="
[ "$fail" -eq 0 ] && { echo "RESULT: PASS${warn:+ (with $warn warnings)}"; exit 0; } || { echo "RESULT: FAIL ($fail blocking)"; exit 1; }
