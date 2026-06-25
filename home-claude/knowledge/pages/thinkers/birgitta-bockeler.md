# How Birgitta Böckeler thinks (harness engineering)

One line: agentic coding is a control-systems problem — don't try to fix the unreliable model,
engineer the **harness** around it so the agent self-corrects before its work reaches a human; the
engineer's job shifts from writing code to *building and steering that harness*.

## Core mental models
- **Agent = Model + Harness.** The harness is "everything supporting the agent's decision-making."
  Split into the *builder harness* (baked into the tool: system prompts, retrieval) and the *user
  harness* (what your team builds around your codebase). Leverage lives in the user harness.
- **Guides (feedforward) vs Sensors (feedback)** — her signature distinction. *Guides* steer before
  generation (AGENTS.md, conventions, architectural constraints); *Sensors* observe after generation
  and feed errors back (linters, type checkers, tests, LLM judges). You need **both**: feedback-only
  agents repeat mistakes; feedforward-only agents encode rules but never learn if they worked. Good
  sensor output is LLM-consumable — "a positive kind of prompt injection."
- **Computational vs Inferential axis.** Both guides and sensors are either *computational*
  (deterministic, fast, reliable — linters, tests) or *inferential* (semantic, slow, non-deterministic
  — AI review, LLM-as-judge). Prefer computational for assurance; reserve inferential for semantic judgment.
- **Harnessability as a design criterion.** Not all codebases admit a good harness — strong typing,
  clear module boundaries, opinionated frameworks afford controls; legacy/debt resists them. Her
  paradox: *"the harness is most needed where it is hardest to build."* Predicts teams will pick
  stacks by available "harness templates."
- **The steering loop = the new human role.** Humans operate "a higher-abstraction steering loop":
  when an issue recurs, improve the guides/sensors so it can't recur, rather than re-reviewing diffs.
  A good harness "should not aim to fully eliminate human input, but to direct it to where our input
  is most important." → [[anti-drift]].

## How to apply
- Pair every recurring failure mode with **both** a guide and a sensor; iterate the harness, not just the code.
- "Keep quality left": fast deterministic checks pre-commit; expensive inferential sensors (mutation
  testing, AI review) post-integration; drift monitors continuously.
- Make sensor output machine-readable and agent-targeted so the agent self-corrects pre-review.

Attribution: the *term* "harness engineering" / "Agent = Model + Harness" predate her (OpenAI's
write-up; Mitchell Hashimoto). Her original contribution is the **guides/sensors × computational/inferential**
framework and **harnessability**. Amplified on [[thinkers/martin-fowler]]'s site (VibeSec builds on this).

Sources: [Harness engineering for coding agent users (martinfowler.com)](https://martinfowler.com/articles/harness-engineering.html);
[Harness engineering & agent feedback — AI coding sensors (Thoughtworks)](https://www.thoughtworks.com/insights/blog/generative-ai/harness-engineering-agent-feedback-exploring-ai-coding-sensors);
[birgitta.info](https://birgitta.info/). Relates to [[thinkers/anthropic-engineering]], [[skill-discoverability]].
