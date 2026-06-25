---
name: new-project
description: Scaffold a new project's anti-drift setup — create a north-star.md (goal/constraints/non-goals) and a .claude/ skeleton in the current directory. Use when starting work in a fresh project or repo, or when the user says "set up this project", "create a north star", or "scaffold this repo".
---

# new-project

Set up the current project so the global foundation (anti-drift hooks, global skills/knowledge)
works well here.

## Steps
1. Confirm the current working directory is the project root (ask if unsure).
2. Ask the user for, or infer from the repo, then fill in:
   - Goal (one sentence), why/outcome, constraints, non-goals, definition of done, open backlog.
3. Write `north-star.md` in the project root using the template at
   `~/.claude/templates/north-star.md`. This is what the SessionStart hook auto-loads.
4. Create `.claude/CLAUDE.md` with any project-specific working rules (keep it short; global
   `~/.claude/CLAUDE.md` already applies). If the project has its own domain knowledge, note that it
   lives in the project's `.claude/`, separate from the global `~/.claude/knowledge/`.
5. **Security check**: if the project touches auth / payments / secrets / PII, prompt the user to add a
   structural security gate (run `/security-review` before merge, a scanner in CI, or a hook) and record
   it in the north-star's Security section. Structural, not a prompt. See `knowledge/pages/security-gate.md`.
6. Tell the user the north star is now active: it loads into context at the start of every session,
   and the re-anchor hook will periodically check work still advances it.

## Notes
- Keep `north-star.md` short and current — it's loaded every session.
- Non-goals are the most valuable anti-drift field: they stop scope creep.
- Don't duplicate global rules into the project CLAUDE.md; only add what's project-specific.
