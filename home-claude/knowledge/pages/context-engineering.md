# Context engineering — keep the window clean (WRITE / SELECT / COMPRESS / ISOLATE)

One line: Lance Martin's 4-verb vocabulary for managing what's in the context window — the shared
language for "how do I keep context clean" (the discipline that scales agents, per [[thinkers/anthropic-engineering]]).

## The four moves
- **WRITE** — push info *out* of the window into durable storage (files, notes, the Wiki, memory) so
  it isn't lost and doesn't bloat context. (This whole foundation = WRITE.)
- **SELECT** — pull only the *relevant* pieces back in, just-in-time (read the page you need, not the
  whole base). Good descriptions + `index.md` make SELECT cheap.
- **COMPRESS** — summarize / compact history when nearing limits; keep decisions + open threads, drop noise.
- **ISOLATE** — split work across sub-agents / separate contexts so they don't pollute each other; each
  returns a distilled summary.

## How this foundation uses each
- WRITE: north-star.md, plan files, `~/.claude/knowledge/`. SELECT: skills auto-load by description;
  query `index.md` first. COMPRESS: fresh sessions per task; re-anchor distills the goal. ISOLATE:
  Explore/Plan sub-agents, the lab vs global split.

Sources: Lance Martin (context engineering for agents); see [[thinkers/lance-martin]], [[anti-drift]], [[when-to-use-what]].
