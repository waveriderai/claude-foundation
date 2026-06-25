# Anti-drift — keeping agents (and yourself) on the plan

One line: agents (and humans working with them) gradually wander off the original goal on long
tasks; the fix is to externalize the goal and re-anchor to it at checkpoints.

## The problem (it's real and named)
- **Agent / goal drift**: gradual deviation from the original goal/role over a long task. Six
  mechanisms: goal drift, context drift, role drift, tool-use drift, hallucination cascades, plan decay.
- Long-horizon success rates top out at **40–60%** regardless of model family. Bigger context
  windows don't fix it — the cause is working/episodic/semantic/procedural memory jammed into one
  window with nothing to refresh or scope it. ([agent drift](https://usewire.io/blog/agent-drift-why-long-running-ai-agents-lose-the-plot/), [goal drift arxiv](https://arxiv.org/pdf/2603.03258))

## The fixes (this foundation implements these)
- **Externalize state**: write goals/constraints/plan as persistent markdown (`north-star.md`,
  plan files, this Wiki); re-read at every major decision point.
- **Re-anchoring**: periodically restate the objective in your own words and ask "does the current
  action advance it?" — forces the goal back to the top of attention. (Foundation: SessionStart
  hook loads north-star; UserPromptSubmit hook re-anchors every ~10 turns.)
- **Hierarchical planning**: separate long-horizon goals from per-task execution.
- **Structured notes + compaction**: keep a scratchpad; distill history instead of dragging it all forward.
- **Fresh sessions**: start a new session when a coherent task finishes, rather than carrying everything.

## Personal symptom → fix
"Once I start working with the AI I get pulled away and forget what I set out to do (e.g. M4/M5)."
→ north-star.md + auto re-anchor + a tracked [[backlog]] so dropped items resurface.

Sources: see [[thinkers/anthropic-engineering]]; raw/sources.md.
