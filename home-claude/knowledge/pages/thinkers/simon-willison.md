# How Simon Willison thinks

One line: practice-first, grounded daily use of coding agents — document the concrete patterns
that actually work, stay skeptical, keep the human in the loop.

## Core mental models
- **Agentic engineering patterns**: building software *with* coding agents (Claude Code, Codex) is
  a craft with reusable patterns worth cataloguing from real daily use, not hype. ([Agentic Engineering Patterns](https://simonw.substack.com/p/agentic-engineering-patterns))
- **Show your work**: write down what you actually did, with examples and caveats — the value is in
  the grounded specifics, not grand claims.
- **Human-in-the-loop by default**: agents are powerful but need review at the right checkpoints;
  trust is earned per task, not assumed.
- **Tools you can inspect**: prefer transparent, scriptable, file-based workflows you can read and version.

## Concrete agentic-engineering patterns (from "Agentic Engineering Patterns")
His framing: *professional* engineers using coding agents to amplify existing expertise — distinct
from casual "vibe coding". Agents excel at "assembling known techniques" but struggle with the
open-ended generalization production systems need, so human design/stewardship matters more, not less.
- **Writing code is cheap now** — generation cost ≈ 0; rethink what to build and how to prioritize,
  since the bottleneck moves from typing to design/judgement.
- **Red/green TDD** — test-first makes agents write more succinct, reliable code with less prompting.
- **First run the tests** — automated tests are the verification layer; always confirm AI code actually executes.
- **Linear walkthroughs** — ask the model for a structured, linear explanation of a whole codebase to understand it.
- **Hoard things you know how to do** — keep a personal store of techniques/approaches so you can
  steer agents precisely (they assemble known techniques well when you name them).

## Recent (2026)
- **Prompt injection as role confusion** (2026-06-22): refines his long-standing lethal-trifecta thinking
  with a concrete mechanism — models can't reliably distinguish privileged system text from user input,
  and the *formatting/styling* matters independent of content. Cited result: "destyling causes average
  attack success to plunge from 61% to 10%." Mitigation lever is structural (how input is framed), not
  just instructional. ([simonwillison.net](https://simonwillison.net/2026/Jun/22/)) → connects to
  [[thinkers/martin-fowler]]/VibeSec (security must be structural, not prompted).

## How to apply
- Lead with tests (red/green) and run them first — let the eval/test be the agent's truth, like a loop's `eval.py`.
- Keep a running store of techniques + a log of what worked/failed (the lab journal and knowledge `log.md`).
- Default to plan → review → execute; spend your effort on design/stewardship, not typing.
- When unsure if a workflow generalizes, say so and test it — don't overclaim.

Sources: [Agentic Engineering Patterns](https://simonw.substack.com/p/agentic-engineering-patterns); see raw/sources.md. Relates to [[anti-drift]], [[when-to-use-what]], [[defining-an-eval]].
