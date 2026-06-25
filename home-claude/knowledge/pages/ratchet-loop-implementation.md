# Ratchet loop — implementation

One line: the 5 concrete components that turn [[karpathy-autoresearch]] into a runnable loop on
any task with an objective score.

## Five components (autoresearch → this project)
| Component | autoresearch | here |
|---|---|---|
| Target file (edited) | `train.py` | `candidate.md` (the prompt / copy / query) |
| Eval (scores) | measure `val_bpb` | `eval.py` → one number |
| Protocol | `program.md` | `program.md` (loop rules) |
| Ratchet state | keep if lower | `best.txt` + git commit; revert if worse |
| Brain | Claude/Codex | Claude Code |

## Pseudocode
```
best = eval(candidate)
loop:
  agent: query Wiki — "tried this before? result?"   # M3 memory step
  agent: edit candidate.md from a hypothesis
  score = python eval.py
  if score > best: keep; best = score; git commit
  else:            discard (revert)
  agent: append hypothesis + diff + score + keep/discard to Wiki log + experiments/
  every few rounds: lint Wiki into insight pages
```

## Notes
- No runner needed: point the agent at `program.md` and it self-drives. For overnight autonomy,
  wrap a thin shell/python loop that re-invokes the agent.
- The hard part is the eval — see [[defining-an-eval]].

Sources: [[karpathy-autoresearch]]; project plan file.
