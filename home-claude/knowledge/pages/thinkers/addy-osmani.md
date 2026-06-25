# How Addy Osmani thinks (AI-assisted engineering)

One line: AI gets you to "done" fast, but reliable software lives in the *invisible work* both agents
and amateurs skip — so the job is encoding senior-engineer discipline (specs, tests, verification,
scope, review) into explicit, enforceable workflows for humans and agents alike.

## Core mental models
- **The 70% Problem.** AI rapidly produces ~70% of a solution; the last 30% — edge cases, security,
  production integration, maintainability — is diminishing returns that still demands real engineering.
  *"Software quality was never primarily limited by coding speed."*
- **The Knowledge Paradox.** AI helps *seniors* more than juniors. Seniors steer "a very eager junior
  developer" (refactor, harden types, question architecture); juniors accept output uncritically. Bug
  fixing without mental models becomes the **"two steps back"** whack-a-mole loop.
- **Invisible work / process over prose.** "A senior engineer's job is mostly the parts that don't
  show up in the diff." Agents skip these because reward points at *task completion, not completeness*.
  Fix: encode work as **checkpointed workflows** — essays get skipped, processes get executed. → echoes
  [[thinkers/anthropic-engineering]] (guardrails must be explicit) and [[thinkers/matt-pocock]] (predictability).
- **Anti-rationalization tables** — his most distinctive move: pre-written rebuttals to the plausible
  lies agents (and people) tell themselves. *"Too simple for a spec"* → acceptance criteria still
  apply; *"write tests later"* → later doesn't exist.
- **Verification is non-negotiable — "proof over vibes."** Every skill terminates in concrete evidence
  (test pass, clean build, runtime trace, sign-off). The bottleneck has shifted from writing to
  *verification/review*; AI made "the burden of proof explicit." → maps to the `verify` skill.
- **Scope discipline + progressive disclosure.** Touch only what's asked (biggest determinant of PR
  mergeability); load only relevant skills (~20 skills in a ~5K-token budget). Lifecycle:
  **DEFINE→PLAN→BUILD→VERIFY→REVIEW→SHIP**, scaled to scope. → [[skill-discoverability]].

## How to apply
- Adopt a **"PR Contract"**: intent (1–2 sentences) + proof (tests/screenshots/logs) + risk tier &
  AI-role disclosure + "please focus here" pointers. Pairs with the `code-review` skill.
- Add **anti-rationalization tables** to your own skills — list shortcuts you keep accepting, reject them.
- Gate security-sensitive code (auth, payments, untrusted input) behind mandatory threat-model + tooling
  review. Rule: **"Never commit code you can't explain."** → connects to [[thinkers/martin-fowler]] (VibeSec).

Attribution: the named concepts are his. Cited statistics (45% security-flaw rate, 2.74× XSS, etc.)
are aggregated from external studies he references — borrowed evidence, not his own measurements.

Sources: [The 70% Problem](https://addyo.substack.com/p/the-70-problem-hard-truths-about);
[Agent Skills](https://addyosmani.com/blog/agent-skills/) + [github.com/addyosmani/agent-skills](https://github.com/addyosmani/agent-skills);
[Code Review in the Age of AI](https://addyo.substack.com/p/code-review-in-the-age-of-ai). Relates to [[thinkers/matt-pocock]], [[when-to-use-what]].
