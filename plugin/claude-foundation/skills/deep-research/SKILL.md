---
name: deep-research
description: Deep research harness — fan-out web searches, fetch sources, adversarially verify claims, synthesize a cited report. Use when the user wants a deep, multi-source, fact-checked research report on a topic (e.g. "deep research on X", "research and verify Y", "build me a cited report on Z").
---

# deep-research

A deterministic multi-agent research **workflow**: Scope → Search → Fetch → 3-vote adversarial
Verify → Synthesize. It fans out parallel web searches, extracts falsifiable claims, kills the ones
that don't survive skeptical verification, and returns a cited report. The harness lives in
`workflows/deep-research.js` (installed to `~/.claude/workflows/deep-research.js`).

## Before you run
If the question is underspecified (e.g. "what car should I buy" with no budget/use-case/region),
ask 2–3 clarifying questions first, then weave the answers into the question you pass in. A sharp
question is the single biggest lever on output quality.

## How to run it
Invoke the workflow with the research question as `args`:

```
Workflow({ name: 'deep-research', args: '<the refined research question>' })
```

If the name doesn't resolve (e.g. workflows weren't installed under `~/.claude/workflows/`), fall
back to the file path:

```
Workflow({ scriptPath: '~/.claude/workflows/deep-research.js', args: '<question>' })
```

The workflow returns a structured object: `summary`, `findings` (each with confidence + sources +
evidence), `refuted` claims (for transparency), `sources`, and `stats`.

## After it returns
- Present the executive `summary` first, then the findings grouped by confidence, with sources cited.
- Surface the `caveats` and `openQuestions` honestly — don't bury what's uncertain or unverified.
- If `findings` is empty (all claims refuted, or no claims extracted), say so plainly rather than
  padding — that's a real signal the sources were weak or the claim was overstated.
- To bank the result as durable knowledge, hand off to `[[ingest-source]]` / the knowledge wiki.

## Notes
- Tunable constants live at the top of the workflow (`VOTES_PER_CLAIM`, `MAX_FETCH`,
  `MAX_VERIFY_CLAIMS`). Defaults: 3 votes/claim, ≥2 refutes to kill, 15 sources, 25 claims verified.
- This is **read-the-world** research (fills the knowledge wiki). For iterating an artifact against a
  score, use `optimize-prompt` instead — see `pages/when-to-use-what.md`.
