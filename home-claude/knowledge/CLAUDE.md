# Global Knowledge Base — schema

This is the **global, cross-project knowledge base** (an LLM Wiki, Karpathy's pattern). It lives
in `~/.claude/knowledge/` so it is available from **every** project. It holds *universal* knowledge
(how the best practitioners think, reusable patterns, decision guides, your own insights) — NOT
project-specific knowledge, which stays in each project's own `.claude/`.

## Layout
- `raw/`            — immutable sources / pointers. Append only.
- `pages/`          — compiled articles, cross-referenced with `[[slug]]`.
  - `pages/thinkers/` — "how X thinks" pages (Karpathy, Simon Willison, Anthropic eng, Boris Cherny…).
- `index.md`        — catalog; read first; keep within one context window.
- `log.md`          — append-only history of ingest / query / lint.

## Workflows (same as the lab wiki)
- **Ingest**: read a source → write/update a `pages/` article (extract the *thinking*, not raw text)
  → update `index.md` + cross-refs → append `log.md` (`## [YYYY-MM-DD] ingest | <title>`).
- **Query**: read `index.md` → pull pages → answer **with citations** → file good answers back.
- **Lint**: fix contradictions, stale claims, orphan pages; keep `index.md` honest.

## How this gets used
- The `ingest-source` and `learn-from-thinkers` skills write here.
- `~/.claude/CLAUDE.md` points Claude here for "how should I approach this" questions.
- Start with `pages/when-to-use-what.md` — the decision guide for Skill vs prompt-opt vs Deep Research.

## Scaling
When `index.md` outgrows one context window, layer a graph index (graphiti/mem0) on top while
keeping markdown as the source of truth. See [[agent-memory-infra]] and `pages/backlog.md`.
