# How Karpathy thinks

One line: build the smallest real thing that exhibits the phenomenon, instrument it with one
honest metric, and let it ratchet — treat the context window as the new programmable surface.

## Core mental models
- **Software 3.0**: the context window is your program, the LLM is the interpreter, prompting is
  programming. Model weights ≈ CPU, context window ≈ RAM. → engineering value moves to *context
  engineering* and to designing the harness around the model, not just the model. ([Software 3.0](https://www.latent.space/p/s3))
- **Minimal real setups**: nanochat / autoresearch / the LLM-wiki gist are all the same move —
  the smallest *real* (not toy) system that lets you study a phenomenon and iterate ~100×/night.
- **Ratchet over genius**: progress = many cheap experiments against one objective metric, keep-if-better.
  Don't hand-design the answer; let search + a good eval find it. → [[karpathy-autoresearch]].
- **Memory that compounds**: knowledge should accumulate in a persistent artifact, not be re-derived. → [[karpathy-llm-wiki]].
- **Patterns are abstract on purpose**: he ships the *pattern* (gist) and tells you to instantiate
  it with your agent for your domain. Generalize the method, specialize the instance.
- **A corpus of minimal-real implementations**: micrograd → minGPT → nanoGPT → llm.c → minbpe →
  nn-zero-to-hero → nanochat → autoresearch (~88k★) are the same move repeated — the smallest
  *runnable, real* version that teaches the concept. Learn the *method* from the series, not any one repo.

## Recent (2026)
- **Joined Anthropic's pre-training team** (announced 2026-05-19, under Nick Joseph): "using Claude to
  accelerate pre-training research" — AI-assisted research as the competitive lever, not raw compute.
  He's now applying the overnight-experiment / ratchet ideas *inside* a frontier lab. ([TechCrunch](https://techcrunch.com/2026/05/19/openai-co-founder-andrej-karpathy-joins-anthropics-pre-training-team/))
- **"Software on tap" / Jevons Paradox for code** (X, 2026-06-09): as working software "increasingly
  comes out on a tap," demand for software *grows* rather than shrinks — explainers, visualizers,
  bespoke single-use apps, 10×'d test suites, giant research runs with custom HTML reports. A fresh
  *economic* framing (induced demand for bespoke software) distinct from the Software 3.0 *paradigm*
  framing. ([via simonwillison.net](https://simonwillison.net/2026/Jun/9/andrej-karpathy/))

## How to apply
- Before optimizing, define the cheapest honest metric ([[defining-an-eval]]).
- Prefer a small, controllable specimen + fast loop over one big expensive attempt.
- Put the thinking into the context/harness, not just the prompt.
- "Software on tap" → lower the bar for one-off bespoke tooling (a quick visualizer/dashboard for a
  problem is now cheap enough to always make); the constraint is taste/verification, not typing.

Sources: see raw/sources.md; [[when-to-use-what]], [[ratchet-loop-implementation]].
