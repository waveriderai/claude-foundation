# Skill discoverability — avoiding command sprawl (you never memorize commands)

One line: skills auto-fire from their **description** when you talk naturally, so growth should
happen in *data and descriptions*, not in new commands you have to remember.

## How it actually works (progressive disclosure)
- At startup the agent loads only each skill's **name + description** (cheap). When your message
  matches a description, it pulls the full skill body in. So you can install many skills with little
  context cost. ([Anthropic Agent Skills](https://www.anthropic.com/engineering); [progressive disclosure](https://ardalis.com/optimizing-ai-agents-with-progressive-disclosure/))
- **The description is the router**, not a manual. If you can't trigger a skill by talking
  naturally, the fix is a better description (keywords you'd actually say), not a command to memorize.
- You can type `/skill-name` explicitly, but you rarely need to — say what you want.

## The real sprawl risk (and the rule)
- With *too many* skills, descriptions get truncated to fit a budget → keywords stripped → matching
  fails (least-used skills dropped first). ([Claude Code skills guide](https://vanja.io/claude-code-skills-guide/))
- Rule: **"A skill is a tool, not an operating system."** Few, focused, *general* skills beat many
  narrow ones. Prefer one skill that operates over **data** to ten near-duplicate skills.

## Applied to this foundation (answers "do I have to name people / memorize commands?")
- **No.** People are **data** in a pool (`sources/tracked.md`), not commands. You say "learn from the
  thinkers" → `learn-from-thinkers` loops the whole pool. Adding a person = adding a row, not a command.
- Same for knowledge: "ingest this" / "study this repo" → `ingest-source` fires. You build on the few
  verbs you already know (learn / ingest / optimize / new-project); the system grows underneath them.
- Side-effecting skills (deploy, send) should set `disable-model-invocation: true` so they only run
  when you explicitly ask.

## Deep vs Auto research (you asked)
Studying this pain point = **Deep Research** (understand the world, no score), not AutoResearch.

## Practitioner reinforcement
- [[thinkers/matt-pocock]]: the **two-loads taxonomy** — model-invoked skills cost context *every turn*,
  user-invoked cost *memory*; default to user-invoked unless auto-firing earns its keep. Keep SKILL.md
  ≤ ~100 lines; demote rules to reference files (progressive disclosure as a 3-tier hierarchy).
- [[thinkers/addy-osmani]]: encode skills as **checkpointed workflows** ending in proof, plus
  **anti-rationalization tables**; fit the whole skill set inside a small token budget.

Sources: see raw/sources.md; relates to [[when-to-use-what]], [[thinkers/anthropic-engineering]].
