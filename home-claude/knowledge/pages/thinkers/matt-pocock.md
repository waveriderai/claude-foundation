# How Matt Pocock thinks (skill design)

One line: skills exist to "wrangle determinism out of a stochastic system" — favour small,
composable, portable Markdown skills over heavyweight frameworks, with ruthless attention to what
occupies the context window.

## Core mental models
- **The "dumb zone."** LLM quality degrades sharply past ~100K tokens (~40% of window): "dumber
  decisions, worse code, worse instruction-following." A bigger context window is "more dumb zone" —
  good for retrieval, bad for *writing* code. → short focused sessions with clean context resets,
  not endlessly compacted threads. (His own framing, from 1M-window experiments.)
- **Predictability is the root virtue of a skill.** The win is the agent taking the *same process*
  every run (not the same output). Skills convert vague judgment into a checklist the agent follows
  "without thinking" (e.g. `/tdd` = red-green-refactor; `/diagnose` = reproduce → minimize →
  hypothesize → instrument → fix → regression-test). → echoes [[thinkers/simon-willison]]'s TDD patterns.
- **The description is the activation rule (auto-firing).** Skills don't fire on a magic word — the
  agent reads the YAML `description` every turn and decides. Descriptions should be long, specific,
  with a trailing "Use when user says…". Rules: "front-load the skill's leading word"; "one trigger
  per branch — synonyms are duplication." → confirms [[skill-discoverability]].
- **Two loads, two invocation modes (the skill-sprawl answer).** Every *model-invoked* skill's
  description sits in context **every turn** (context load); every *user-invoked* skill must be
  *remembered* (cognitive load). "If it only ever fires by hand, make it user-invoked and pay no
  context load." Plus a proposed third **skill-invocable** tier (callable only by other skills, no
  standing description) so composite skills like `/review` call helpers without burning context.
- **Progressive disclosure as a 3-tier hierarchy.** In-skill steps → in-skill reference → external
  reference files. Enforces a ~100-line SKILL.md limit; reports ~63% token reduction. → [[skill-discoverability]].
- **Leading words & ubiquitous language (DDD for prompts).** A "leading word" is "a compact concept
  already living in the model's pretraining" (*tight, red, lesson*) — anchors invocation AND
  execution while cutting tokens. Push shared vocab into a `CONTEXT.md`.

## How to apply
- **Default skills to user-invoked** unless they genuinely need to auto-fire — directly attacks skill sprawl.
- **Keep SKILL.md ≤ ~100 lines**; demote rules/definitions to linked reference files pulled on demand.
- **Use fresh context for review** — never let a reviewer inherit the implementer's bloated session.

Attribution: the "Ralph Wiggum" loop is Geoff Huntley's; Pocock adopts/teaches it. The dumb zone,
predictability framing, leading words, two-loads taxonomy, and skill-invocable proposal are his.

Sources: [mattpocock/skills (GitHub)](https://github.com/mattpocock/skills) (see `writing-great-skills/`);
[@mattpocockuk on the "dumb zone"](https://x.com/mattpocockuk/status/2034572011175907474);
[AI Hero](https://www.aihero.dev/posts). Relates to [[thinkers/addy-osmani]], [[thinkers/lance-martin]], [[when-to-use-what]].
