# When to use what — the decision guide

One line: match the **shape of the work** to the right tool. This is the most-used page; the
global `CLAUDE.md` points here whenever the question is "how should I approach this?".

## The map

| The work looks like… | Use | Needs a score? | Produces |
|---|---|---|---|
| A one-off question/task | Just ask Claude | ❌ | an answer |
| A task you repeat with stable steps | a **Skill** (`~/.claude/skills/`) | ❌ | a reusable command |
| A repeated task where you want the instruction itself maximally good *and can measure quality* | **prompt-opt loop** (run once) → bake the winning prompt into a Skill | ✅ a testset | a tuned prompt |
| Gathering & understanding info from the world | **Deep Research** → ingest into the Wiki | ❌ | knowledge pages |
| Autonomously iterating an artifact against a metric, many rounds | **AutoResearch ratchet loop** | ✅ a metric | an optimized artifact |

## The key mental model (resolves the "prompt vs workflow" paradox)
- **prompt-opt is the *factory* (one-time):** it produces a high-quality prompt.
- **a Skill is the *product* (daily use):** it *contains* that prompt.
- So a daily task becomes a **Skill**, and you optionally **prompt-opt** the prompt inside it **once**.
- You only bother optimizing when (a) it repeats enough that quality compounds **and** (b) you can
  define "better" as a number (a held-out testset). If you can't measure better → just write it
  well and save as a Skill.

## Deep Research vs AutoResearch (commonly confused)
- **Deep Research** = read the world (web/repos), understand, output a report or Wiki pages.
  Read-heavy, no score. → "learn how Karpathy thinks" lives here.
- **AutoResearch loop** = improve an artifact against a score, autonomously, many iterations.
  Optimize-heavy, needs a score. → "make this prompt maximally accurate" lives here.
- Complementary: Deep Research **fills** the Wiki (memory); the loop **optimizes** artifacts (search).

For structuring a whole product pipeline (which phases = workflow vs agent vs skill), see [[product-generation-pipeline]].

See also: [[ratchet-loop-implementation]], [[defining-an-eval]], [[karpathy-llm-wiki]], [[karpathy-autoresearch]].
