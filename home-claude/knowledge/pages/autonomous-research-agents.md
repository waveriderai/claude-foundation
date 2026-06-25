# Autonomous research agents (ecosystem reference)

One line: the family of "AI scientist / autonomous research" projects around
[[karpathy-autoresearch]], for borrowing patterns rather than rebuilding.

## Projects
- **karpathy/autoresearch** (~66k★) — the ratchet loop on nanochat training.
- **yibie/awesome-autoresearch** — curated derivatives: `autoloop` (generalizes the loop to any
  repo with an inferred eval), `AutoKernel` (GPU kernels), serverless/platform forks.
- **SakanaAI/AI-Scientist** + v2 — full pipeline: hypothesize → experiment → write a paper
  (agentic tree search in v2). Broader/heavier than the minimal ratchet loop.
- **HKUDS/AI-Researcher** (NeurIPS 2025) — autonomous research pipeline, identifies gaps.
- **assafelovic/gpt-researcher** (~20k★) — deep web research agent; useful as an **ingest source**
  for the wiki, not as the loop.

## What to borrow for this project
- `autoloop`'s "infer the eval command + guardrails + keep/discard" pattern for [[ratchet-loop-implementation]].
- gpt-researcher / the deep-research skill to feed `raw/` during ingest.

Sources: see raw/sources.md.
