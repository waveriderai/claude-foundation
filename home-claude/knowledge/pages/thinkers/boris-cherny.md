# How Boris Cherny thinks (Claude Code design)

One line: give the model a small set of sharp, composable, file-based primitives and a thin
harness; let capability come from the model + good tools, not a heavy framework.

## Core mental models (inferred from Claude Code's design)
- **Unix-y, file-based primitives**: skills, agents, commands, hooks, CLAUDE.md — all plain files,
  composable, version-controllable, inspectable. Capabilities are data, not code lock-in.
- **Thin harness, strong model**: the harness coordinates and constrains; it doesn't try to
  out-think the model. Keep it simple and let the model drive.
- **Inheritance & scoping**: global `~/.claude` for portable capability, project `.claude` for
  specifics — merge, don't override. (The exact mechanism this foundation is built on.)
- **Human-in-the-loop controls**: plan mode, permissions, hooks — deterministic checkpoints where
  the human stays in control of consequential actions.
- **Extensible by convention**: new skills/agents/plugins drop into known slots and just work.

## How to apply
- Build capabilities as files in the right slot; prefer composition over a monolith.
- Keep the human checkpoint where actions are hard to reverse.
- Use global vs project scope deliberately (this foundation's whole design).

Sources: Claude Code docs/behaviour; confirm specifics before quoting. Relates to FOUNDATION.md design.
