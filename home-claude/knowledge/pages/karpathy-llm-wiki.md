# Karpathy LLM Wiki

One line: a persistent markdown knowledge base an LLM incrementally maintains, replacing
stateless RAG with knowledge that **compounds** — the memory half of [[wiki-x-loop-killer-combo]].

## The idea
Traditional RAG re-derives knowledge from raw documents on every query. The LLM Wiki instead
has the LLM build and maintain a persistent wiki that sits between the user and the sources.
The cross-references, contradiction flags, and synthesis are already there when you query.

## Three layers
- **raw/** — immutable source documents.
- **wiki/ (pages)** — LLM-compiled markdown articles with `[[cross-references]]`.
- **schema** (`CLAUDE.md` / `AGENTS.md`) — documents structure + workflows.

Plus two special files: `index.md` (catalog that fits one context window) and `log.md`
(append-only history).

## Three operations
- **Ingest** — process a new source, write/update pages, maintain cross-refs + index.
- **Query** — read index, pull pages, synthesize a cited answer; file good answers back.
- **Lint** — find contradictions, stale claims, orphan pages.

## When it beats RAG
Personal / small-team knowledge under ~100k tokens. For large, fast-changing, multi-user
corpora, RAG still wins. When the wiki outgrows one context window, see [[agent-memory-infra]]
for the graph upgrade (M5).

Sources: see raw/sources.md (Karpathy gist, particula.tech, atlan.com).
