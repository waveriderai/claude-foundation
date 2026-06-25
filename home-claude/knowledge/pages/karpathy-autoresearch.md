# Karpathy AutoResearch

One line: the "ratchet" loop — an agent proposes a change, an objective eval scores it, and
the change is **kept only if better**, else discarded. The search half of [[wiki-x-loop-killer-combo]].

## Original form
Give an agent a small-but-real LLM training setup. It edits `train.py` (architecture,
optimizer, hyperparameters), trains nanochat under a fixed **5-minute** budget, and scores
**val_bpb** (validation bits per byte; lower is better). Keep-if-better, ~100 experiments/night.
Found structural wins (QK-norm scaler, value-embedding regularization) → ~11% faster to GPT-2.

## Two models, don't conflate (see appendix Q1 in the plan)
- **Brain** = the agent (cloud LLM: Claude/GPT/GLM) that proposes and judges.
- **Specimen** = the small model being trained; a disposable test subject, not a product.

## The transferable primitive
The loop is domain-agnostic: anything with a cheap, objective score can be ratcheted. That's
why this project drops training entirely and applies the loop to prompts / copy / SQL — see
[[ratchet-loop-implementation]] and [[defining-an-eval]]. No runner exists; you point an agent
at `program.md`.

Sources: see raw/sources.md (autoresearch repo, The New Stack, DataCamp, Fortune).
