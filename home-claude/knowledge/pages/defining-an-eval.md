# Defining an eval (the hardest part)

One line: the ratchet loop is only as good as the single number `eval.py` produces — turning
"what is better" into an objective, cheap, honest score is the real work.

## Properties a good eval needs
- **Objective**: same candidate → same score. No human in the per-round loop.
- **Cheap**: runs in seconds, so you can afford ~100 rounds.
- **Discriminative**: small real improvements move the number.
- **Honest / hard to game**: a held-out set the agent can't overfit by memorizing.

## Patterns by domain
- **Prompt-opt**: accuracy / F1 on a hand-built input→expected test set. Exact-match,
  contains-match, or an LLM-judge rubric for open-ended outputs.
- **Copy-opt**: an LLM-judge score against a rubric (clarity, hook, CTA), or a predicted-CTR model.
- **SQL-opt**: measured query latency on a real local DB (median of N runs), with a correctness gate.

## Traps
- **Goodhart**: the loop games a weak metric (e.g. keyword matching). Keep a held-out set and
  occasionally eyeball top candidates.
- **Noisy eval**: average several runs; a metric noisier than the improvement hides real wins.
- **No correctness gate**: optimizing speed/score while silently breaking the output.

Sources: [[ratchet-loop-implementation]]; project plan file.
