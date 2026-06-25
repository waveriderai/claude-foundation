# Knowledge Log

Append-only. Newest at the bottom.

## [2026-06-24] init | global knowledge base created
Promoted universal pages from ~/projects/wiki-loop-lab/wiki (karpathy-*, ratchet-loop-implementation,
defining-an-eval, agent-memory-infra, autonomous-research-agents, wiki-x-loop-killer-combo).
Added when-to-use-what (decision guide), CLAUDE.md schema, index, log, raw/sources.

## [2026-06-24] ingest | thinkers + anti-drift (from deep research)
Seeded pages/thinkers/{karpathy, simon-willison, anthropic-engineering, boris-cherny} and pages/anti-drift
from the 2026-06-24 deep research on systematic AI-augmented work and agent drift.

## [2026-06-24] ingest | Simon Willison — Agentic Engineering Patterns
Added 5 named patterns (writing-code-is-cheap, red/green TDD, first-run-the-tests, linear walkthroughs,
hoard-techniques) + his pro-vs-vibe-coding stance to pages/thinkers/simon-willison.md. Source cited.

## [2026-06-25] learn-from-thinkers | batch refresh + candidates
- karpathy: added minimal-real-implementation repo corpus (autoresearch ~88k stars).
- anthropic-engineering: added 2026 trajectory (Agent Skills, decouple brain/hands, auto mode, harness design).
- NEW pages/skill-discoverability (answers the "no memorizing commands" question).
- sources/candidates.md: 6 candidate thinkers pending review (Bockeler, Pocock, Osmani, Martin, Fowler, swyx).
- NOTE: Boris Cherny repos not pulled this round (his output is mostly in Claude Code itself); revisit.

## [2026-06-25] learn-from-thinkers | ingest 6 newly-tracked thinkers + 2 deltas
First pass over the 6 thinkers promoted to tracked.md earlier today (had no pages). Created:
- thinkers/birgitta-bockeler — harness engineering: guides (feedforward) × sensors (feedback), computational × inferential; harnessability.
- thinkers/matt-pocock — skill design: the "dumb zone" (~100K-token degradation), two-loads taxonomy (the skill-sprawl answer), progressive disclosure, leading words.
- thinkers/addy-osmani — 70% problem, knowledge paradox, anti-rationalization tables, "proof over vibes", PR contract.
- thinkers/lance-martin — context engineering taxonomy WRITE/SELECT/COMPRESS/ISOLATE; 7 agent-design patterns (incl. "evolve context").
- thinkers/martin-fowler — non-determinism as the real shift; hallucination-as-feature; VibeSec (security must be structural, not prompted; guests on his site).
- thinkers/swyx-latent-space — "AI Engineer" as a discipline; agent-labs playbook; memory-as-wedge; the practitioner-discourse hub feeding the others.
Deltas on existing pages (genuinely new since 2026-06-25 morning):
- karpathy: +joined Anthropic pre-training (2026-05-19); +"software on tap"/Jevons Paradox (2026-06-09).
- simon-willison: +prompt-injection-as-role-confusion (2026-06-22; destyling drops attack success 61%→10%).
Honest nothing-new: anthropic-engineering, boris-cherny unchanged. Simon had no new essay-grade piece beyond the injection note.
Cross-cutting: Böckeler's guides/sensors underpins Fowler/VibeSec; Pocock+Osmani both refine [[skill-discoverability]]; Lance Martin extends [[thinkers/anthropic-engineering]] context engineering.

## [2026-06-25] ingest | foundation conventions (from background-run suggestions)
- NEW pages/context-engineering (WRITE/SELECT/COMPRESS/ISOLATE) + pages/security-gate (VibeSec, structural).
- FOUNDATION.md: added skill-authoring conventions (two-loads, ~100-line cap, anti-rationalization table) + security note.
- north-star template + new-project skill: prompt for a structural security gate on sensitive projects.

## [2026-06-25] deep-research | sycophancy + unverified-completion
26 sources, 24/25 claims verified. Created pages/honest-ai-and-verification. Both pain points confirmed real
(Anthropic ICLR2024, SycEval, METR reward-hacking). Wrote 2 non-negotiable principles into ~/.claude/CLAUDE.md:
truth-over-agreement + proof-over-claims. Sources: arxiv 2310.13548 / 2502.08177, anthropic.com/constitution,
metr.org reward-hacking, Opus 4.5 system card (hidden tests), Thoughtworks Radar (feedback sensors).

