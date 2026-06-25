# North Star — <project name>

The single source of truth for what this project is for. The SessionStart hook loads this into
every session so the agent stays anchored. Keep it short and current.

## Goal (one sentence)
<what success looks like>

## Why / outcome
<the problem this solves; who it's for>

## Constraints
- <hard limits: tech, time, what must not change>

## Non-goals (explicitly out of scope)
- <things we are NOT doing — prevents scope creep / drift>

## Definition of done
- <observable criteria that mean we're finished>

## Security gate (if this project touches auth / payments / secrets / PII)
- <name the structural gate: e.g. run /security-review before merge; a scanner in CI; a PreToolUse
  hook on secrets paths. Structural, not "be careful" in a prompt. See knowledge/pages/security-gate.md.
  Delete this section if not applicable.>

## Open backlog (don't drop these)
- <planned items to revisit; the re-anchor checkpoint will resurface these>
