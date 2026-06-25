# claude-foundation

A reusable **Claude Code foundation** — an "anti-drift personal AI OS" you can drop into any machine.
Clone it, run one script, and you get the same global setup: working principles, anti-drift hooks,
a knowledge wiki, a set of skills, and a statusline.

This is a **framework, not personal data**. It ships no credentials, history, sessions, or memories.

## What's inside

| Piece | Path | What it does |
|---|---|---|
| Working principles | `home-claude/CLAUDE.md` | Global how-we-work rules (plan→review→execute, honesty/verification, tool choice). |
| The map | `home-claude/FOUNDATION.md` | Index of all capabilities and where new things plug in. |
| Skills | `home-claude/skills/` | `new-project`, `ingest-source`, `learn-from-thinkers`, `optimize-prompt`, `validate-idea`. |
| Hooks | `home-claude/hooks/` | `load-north-star` (inject project goal), `re-anchor` (periodic drift check), `proof-gate` (block untested push/merge). |
| Knowledge wiki | `home-claude/knowledge/` | Reference pages on context engineering, honest AI, demand validation, autonomous research, etc. |
| Project template | `home-claude/templates/north-star.md` | Goal/constraints scaffold the `new-project` skill uses. |
| Self-learning | `home-claude/scripts/` | `check-sources.py` (free no-LLM change sensor) + `daily-learn.sh` (optional cron ingest). |
| Statusline | `home-claude/statusline.{py,sh}` | Model / context% / subscription-usage statusline. |
| Settings | `home-claude/settings.template.json` | Wires the hooks + statusline (paths filled in at install). |

## Install — two ways

### Option A — full setup (recommended)
Replicates the entire foundation into `~/.claude` (backs up any existing one first):

```bash
git clone <this-repo> claude-foundation
cd claude-foundation
./install.sh
```

Then restart Claude Code. The installer is additive and safe to re-run: it snapshots an existing
`~/.claude` to `~/.claude.backup.<timestamp>` and never touches your credentials/history/sessions.

Override the target with `CLAUDE_HOME=/path ./install.sh` (handy for testing).

### Option B — plugin only (skills + hooks)
If you just want the skills and anti-drift hooks via Claude Code's plugin system (no global CLAUDE.md,
knowledge wiki, or statusline):

```
/plugin marketplace add <this-repo-url-or-local-path>
/plugin install claude-foundation@claude-foundation
```

## What it deliberately does NOT ship
Credentials, chat history, sessions, logs, caches, the knowledge repo's git history, and the
`skipDangerousModePermissionPrompt` setting (a personal risk choice — left off by default).

## Requirements
- `python3` on PATH (anti-drift hooks + statusline + sensor).
- The `claude` CLI on PATH (or `CLAUDE_BIN` set) only if you wire up the optional `daily-learn.sh` cron.

## After installing
Read `~/.claude/FOUNDATION.md` — it's the map of everything and explains how to add your own
skills/hooks/knowledge on top.
