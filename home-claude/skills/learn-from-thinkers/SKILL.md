---
name: learn-from-thinkers
description: Refresh the knowledge base from the tracked AI thinkers/sources — check each for new material, ingest what's new, and report what changed and where it could plug into the user's skills/loops/projects. Use when the user says "learn from the thinkers", "what's new from Karpathy/Simon/Anthropic", "update my knowledge", or wants a periodic self-learning pass. Later this is what a daily /schedule routine runs.
---

# learn-from-thinkers

Periodic self-learning pass over the people/orgs the user wants to keep learning from.

## Source list
Read `~/.claude/knowledge/sources/tracked.md` for who to watch and which page each maps to.

## Steps
1. For each tracked source, check for material newer than its page's last update (use the page's
   date and `log.md`). Use `deep-research` / WebSearch to find recent repos, posts, talks.
2. For anything genuinely new, run the **ingest-source** flow to update that thinker's page
   (extract the new thinking; don't restate what's already there).
3. After updating, produce a short **report** to the user:
   - **What's new**: 1 line per source that changed (nothing if unchanged — say so honestly).
   - **Where it plugs in**: for each new idea, name the concrete slot it could improve — a specific
     skill, a loop (`~/projects/wiki-loop-lab/loop/`), the global `CLAUDE.md`, or a project.
   - **Suggested actions**: 1–3 small next steps (e.g. "add a `copy-opt` loop", "update when-to-use-what").
4. Commit the knowledge repo.

## Rules
- Be honest about "nothing new" — don't manufacture updates.
- The value is the **"where it plugs in"** mapping; always tie new knowledge to an action slot.
- Keep each thinker page focused; move durable cross-cutting lessons into a dedicated page and link it.

## Scheduling (later)
Once this runs well manually, `/schedule` a daily routine whose prompt is "run the
learn-from-thinkers skill and report". Runs in the cloud; needs claude.ai login. (Tracked in
`~/.claude/knowledge/pages/backlog.md`.)
