# Backlog — tracked, not yet done

One line: things we decided to do but haven't — kept here so drift doesn't drop them. Review
periodically; promote items into active work when ready. (This page IS an anti-drift mechanism.)

## From the foundation plan
- **F3 daily schedule**: `/schedule` a daily routine calling `learn-from-thinkers` (cloud; needs
  claude.ai login). Build the skill first, schedule after it's proven.
- **More ratchet loops (old M4)**:
  - `copy-opt` — marketing copy optimization (eval = LLM-judge rubric or predicted CTR).
  - `sql-opt` — query optimization (eval = measured latency on a local DB, with correctness gate).
- **Knowledge graph upgrade (old M5)**: when `~/.claude/knowledge/index.md` outgrows one context
  window, layer graphiti/mem0 as a retrieval index over the markdown (markdown stays source of truth).
  See [[agent-memory-infra]].

## Optional / someday
- Package the foundation as a Claude Code **plugin** for portability across machines.
- Revisit the nanochat/autoresearch **training** version on the 2× DGX Spark (learning the loop
  internals). See plan appendix.

Sources: foundation plan file; [[anti-drift]].
