---
name: optimize-prompt
description: Optimize a prompt with a ratchet loop — propose a change, score it on a testset, keep only if better. Use when the user wants to make a reusable prompt maximally effective and can define "better" with examples (e.g. "tune this classification prompt", "make this extraction prompt more accurate", "optimize my prompt"). Produces a tuned prompt to bake into a Skill. Needs a testset; if there's no objective score, just write the prompt well instead.
---

# optimize-prompt

Run Karpathy's keep-if-better ratchet loop on a prompt. This is the prompt-opt loop from the lab
(`~/projects/wiki-loop-lab/loop/prompt-opt/`), generalized.

## Preconditions (check these first)
- The prompt is **reused** enough that quality compounds (else just write it well — see
  `~/.claude/knowledge/pages/when-to-use-what.md`).
- You can define **"better" as a number**: a held-out testset of input→expected examples + a metric.
- If you can't measure better → stop; this is the wrong tool.

## Setup (per task)
Create a working dir (in the lab or the project) with:
- `candidate.md` — the prompt being optimized (keep an `{input}` placeholder).
- `testset.jsonl` — `{"input": ..., "expected": ...}` rows, held out.
- `eval.py` — renders candidate over the testset, calls the model (Claude via ANTHROPIC_API_KEY,
  or a deterministic mock offline), prints `SCORE=<float>`. Copy/adapt the lab's `eval.py`.
- `best.txt` — current best score. Track rounds in `journal.md`.

## The loop (repeat ~10–20 rounds)
1. Run `python eval.py --verbose`; note score + failing examples.
2. Form ONE hypothesis (enumerate labels, ask for format, add an example, handle an edge case…).
3. Edit `candidate.md`; run `python eval.py`.
4. **Keep if strictly better** → update `best.txt`, `git commit`. Else revert (`git checkout -- candidate.md`).
5. Log the round; optionally file the learning into the knowledge base (see `optimize-prompt` ↔ Wiki).
6. Stop when several rounds yield no gain.

## Output
The winning `candidate.md`. **Bake it into a Skill** so it's used daily — prompt-opt is the
one-time factory; the Skill is the product.

## Rules
- Change one thing per round. Never edit `eval.py`/`testset.jsonl` to inflate the score.
- The hardest part is the eval; see `~/.claude/knowledge/pages/defining-an-eval.md`.
