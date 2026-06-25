# How Martin Fowler thinks (AI-assisted dev)

One line: LLMs are a fundamentally *non-deterministic* engineering material that augments (not
replaces) skilled developers — design, refactoring, and testing discipline still hold; what changes
is the integration method and the need to make safety/quality **structural**, not prompted.

## Core mental models (Fowler himself)
- **Non-determinism is the real shift.** LLMs drag software from deterministic machines toward
  traditional engineering, which "builds in tolerance for factors it can't measure." Practice must
  *absorb* variance, not eliminate it.
- **Hallucination is the feature, not the bug** (crediting Rebecca Parsons). Practical move: ask the
  same question several times with variations and compare; for numeric answers run it 3+ times — *the
  spread is data.*
- **Workflow dwarfs raw capability.** Most usage is "fancy auto-complete"; real value comes from setups
  where the LLM "directly reads and edits source files." Productivity surveys mislead because they
  ignore *how* people use it. → echoes [[thinkers/simon-willison]] (grounded practice over hype).
- **What stays constant.** He pointedly does *not* claim good engineering changes — refactoring, testing,
  design principles persist; only the integration method shifts.
- **Epistemic humility / AI as a bubble.** "I haven't the foggiest" about programming's future; AI is
  real value with unknown timing, like railroads/internet — distrust anyone claiming certainty.

## On VibeSec / security (guest authors he curates, NOT Fowler himself)
- **"Telling an AI to be safe ≠ enforcing that it is safe."** Prompts get overridden/reinterpreted;
  constraints must be *codified as non-negotiable rules in the pipeline.* Built directly on
  [[thinkers/birgitta-bockeler]]'s harness engineering (**Guides** vs **Sensors**, each
  computational/deterministic or inferential). Real failure: a vibe-coded prototype where the AI
  recommended public buckets and over-broad token permissions.
- **Five friction-reduction patterns** (Rahul Garg, guest): Knowledge Priming, Design-First
  Collaboration, Encoding Team Standards, Context Anchoring, Feedback Flywheel.

## How to apply
- Run important LLM queries multiple times; treat variance across answers as signal.
- Don't rely on prompting for security/quality — put **deterministic gates** (scanners, deploy blocks)
  in the pipeline that structurally reject unsafe code regardless of model compliance. → [[thinkers/addy-osmani]]
  ("never commit code you can't explain").
- Invest in workflow over model-shopping: agent-with-file-access + encoded team standards beats autocomplete.

Attribution: non-determinism / hallucination / "I haven't the foggiest" are directly Fowler. VibeSec
and the friction patterns are *guest authors on his platform*; harness engineering originates with Böckeler.

Sources: [Some thoughts on LLMs and Software Development](https://martinfowler.com/articles/202508-ai-thoughts.html) (Fowler);
[The VibeSec Reckoning](https://martinfowler.com/articles/vibesec-reckoning.html) (guests);
[Patterns for Reducing Friction in AI-Assisted Development](https://martinfowler.com/articles/reduce-friction-ai/) (Garg). Relates to [[anti-drift]], [[when-to-use-what]].
