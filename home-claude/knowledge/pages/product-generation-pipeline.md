# Building products with AI agent teams — how to architect the loop

One line: verified state of multi-role "AI software company" frameworks + the architecture answer
(workflow spine, bounded agents, saved skills) for a solo operator's research→MVP→build→iterate loop.
From deep research 2026-06-25 (adversarially verified; AREAS 2–4 are honest gaps, see bottom).

## The frameworks are real & adopted (10k+ stars) — but still demo-quality
| framework | ★ | roles / model | status for a solo operator |
|---|---|---|---|
| **OpenHands** | ~78.3k | repositioned as a **"developer control center"** orchestrating many agents (Claude Code/Codex/Gemini) | active, funded — **most credible direction** (orchestrate > one-autonomous-agent) |
| **MetaGPT** | ~69k | 5-role SOP pipeline: PM→PRD, Architect→design, PM→tasks, Engineer→code, QA→tests ("Code=SOP(Team)") | active, peer-reviewed (ICLR'24) |
| AutoGen | ~59k | agent-types / conversations | ⚠️ **maintenance mode** → use Microsoft Agent Framework |
| **CrewAI** | 54.3k | **Crews** (autonomous) vs **Flows** (deterministic) — ships the distinction | active |
| gpt-pilot | 33.7k | ~10-agent pipeline w/ review gates | ⚠️ unmaintained + 2026 security flag; admits "95% AI, 5% human" |
| ChatDev | ~27–33k | CEO/CTO/Programmer/Reviewer/Designer/Tester | research demo |

**How roles hand off:** via **structured documents/SOPs, not free-form chat** — each role emits a
standardized artifact. Structure beats chatter (the core design insight).

## Reality check (robust vs hype)
- **Capability ceiling**: ~**50%** end-to-end requirement completion (E2EDevBench); gains over a single
  agent "often minimal"; single-agent **matches** multi-agent when compute is held constant; ChatDev
  correctness as low as 25%. → not a hands-off product factory; all are human-in-the-loop.
- **Where it breaks = the hand-offs**: 1600+ annotated-trace study (MAST, NeurIPS'25) — failures split
  system-design ~42%, **inter-agent misalignment/hand-off ~33–37%** (not an edge case), verification ~23%.
- **The diagnosis (most useful signal)**: the bottleneck is **planning/comprehension + inadequate
  verification, NOT code-writing** (55.8% of failures are planning: omitted/misread requirements). →
  invest in tight specs + explicit verification gates, not fancier code generators.

## The architecture answer (the meta-question) — empirically grounded
**Deterministic WORKFLOW at the seams · autonomous AGENT only inside bounded steps · saved SKILLS for
repeatable bits.** This is exactly where the failure data says these systems break (hand-offs + planning),
so harden those seams with structure + verification and let the model be autonomous *only* where the path
is genuinely unknown. The frameworks that ship this explicitly (CrewAI Crews-vs-Flows; MetaGPT "Code=SOP")
match Anthropic's *Building Effective Agents*. Extends [[when-to-use-what]].

Concretely for **research → validate → MVP → build → iterate**:
- research / validate / spec / review / verify / publish = **workflow** stages (deterministic; put a
  verification gate at the end — cf. [[honest-ai-and-verification]] proof-gate, planning+verify > coding).
- "explore the codebase / write this module / debug this" = a **bounded agent** step.
- ingest-source · optimize-prompt · deep-research · a future validate-idea = **skills** (reusable).

## Coverage (after the 2026-06-25 follow-up pass)
- ✅ **Demand validation** (idea → demand test → MVP → first users) — now covered in [[demand-validation]]
  (high-confidence primary sources: PG, Eric Ries, The Mom Test, YC).
- ◑ **MVP/landing tools** — only the open-source ones verified (gpt-engineer 55.2k★, bolt.diy 19.5k★); the
  hosted builders (v0, Bolt.new, Lovable, Replit Agent) + no-code remain unverified.
- ✅ **Marketing/growth** (first 100→1000 users: channel focus, launch mechanics, AI-tooling reality check) —
  now covered in [[growth-marketing]]. (Specific AI-marketing-tool efficacy remains unproven/hype.)

Sources: arXiv 2308.00352 (MetaGPT), 2307.07924 (ChatDev), 2503.13657 (MAST), 2511.04064 (E2EDevBench),
2604.02460; GitHub repos above; CrewAI docs. Full cited report in the 2026-06-25 deep-research run.
