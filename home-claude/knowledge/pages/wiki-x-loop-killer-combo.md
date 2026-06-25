# Wiki × Loop — the killer combo

One line: [[karpathy-llm-wiki]] is **memory**, [[karpathy-autoresearch]] is **search**; combining
them means every optimization the loop discovers is filed back into the wiki and compounds.

## The gap this fills
Most autoresearch forks have **no memory** — they re-explore dead ends every run. Most wikis are
passive — nothing actively grows them. Wire them together:

```
loop proposes  ──query──▶  Wiki (has we tried this? what happened?)
loop scores + keeps/discards
loop result    ──ingest─▶  Wiki (experiments/ + log.md)
periodic lint  ──────────  Wiki (consolidate into durable insight pages)
```

## Why it compounds
- The loop stops repeating known-bad ideas (memory prunes the search).
- Winning patterns ("few-shot + role priming wins extraction tasks") become reusable insight
  pages, usable by humans and future loops across domains.
- One shared wiki serves many loops (prompt-opt, copy-opt, sql-opt) → cross-domain transfer.

## This project's milestones
M1 build wiki · M2 single loop (no memory baseline) · M3 wire memory in · M4 more domains ·
M5 graph upgrade when the wiki overflows one context window. See the plan file.

Sources: synthesis of [[karpathy-llm-wiki]] + [[karpathy-autoresearch]].
