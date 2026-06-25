# Raw Sources (immutable — append only)

First batch, from the 2026-06-24 deep research. These are pointers/excerpts; treat as immutable.

## Ratchet loop / autoresearch
- karpathy/autoresearch — https://github.com/karpathy/autoresearch
  AI agent edits train.py, trains nanochat under a fixed 5-min budget, scores val_bpb,
  keeps-if-better/discards. ~100 experiments/night. ~66k stars.
- The New Stack — https://thenewstack.io/karpathy-autonomous-experiment-loop/
  630-line script ran ~50 experiments overnight, found a better LR, committed to git unattended.
- DataCamp guide — https://www.datacamp.com/tutorial/guide-to-autoresearch
- Fortune, "The Karpathy Loop" — https://fortune.com/2026/03/17/andrej-karpathy-loop-autonomous-ai-agents-future/

## LLM Wiki
- Karpathy gist — https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
  3-layer pattern: raw/ -> wiki/ -> index.md/schema. ingest/query/lint. No embeddings.
- particula.tech — https://particula.tech/blog/karpathy-llm-wiki-compiled-knowledge-vs-rag
- atlan.com (vs RAG, enterprise reality) — https://atlan.com/know/llm-wiki-vs-rag-knowledge-base/

## Ecosystem
- yibie/awesome-autoresearch — https://github.com/yibie/awesome-autoresearch (autoloop, AutoKernel, forks)
- SakanaAI/AI-Scientist — https://github.com/SakanaAI/AI-Scientist
- HKUDS/AI-Researcher — https://github.com/hkuds/ai-researcher
- assafelovic/gpt-researcher — https://github.com/assafelovic/gpt-researcher
- mem0 — https://github.com/mem0ai/mem0
- getzep/graphiti — https://github.com/getzep/graphiti

## Thinkers / agentic engineering
- Simon Willison, "Agentic Engineering Patterns" — https://simonw.substack.com/p/agentic-engineering-patterns
  5 named patterns for pro use of coding agents; pro-engineering vs vibe-coding.

## Hardware (for the optional training revisit)
- NVIDIA DGX Spark — https://www.nvidia.com/en-us/products/workstations/dgx-spark/
  GB10 Grace Blackwell, 128GB unified memory, 6144 CUDA cores, CUDA on arm64, ConnectX-7 to link two.
- jasonacox/dgx-spark (nanochat on Spark) — https://github.com/jasonacox/dgx-spark

## Skill design / discoverability
- Anthropic Agent Skills — https://www.anthropic.com/engineering
- Progressive disclosure — https://ardalis.com/optimizing-ai-agents-with-progressive-disclosure/
- Claude Code skills guide — https://vanja.io/claude-code-skills-guide/

## AI honesty & verification (deep research 2026-06-25)
- Sharma et al. ICLR 2024 — https://arxiv.org/abs/2310.13548
- SycEval (Stanford) — https://arxiv.org/abs/2502.08177
- Perez et al. ACL 2023 — https://arxiv.org/abs/2212.09251
- Anthropic Constitution — https://www.anthropic.com/constitution
- OpenAI sycophancy post-mortems — https://openai.com/index/sycophancy-in-gpt-4o/ , https://openai.com/index/expanding-on-sycophancy/
- Anthropic Opus 4.5 system card (hidden tests) — https://assets.anthropic.com/m/64823ba7485345a7/Claude-Opus-4-5-System-Card.pdf
- METR reward hacking — https://metr.org/blog/2025-06-05-recent-reward-hacking
- SWE-bench Verified — https://openai.com/index/introducing-swe-bench-verified/ ; princeton-nlp/SWE-bench
- Anthropic effective harnesses — https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents

## Product-gen with agent teams (deep research 2026-06-25)
- MetaGPT — https://arxiv.org/abs/2308.00352 ; https://github.com/FoundationAgents/MetaGPT
- ChatDev — https://arxiv.org/abs/2307.07924 ; https://github.com/OpenBMB/ChatDev
- MAST failure taxonomy (NeurIPS 2025) — https://arxiv.org/abs/2503.13657
- E2EDevBench — https://arxiv.org/html/2511.04064v1
- single vs multi-agent — https://arxiv.org/abs/2604.02460
- OpenHands — https://github.com/OpenHands/OpenHands ; CrewAI — https://github.com/crewAIInc/crewAI (Crews vs Flows: https://docs.crewai.com/en/concepts/flows)

## Demand validation & MVP (deep research 2026-06-25)
- Paul Graham — https://www.paulgraham.com/startupideas.html ; https://www.paulgraham.com/ds.html
- Eric Ries / Lean Startup — https://theleanstartup.com/principles
- The Mom Test — https://www.momtestbook.com/
- YC library (get & test ideas) — https://www.ycombinator.com/library/7x-how-to-get-and-test-ideas
- Fake-door/smoke test — https://kromatic.com/real-startup-book/4-evaluative-market-experiment/fake-door-smoke-test/
- gpt-engineer — https://github.com/AntonOsika/gpt-engineer ; bolt.diy — https://github.com/stackblitz-labs/bolt.diy

## Growth & marketing (deep research 2026-06-25)
- Rob Walling Stair Step — https://microconf.com/latest/the-stairstep-approach-to-bootstrapping
- First Round (pick a lane) — https://review.firstround.com/drive-growth-by-picking-the-right-lane-a-customer-acquisition-playbook-for-consumer-startups/
- Lenny (first 1000 users) — https://www.lennysnewsletter.com/p/how-the-biggest-consumer-apps-got
- Google AI content policy — https://developers.google.com/search/docs/fundamentals/using-gen-ai-content
- HN Show HN — https://news.ycombinator.com/showhn.html ; PostHog — https://github.com/PostHog/posthog ; Umami — https://github.com/umami-software/umami

## Prediction-market tools (deep research 2026-06-25)
- Polymarket API docs — https://docs.polymarket.com/api-reference/introduction
- Kalshi API/docs — https://docs.kalshi.com/welcome ; Data ToS — https://kalshi-public-docs.s3.amazonaws.com/kalshi-data-terms-of-service.pdf
- CFTC Polymarket amended order — https://www.cftc.gov/media/12806 ; 17 CFR 4.14 — https://www.law.cornell.edu/cfr/text/17/4.14
- jon-becker/prediction-market-analysis — https://github.com/jon-becker/prediction-market-analysis
