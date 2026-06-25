# How Anthropic's engineering thinks (agents)

One line: the model is fixed; engineer the **context** and the **harness**. Long-horizon work
fails from context problems, not capability — so externalize state and curate what enters the window.

## Core mental models
- **Context engineering**: deliberately curate what goes into the limited context window from
  constantly-evolving information. The discipline, not bigger windows, is what scales agents.
  ([Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents))
- **Compaction**: when nearing the limit, distill history high-fidelity — keep architectural
  decisions and open threads, drop the rest — so the agent continues with minimal degradation.
- **Structured note-taking / external memory**: maintain `NOTES.md` / to-do lists *outside* the
  window; re-read them at decision points. State lives in files, not in the conversation.
- **Sub-agents with clean contexts**: a subagent explores with tens of thousands of tokens and
  returns only a distilled summary; the orchestrator stays uncluttered. ([multi-agent system](https://www.anthropic.com/engineering/multi-agent-research-system))
- **Just-in-time retrieval**: hold lightweight identifiers, load data on demand, like a human.
- **Guardrails are explicit**: models don't exhibit desired long-running behavior by default;
  strongly-worded instructions + process requirements are needed. ([harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents))

## Recent (2026) — the trajectory
- **Agent Skills** (Oct 2025): equip agents with practical, file-based capabilities — the model for `~/.claude/skills/`.
- **Scaling Managed Agents — decouple the brain from the hands** (Apr 2026): separate the reasoning
  model (expensive, plans) from the execution layer (cheap, acts). Mirrors human-in-the-loop "architect vs builder".
- **Claude Code auto mode — safer way to skip permissions** (Mar 2026): guardrails for autonomy.
- **Harness design for long-running app development** (Mar 2026): the harness, not the model, is the lever.
- Through-line: capability scales by engineering **context + harness + skills**, not by a bigger model.

## How to apply (this foundation does exactly this)
- Externalize goals/plan to markdown (north-star.md, plan files, the Wiki) and re-read them.
- Use compaction + fresh sessions per coherent task; don't drag full history forward.
- Delegate big reads to sub-agents that return summaries.

## Related practitioner framings
- [[thinkers/lance-martin]] gives the actionable taxonomy for this: WRITE / SELECT / COMPRESS / ISOLATE.
- [[thinkers/birgitta-bockeler]] extends "guardrails are explicit" into harness engineering (guides vs sensors).

Sources: see raw/sources.md; core basis of [[anti-drift]].
