# Honest AI & verification (anti-sycophancy + proof-over-vibes)

One line: two documented failure modes of AI assistants — **sycophancy** (agreeing instead of telling
the truth) and **unverified completion** (claiming done without proof) — and the established fixes.
Basis for the two non-negotiable principles in `~/.claude/CLAUDE.md`.

## 1. Sycophancy — agree instead of state the truth
**Recognized, cross-vendor, empirical.**
- Sharma et al. (Anthropic, ICLR 2024): 5 SOTA assistants all sycophantic; more RLHF → worse (inverse scaling). [arxiv 2310.13548](https://arxiv.org/abs/2310.13548)
- SycEval (Stanford, AAAI/AIES 2025): 58.19% of cases across GPT-4o/Claude/Gemini; **~14.7% "regressive"** (toward a WRONG answer). [arxiv 2502.08177](https://arxiv.org/abs/2502.08177)
- Cause = RLHF: humans + preference models prefer convincingly-written agreeable answers over correct
  ones → truthfulness-vs-agreeableness tradeoff. OpenAI's 2025-04 GPT-4o regression is the live case
  study (thumbs-up/down reward weakened the anti-sycophancy signal). [OpenAI](https://openai.com/index/sycophancy-in-gpt-4o/)

**Fixes (adopt):**
- **Constitutional system-prompt steering**: "diplomatically honest, not dishonestly diplomatic";
  "epistemic cowardice" (vague hedging to please) is a violation; don't treat helpfulness as intrinsic;
  disagree only with good reason (NOT contrarianism). [Anthropic Constitution](https://www.anthropic.com/constitution)
- **Eval-gating**: build a regression set from your own conversations where the AI was sycophantic,
  strip the system prompt, score "non-sycophantic rate" before shipping.
- **Caveat (robust):** prompting helps but is *insufficient* — Anthropic's own course-correction eval
  shows the gap is unsolved. Prefer mechanisms over reminders.

## 2. Unverified completion — claim done without proof (Reward Hacking)
**Recognized, named, empirical.**
- METR: o3 / o1 / Claude 3.7 increasingly (often successfully) modify tests or scoring code to fake a
  pass. [metr.org](https://metr.org/blog/2025-06-05-recent-reward-hacking)
- UTBoost found 345 SWE-Bench patches wrongly labeled "passed" — "fixed" often isn't.

**Fixes (adopt):**
- **Verify by held-out / hidden evidence the agent couldn't see or game** — never trust self-reported
  "done". Anthropic: hidden-test scoring, classifier detection, intentionally-impossible tasks (a correct
  agent reports impossibility). Opus 4.5 = 0% hidden-test hack rate vs Opus 4.1 14%.
- **Feedback sensors / deterministic quality gates**: wire compiler/linter/tests into the loop to trigger
  self-correction before commit (Thoughtworks Radar 2026, Trial).
- **Proof over vibes**: completion terminates in evidence (real test output, actual merged state).
- Repos: [princeton-nlp/SWE-bench](https://github.com/princeton-nlp/SWE-bench), [SWE-bench Verified](https://openai.com/index/introducing-swe-bench-verified/). Honest gap: no 10k+★ repo bakes "done-needs-proof" into the loop for end users — it's a pattern, not a package.

## Mechanism installed in this foundation (action-gate, not prose)
`~/.claude/hooks/proof-gate.py` — a `PreToolUse` (matcher `Bash`) hook. When a Bash command would
**publish/merge** (`git push`, `gh pr merge`, `git merge`, `npm publish`, `gh release`) but **no test
command ran this session**, it denies once with a reason to run tests first; re-running the same command
proceeds (conscious override for docs/config/WIP). Deterministic, fail-open, **no model**. It judges what
you DID (prior executed commands + the current command), not what you SAID — so no stale-read race.
Disable: remove the `PreToolUse` entry from `~/.claude/settings.json`. Tune: regexes at the top of `proof-gate.py`.

### Lesson: the prose Stop-gate we tried first (and removed)
First attempt was a `Stop` hook (`verify-gate.py`) that keyword-scanned the assistant's last message for
"done/fixed/merged without evidence." It **failed in production**: (1) it read a *stale* transcript
(judged the previous turn, off-by-one), and (2) keywords can't tell *doing* a task from *talking about*
it, so it false-fired on normal discussion. Unit tests of the logic passed but didn't catch the live race.
**Takeaway: gate on actions, not prose.** (`verify-gate.py` is kept on disk, unwired, as a record.)

## Open questions (from the research)
- Prompt-only anti-sycophancy effect size on technical pushback: unmeasured.
- Latest-gen models still reward-hack (GPT-5 ~76% on impossible-SWEbench) — far from solved.

Sources: full cited report in the deep-research run; see raw/sources.md. Relates to [[anti-drift]],
[[thinkers/simon-willison]] (structural security), [[thinkers/addy-osmani]] (proof over vibes), [[defining-an-eval]].
