# How swyx / Latent Space thinks (AI engineering as a discipline)

One line: AI engineering is a new *discipline* (not a research role) — Latent Space runs as a curated
hub that interviews frontier practitioners to synthesize "what's actually working," prizing editorial
taste over volume.

## Core mental models / recurring themes
- **"The Rise of the AI Engineer" (2023, still the anchor thesis).** A new role between the ~5K frontier
  ML researchers and ~50M software engineers: people who *build production apps atop foundation-model
  APIs* without training anything. Operates "fire, ready, aim" — exploits emergent capabilities by
  shipping, not by data collection. (Karpathy co-signed it.)
- **Software 3.0 / "Code Core, LLM Shell."** Classic explicit programming (Software 1.0) re-emerges
  *around* LLMs — deterministic code orchestrating intelligence, not pure prompt engineering. (Karpathy's
  "Software 3.0" talk debuted on Latent Space.) → [[thinkers/karpathy]].
- **The Agent Labs playbook + "reversal of the bitter lesson."** Bootstrap on frontier models → specialize
  on your domain data → train proprietary models only once workload/signal justify it. Start general,
  go specific as scale and domain clarity emerge.
- **"Coding agents breaking containment" (2026 thesis).** 2025 = year of coding agents; 2026 = those
  agents expanding to *everything else*. Related: **"Dark Factories"** (zero-human-review coding) and
  **Skills as minimal viable packaging** (markdown + scripts as the stabilized agent-harness format). →
  [[skill-discoverability]], [[thinkers/matt-pocock]].
- **Memory as the next wedge.** Models get swapped quarterly, but accumulated data, rubrics, and
  multi-turn RL persist — the durable moat. → [[karpathy-llm-wiki]], [[agent-memory-infra]].
- **"Scaling without Slop" + Learn in Public.** Personal taste/editorial judgment ("saying no a lot")
  is the scaling strategy against AI slop; "writing is thinking." Career growth = transparent, public
  knowledge-building.

## How to use this hub
- Treat Latent Space as a **practitioner-discourse filter**: it surfaces what's working in production
  (agents, evals, context engineering) from frontier builders — track the working consensus, not hype.
- Apply the **Agent Labs playbook** for build-vs-train: stay on frontier APIs, accumulate domain
  data/evals, specialize only when signal justifies it. → [[when-to-use-what]].
- Adopt the **Skills** framing (markdown + scripts) as the stable unit for packaging agent capabilities.

Attribution: "Rise of the AI Engineer," "Learn in Public," "Code Core/LLM Shell," "Scaling without Slop"
are clearly swyx/Latent Space. "Agent Labs," "coding agents breaking containment," "Dark Factories,"
"memory as wedge" come from 2026 Latent Space posts (some co-authored) — paraphrased, not verbatim.

Sources: [The Rise of the AI Engineer](https://www.latent.space/p/ai-engineer);
[Scaling without Slop (2026)](https://www.latent.space/p/2026);
[AIE Europe Debrief + Agent Labs Thesis (2026)](https://www.latent.space/p/unsupervised-learning-2026). This is the *hub* feeding many other tracked thinkers.
