# Security gate — structural, not prompted (VibeSec)

One line: for sensitive surfaces (auth, payments, secrets, PII), enforce security with **deterministic
gates**, not by telling the agent "be secure" in a prompt — inferential reminders are unreliable.

## Why
AI-generated ("vibe coded") code ships fast but can quietly introduce security holes. Models can't
reliably tell privileged instructions from injected input ([[thinkers/simon-willison]]: destyling
dropped attack success 61%→10% — the *structure* matters, not the wording). So the control must be
**computational** (a gate that runs), not **inferential** (a hope that the model behaves). See
[[thinkers/birgitta-bockeler]] (guides vs sensors) and Martin Fowler's "VibeSec".

## What a gate looks like (pick per project)
- Run `/security-review` before merge (a required step, not a suggestion).
- A `PreToolUse` hook that blocks edits to auth/secrets paths without explicit confirmation.
- A secret-scanner / dependency-audit in CI that must pass.
- A short checklist in the project's `.claude/CLAUDE.md` that the agent must complete.

## When to add one
Any project touching: authentication/authorization, payments/billing, secrets/keys, PII, or anything
externally exposed. The `new-project` skill prompts for this; the `north-star.md` template has a line.

Sources: Fowler (VibeSec), Böckeler (harness engineering), Simon Willison (structural security); raw/sources.md.
