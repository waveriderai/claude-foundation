# How Tobi Lütke thinks

One line: Shopify's CEO who is *also* a hands-on builder — he ships code and tools. Two artifacts matter
here: **QMD** (a local-first semantic-search memory engine for agents — his actual repo) and his
**"reflexive AI"** memo (the org/adoption lens). QMD is the one that maps directly onto this foundation.

## QMD — "Query Markdown Documents" (his built artifact) ← the main thing
[github.com/tobi/qmd](https://github.com/tobi/qmd) · `npm i -g @tobilu/qmd` · 21k+★. Built after ~700 coding
sessions where *"every session started from scratch — context from yesterday's debugging, gone."* It's the
**persistent-memory layer** for coding agents. Design choices that reveal his taste:
- **Markdown is the source of truth.** Index *your* notes/docs/session-logs in place; indexing is pull-based
  (scan directories, nothing pushed). Same bet as Karpathy's LLM-Wiki and this KB — plain files you can read/version.
- **Local-first, no cloud, no API calls.** Three GGUF models run on-device via `node-llama-cpp`:
  `embeddinggemma-300M` (embeddings), `qwen3-reranker-0.6b` (re-rank), a 1.7B query-expansion model.
  *"Your proprietary code never leaves your machine."* (CJK: override `QMD_EMBED_MODEL` → Qwen3-Embedding.)
- **Retrieval quality is layered, not one trick.** Hybrid pipeline = **BM25 (FTS5) + vector + LLM cross-encoder
  re-rank**, fused by Reciprocal Rank Fusion with position-aware weighting; plus query expansion (3 variants).
  His stated benchmark: BM25 ~50%, vector ~70%, **hybrid ~100% precision@k** → "layering beats any single backend."
- **Hierarchical context: "the why travels with the what."** Context attaches at folder/path level; a match
  returns the doc *plus* its parent context. Longer paths override parent context.
- **Agent-native I/O.** Ships an **MCP server** (`query`/`get`/`multi_get`/`status`) so Claude Code searches
  your memory mid-session; `--json/--files/--explain` output for pipelines. SQLite+FTS5+sqlite-vec under the hood.

## "Reflexive AI usage" memo (the org/leadership lens)
His 2025 public memo. Secondary here, but real: **reflexive AI usage is a baseline expectation** (default-on,
not optional); **stagnation is slow-motion failure**; use AI as **thought partner, deep researcher, critic,
tutor, pair programmer**; **learn only by using it a lot + share what you learned**; **100x ambition**;
**"what would this team look like if agents were already on it?"**; prove AI *can't* do it before asking for
headcount; AI usage shows up in performance/peer review. (Forrester's fair critique: risks over-claiming
productivity, treating AI as the reflexive answer, and over-relying on self-directed learning.)

## Taste / what he optimizes for
Local-first, files over services, layered quality over single-trick, ship-the-tool-yourself, velocity + wild
ambition, low ceremony, friction-removal. He builds the missing infrastructure rather than waiting for it.

## How to apply (to this foundation)
- QMD is **what this KB grows into when grep stops scaling**: same markdown-as-truth bet, plus local embeddings +
  hybrid re-rank + MCP. It's the concrete upgrade path already named in [[agent-memory-infra]] — and it runs on the
  user's [[local-infra]] (DGX Spark / local GGUF) with zero cloud. Strong candidate to wire in as the KB's search layer.
- His "AI as **critic**, not just generator" is exactly what a verification/proof discipline operationalizes
  ([[honest-ai-and-verification]]) — but weigh it against his anti-ceremony bar: a gate must be near-zero-friction.
- Size ambition up ("what if agents were already on the team?") before scoping small — but don't mistake reflex for proof.

Sources: [github.com/tobi/qmd](https://github.com/tobi/qmd); [gamgee.ai writeup](https://gamgee.ai/blogs/tobi-lutke-qmd-local-semantic-search/);
[memo (X)](https://x.com/tobi/status/1909251946235437514); [First Round](https://www.firstround.com/ai/shopify);
[Forrester critique](https://www.forrester.com/blogs/what-you-can-learn-from-shopifys-ceos-memo-on-workforce-ai/).
Relates to [[karpathy-llm-wiki]], [[agent-memory-infra]], [[local-infra]], [[context-engineering]], [[honest-ai-and-verification]].
