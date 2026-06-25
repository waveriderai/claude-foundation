# FOUNDATION — the map of your personal AI OS

This file is the index of your global capabilities and where new things plug in. Every project
inherits everything under `~/.claude/`. Build/test in the lab, promote here when proven.

## The three layers
```
LAB      ~/projects/wiki-loop-lab/   research + test (deep-research, prompt-opt loops)  →promote→
GLOBAL   ~/.claude/                  inherited by every project (this file's domain)
PROJECT  <any work repo>/            inherits global + its own north-star.md & .claude/
```

## Slots (where each kind of thing lives)
| Slot | Path | What goes here | Status |
|---|---|---|---|
| Working principles | `~/.claude/CLAUDE.md` | global how-we-work rules | ✅ done |
| Knowledge (memory) | `~/.claude/knowledge/` | universal Wiki: thinkers, patterns, guides | ✅ done |
| Skills | `~/.claude/skills/<name>/SKILL.md` | reusable procedures Claude can invoke | ✅ done |
| Subagents | `~/.claude/agents/<name>.md` | delegated specialists | ⬜ later |
| Commands | `~/.claude/commands/<name>.md` | slash commands (legacy; prefer skills) | ⬜ optional |
| Hooks | `~/.claude/hooks/` + `settings.json` | anti-drift: north-star loader, re-anchor; **proof-gate** (PreToolUse: blocks untested push/merge) | ✅ done |
| Per-project goal | `<project>/north-star.md` | that project's goal/constraints (template in `~/.claude/templates/`) | ✅ done |
| Promote | `~/projects/wiki-loop-lab/promote.sh` | copy a proven lab skill/page → global | ✅ done |

## Installed skills
- `new-project` — scaffold a project's north-star.md + .claude/ (anti-drift setup).
- `ingest-source` — research a URL/repo/person → write a knowledge page (uses `deep-research`).
- `learn-from-thinkers` — ingest tracked sources, report what's new + where it plugs in.
- `optimize-prompt` — the prompt-opt ratchet loop (one-time factory → bake winner into a Skill).
- `validate-idea` — run the demand-validation playbook on an idea → honest go/no-go (from [[demand-validation]]).
- `design-taste` — apply distinctive, non-AI-default taste to any UI/prototype/pipeline/brand (from [[design-taste]]; builds on the `frontend-design` plugin skill).

## How to add something new (the convention)
1. Build & test it in the lab (`~/projects/wiki-loop-lab/`).
2. Prove it (a loop score, or it works end-to-end).
3. `promote.sh` it into the right slot above.
4. Add a row/line here and in `knowledge/index.md` so it's discoverable.

## Skill-authoring conventions (keep the skill set lean & reliable)
When writing a new skill (see `~/.claude/knowledge/pages/skill-discoverability.md`):
- **Two-loads check**: decide auto-invoked vs user-invoked. Auto-invoked skills' descriptions sit in
  context *every turn* — only earn that if it fires often. Default side-effecting / rarely-used skills
  to user-invoked (`disable-model-invocation: true`).
- **~100-line cap**: keep `SKILL.md` short; move long templates/reference into separate files in the
  skill dir (progressive disclosure). The description is a *selector*, not a manual.
- **Anti-rationalization table** (for skills with skippable-but-critical steps): list the excuses the
  agent might use to skip a step → why it's wrong. Example:
  | excuse | reality |
  |---|---|
  | "the tests probably pass" | run them; proof over vibes |
  | "this edit is trivial, skip review" | trivial edits cause silent breakage; review anyway |
- **End in proof**: a skill should terminate in concrete evidence (a score, a passing test, a committed file).

## Security (sensitive projects)
If a project touches auth / payments / secrets / PII, add a **structural** security gate, not a prompt.
See `~/.claude/knowledge/pages/security-gate.md`; the `new-project` skill prompts for it.

## Backlog
See `~/.claude/knowledge/pages/backlog.md` (tracked-but-not-done, so nothing gets dropped).