## [2026-06-25] mechanism | verify-gate Stop hook (proof-over-claims enforcement)
Added ~/.claude/hooks/verify-gate.py + Stop hook in settings.json. Blocks turns that claim completion
without evidence/disclaimer; loop-safe via stop_hook_active; fail-open. Unit-tested 5 cases (a-e) all pass.
Documented in pages/honest-ai-and-verification.md + FOUNDATION.md.

## [2026-06-25] mechanism | proof-gate (action-gate) replaces prose verify-gate
The Stop-hook prose gate misfired in production (stale transcript read + keyword false positives) and was
removed from settings. Replaced with ~/.claude/hooks/proof-gate.py (PreToolUse:Bash): denies untested
git push/merge/publish, allows on retry; reads executed commands not prose (no race). Unit-tested 6 cases.
Also added pages/local-infra (DGX Spark 200B Qwen MoE over Tailscale; routing guide).

## [2026-06-25] deep-research | product-generation with agent teams (AREAS 1 & 5)
24 sources, 21/25 verified. NEW pages/product-generation-pipeline. Verified: role frameworks real & 10k+★
(OpenHands 78.3k, MetaGPT 69k, CrewAI 54.3k…) but demo-quality (~50% E2E completion); hand-offs+planning are
the failure modes, not coding. Architecture: deterministic workflow at seams + bounded agents + skills.
HONEST GAP: AREAS 2-4 (demand-validation, MVP tools, marketing) had ZERO verified claims — follow-up pass needed.

## [2026-06-25] ingest | Tobi Lütke (Shopify CEO) — org/leadership thinker
User asked to add "the Shopify CEO's report" (= Lütke's "Reflexive AI usage is now a baseline expectation"
memo, 2025) to the tracked thinkers. NEW pages/thinkers/tobi-lutke; added to tracked.md + index. Distinct
*organizational/adoption* axis vs the existing craft thinkers. Key models: reflexive AI / default-on,
stagnation=slow failure, AI-as-multi-role (esp. critic + tutor), learn-by-using, 100x ambition, agent-native
org design, AI-as-resource-gate, accountability via perf review. Held Forrester's 3 critiques. Used to
evaluate the proof-gate feature (his AI-as-critic + anti-ceremony lens → keep it, it's cheap and protects trust).
Sources: x.com/tobi/status/1909251946235437514, firstround.com/ai/shopify, Forrester critique.

## [2026-06-25] deep-research | demand validation + MVP tools (follow-up; AREAS A,B)
24 sources, 22/25 verified. NEW pages/demand-validation. HIGH-confidence primary sources (PG, Eric Ries, Mom
Test, YC): start from a real problem; validate demand before building (Mom Test + fake-door + commitment
ladder); desperate-need signal vs vanity metrics; thinnest MVP / concierge; recruit first 100 users manually.
MVP tools verified (OSS only): gpt-engineer 55.2k, bolt.diy 19.5k. STILL GAP: marketing/growth tools, hosted
builders (v0/Bolt/Lovable/Replit), AI demand-research tooling.

## [2026-06-25] correction | Lütke page reframed around QMD (the actual "report")
The "report" the user meant was **QMD** (github.com/tobi/qmd, 21k★), not the memo — corrected after the user
clarified "it's QMD" + gave the repo URL. QMD = local-first semantic-search MEMORY engine for coding agents:
markdown-as-source-of-truth, on-device GGUF models (embeddinggemma-300M + qwen3-reranker-0.6b + 1.7B query
expansion via node-llama-cpp), hybrid BM25+vector+LLM-rerank with RRF, hierarchical "the why travels with the
what" context, MCP server (query/get/multi_get/status) for Claude Code. Rewrote pages/thinkers/tobi-lutke to
lead with QMD (he's a hands-on builder, not just a leadership voice); memo kept as secondary org lens.
QMD maps directly onto [[karpathy-llm-wiki]]/[[agent-memory-infra]]/[[local-infra]] — concrete KB-search upgrade path.

## [2026-06-25] deep-research | growth & marketing (follow-up; AREA C gap closed)
28 sources, ~20 verified. NEW pages/growth-marketing. Completes the product trilogy (pipeline + demand-validation +
growth). Key: channel FOCUS not spraying (Walling/First Round/Bullseye); HN/PH launches cant be gamed; Google
does NOT penalize AI content (scaled-low-value is the trigger); NO AI marketing tool survived verification
(treat as hype until tested); only survivors = OSS instrumentation PostHog + Umami 37.3k. Built validate-idea skill.
