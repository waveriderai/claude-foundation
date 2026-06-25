# How Lance Martin thinks (context engineering)

One line: treat the context window like RAM in an operating system — agent quality is mostly a
context-management problem, so the engineer's job is "filling the context window with just the right
information for the next step" (the definition he credits to [[thinkers/karpathy]]).

## Core mental models
- **WRITE / SELECT / COMPRESS / ISOLATE** — his signature taxonomy (Jun 2025). Four strategies:
  - **Write** — persist info *outside* the window so it survives token limits: *scratchpads*
    (within-session notes/plans) and *memories* (cross-session, via reflection; episodic/procedural/semantic).
  - **Select** — pull the *relevant* subset back in: memory/scratchpad retrieval, **tool-selection RAG**
    (semantic-match tools to task, ~3× accuracy), code/knowledge RAG (grep + embeddings + re-rank, not embeddings alone).
  - **Compress** — keep only needed tokens: *summarization* (recursive/hierarchical; auto-compact at
    handoffs) and *trimming/pruning*.
  - **Isolate** — split context across boundaries: *multi-agent* (sub-agents with separate windows —
    "separation of concerns"), *sandboxing* (heavy objects live as env-state, not in the LLM), and
    *state objects* (expose only chosen fields each turn).
- **Attention budget / context as a finite resource.** Models degrade as context grows ("context rot");
  every token depletes a limited budget. Folds in Drew Breunig's failure modes: context **poisoning,
  distraction, confusion, clash**. → reinforces [[thinkers/anthropic-engineering]] (context engineering).
- **2026 reframe — 7 agent-design patterns** (Jan 2026): give agents a computer; multi-layer action
  space (push work to bash/OS, not a bloated tool registry); progressive disclosure (reveal docs on
  demand); offload context; cache context (prompt caching); isolate context; **evolve context** (distill
  trajectories into reusable skills/memory — update context, not weights). → the [[karpathy-llm-wiki]] move.
- **Ambient agents.** Long-horizon background agents need human-in-the-loop checkpoints; cheap effective
  memory = capture human corrections and reflect on instructions from edits. → [[anti-drift]].
- **Single vs multi-agent.** Isolation buys parallelism and clean windows but costs up to ~15× tokens
  and coordination overhead (Cognition's shared-context warning). Default: exhaust prompting/workflows
  before going multi-agent. → [[when-to-use-what]].

## How to apply
- Treat context as a budget: Write/offload to files, Select narrowly, Compress at handoffs, Isolate only
  when parallelism justifies the token cost.
- Use multi-technique retrieval (grep + embeddings + re-rank) for code/knowledge — don't rely on embeddings alone.
- For ambient/long-running agents, wire human edits into memory and reflect to update instructions.

Attribution: WRITE/SELECT/COMPRESS/ISOLATE and the 7 patterns are his; "just the right information" he
credits to Karpathy; the four failure modes to Drew Breunig.

Sources: [Context Engineering for Agents (Jun 2025)](https://rlancemartin.github.io/2025/06/23/context_engineering/);
[Agent design patterns (Jan 2026)](https://rlancemartin.github.io/2026/01/09/agent_design/);
[Latent Space podcast](https://www.latent.space/p/context-engineering-for-agents-lance). Relates to [[thinkers/anthropic-engineering]], [[agent-memory-infra]].
