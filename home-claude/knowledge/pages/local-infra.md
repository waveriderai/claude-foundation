# Local infra (the user's hardware)

One line: what compute the user has, so we route work to the right place (don't use a supercomputer
for a per-turn check; do use it for heavy judging/eval/vision).

## DGX Spark ×2
- 2× NVIDIA DGX Spark (GB10 Grace Blackwell, 128GB unified memory each, CUDA arm64, ConnectX-7 link).
- Reachable from the laptop over **Tailscale**.
- Currently runs a **~200B Qwen MoE model with built-in vision**, served locally.
- Some of the user's projects will use it; they'll loop us in when ready.

## When to use it (routing guide)
- ✅ **Heavy judging / eval**: the LLM-judge inside the `optimize-prompt` loop, a code-review judge,
  the `daily-learn` "brain", or anything needing a strong/vision model — call it over Tailscale. Free,
  private, powerful.
- ✅ **Real autoresearch training / batch** work (the original Karpathy loop).
- ❌ **NOT** per-turn hooks (e.g. a verification gate): overkill + depends on the Spark being on/reachable
  every turn + network latency. Per-turn checks want a tiny local-laptop model or pure deterministic logic.

## Laptop
- macOS (Apple Silicon). Runs Claude Code + the foundation. Hooks/skills run here and must work offline,
  so per-turn mechanisms stay deterministic or use a tiny local model — not the Spark.

Sources: user, 2026-06-25. Relates to [[agent-memory-infra]], [[honest-ai-and-verification]].
