# claude-foundation

*([繁體中文版 / Traditional Chinese](README.zh-TW.md))*

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

## Using it — what each piece does

The whole design is **anti-drift** (stay locked on the goal) + **proof over claims** (prove "done"
with evidence, not assertions).

### Runs automatically (active the moment you install — nothing to remember)

| Feature | Fires when | What it does |
|---|---|---|
| **load-north-star** | every new session / resume / clear | Injects the current project's `north-star.md` into context so Claude always knows the goal & constraints. |
| **re-anchor** | every 10 prompts | Forces a one-line checkpoint: restate the goal, confirm the work still advances it, flag any drift. Tune with `REANCHOR_EVERY`. |
| **proof-gate** | on `git push` / `gh pr merge` / `npm publish` etc. | If no test ran this session, it **blocks** and tells you to test first. Re-running the same command proceeds (conscious override). |

Also installed: the **CLAUDE.md** working principles (every project inherits plan→review→execute,
honesty/verification, right-tool-for-the-job) and the **statusline** (model / context% / 5h & 7d usage).

### Skills you invoke with `/`

| Skill | Use when | One-liner |
|---|---|---|
| `/new-project` | starting a new project/repo | Scaffolds `north-star.md` + `.claude/` so the north-star hook has something to inject. |
| `/validate-idea` | you have a product/startup idea and wonder "should I build it?" | Runs the demand-validation playbook (Mom Test questions, fake-door test, thin MVP) → honest go/no-go. |
| `/ingest-source` | you find a great article/repo/person to keep | Researches it, extracts the *thinking* (not raw text), writes one knowledge-wiki page. |
| `/learn-from-thinkers` | you want to refresh your knowledge base | Checks tracked AI thinkers for new material, ingests only what's new, reports where it plugs in. |
| `/optimize-prompt` | tuning a reusable prompt and you have a testset | Ratchet loop: propose a change → score → keep only if better → bake the winner into a skill. |

### The knowledge wiki — your external brain

`~/.claude/knowledge/` ships reference pages (context engineering, honest AI, demand validation,
per-thinker distillations…). Claude consults `knowledge/index.md` when you ask "how should I approach
X / how would <person> think about this". Read it directly, or keep growing it with `/ingest-source`.

### Optional: daily self-learning

`scripts/daily-learn.sh` + `check-sources.py` is a **token-thrifty** auto-learn job: a free no-LLM
sensor checks tracked sources over plain HTTP first; Claude only runs when something actually changed
(quiet days cost 0 tokens). Enable it by wiring it to cron/launchd with the `claude` CLI on PATH
(or `CLAUDE_BIN` set).

### A typical flow

```
install → /new-project (set the goal) → work (north-star + re-anchor keep you on track)
→ /validate-idea before building → /ingest-source to bank what you learn
→ proof-gate forces tests before you push → done
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
