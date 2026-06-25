# Agent memory infrastructure (M5 reference)

One line: the graph/vector memory options to layer on top of the file-based [[karpathy-llm-wiki]]
when it outgrows one context window (project milestone M5).

## Options
- **[tobi/qmd](https://github.com/tobi/qmd)** (21k★) — local-first semantic search over **markdown in place**
  (pull-based, nothing migrated). On-device GGUF models via node-llama-cpp (embeddinggemma-300M + qwen3-reranker
  + 1.7B query-expansion); hybrid BM25+vector+LLM-rerank (RRF); ships an **MCP server** so Claude Code queries it
  mid-session. **Preferred first upgrade** here: keeps markdown as truth (zero lock-in), all local (fits [[local-infra]]
  DGX Spark), agent-native. See [[thinkers/tobi-lutke]].
- **getzep/graphiti** — temporal (bi-temporal) knowledge graph for agents; combines semantic
  embeddings, BM25 keyword, and graph traversal. Good when relationships + recency matter.
- **mem0** (~37k★) — managed memory layer; graph component captures entity/relationship links.
- **Letta / MemGPT** — self-editing memory (inner/outer monologue).
- **Zep** — temporal knowledge graphs for long-term agent memory.

## When to upgrade — explicit trip-wires (don't upgrade before one fires)
File-based + `index.md`-first **beats** semantic search on a small *curated* corpus (zero infra, no false-positive
recall risk). As of 2026-06-25 the KB is **28 pages / 124K, index.md = 43 lines** — nowhere near the line. Upgrade
(→ QMD first) only when one fires:
1. **`index.md` no longer fits one context window** (the original M5 trigger).
2. **grep/index-first starts missing pages** — the right page exists but your query words ≠ its wording (real recall failure, not hypothetical).
3. **You start indexing uncurated volume** — session transcripts, meeting notes, raw research dumps you can't hand-curate an index for. ← already latent: **~4.5M of `.jsonl` session logs** sit unsearched today (exactly QMD's origin problem: ~700 sessions starting from scratch).
4. **You want mid-session auto-retrieval** (agent queries memory via MCP without you pasting context).
Until one fires, the higher-leverage work is **writing durable pages/memories**, not adding a search layer to a thin corpus.

## Trial run (2026-06-25) — QMD installed against this KB, measured
Installed `@tobilu/qmd` 2.5.3 (Node 26 via brew; native `better-sqlite3` + `node-llama-cpp`), indexed the KB in
place (34 files → 56 chunks), pulled 3 local GGUF models (2.1G in `~/.cache/qmd/models`: embeddinggemma-300M,
qwen3-reranker-0.6b, qmd-query-expansion-1.7B). Measured on this corpus:
- **Keyword query** "proof gate verification" → lexical `qmd search` nailed `honest-ai-and-verification` @ 84%. Sharp.
- **Natural-language query** "how do I stop the agent from claiming done without proof" → lexical returned **0 results**
  (no token overlap); **hybrid `qmd query` recovered** the right pages (honest-ai @56%, Osmani "proof over vibes" @93%).
- On 34 curated docs hybrid ranking is **noisy & mildly non-deterministic** (LLM query-expansion can rank a sibling
  page above the bullseye).
**Verdict (evidence-backed):** for the small *curated* KB, index-first + grep still wins; QMD's real edge is
**natural-language recall where grep returns nothing** — which is precisely the MCP-agent and uncurated-transcript
case (trip-wires 3 & 4). Kept installed as the search layer; promote to default when a trip-wire fires.

## M5 upgrade stance
Keep markdown as the **source of truth** (portable, agent-agnostic). Layer a graph **index** on
top: query the graph for relevant nodes → read the corresponding markdown pages. The graph is a
retrieval accelerator, not a replacement. Trigger: `index.md` no longer fits one context window,
or queries start missing relevant pages.

## Why file-based first (for a single user / small team)
No infra, no embedding pipeline, version-controlled, swappable across agents. Graduate to graph
only when scale forces it.

Sources: see raw/sources.md (mem0, graphiti).
