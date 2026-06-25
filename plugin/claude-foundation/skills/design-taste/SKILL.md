---
name: design-taste
description: Apply distinctive, non-generic design taste to any UI, prototype, pipeline output, or brand artifact so it does NOT read as templated "AI vibe-coded" work. Use whenever building or restyling something visual — web/app UI, a landing page or MVP/prototype, auto-generated assets (images/posts), or brand identity — to make it intentional, lean, modern, and unmistakably not-default. Builds on the official frontend-design skill.
---

# design-taste

Make anything you design look like a person with taste made it — not an AI default. Goal (user's
words): **lean, simple, clear, easy to use, fresh — one bold move, restraint everywhere else; never
the generic AI vibe-code style.** Applies across four mediums: **web/app UI · prototype/MVP ·
pipeline output · brand/identity.** Backed by [[design-taste]] (knowledge).

## The core principle — taste is a PROCESS, not a look
Don't reach for a fixed aesthetic — hard-coding one look just becomes the next AI tell. Run the
discipline instead:

> **Ground in the subject → forbid the AI's default convergence → one bold move + restraint elsewhere.**

**House default** when no style is briefed: **precision-minimal** (Linear/Vercel/Rauno register —
lean, exact spacing, characterful-but-restrained type). But subject-ground *first*, always.

## Relationship to `frontend-design`
The official `frontend-design` skill is the deep craft engine for **web UI** (hero-as-thesis, token
system, two-pass critique, CSS specificity). For UI work, invoke BOTH: that skill does the craft,
this one adds the forbid-list, the tracked thinkers, the cross-medium application, and the prompt
patterns. For non-UI mediums, this skill leads.

## Step 1 — Ground it in the subject (always)
Name in one line: the concrete subject, its audience, and the single job of this artifact.
Distinctive choices come from the subject's own world (materials, vernacular, artifacts) — not a
template. If the brief is vague, pin it yourself and state the choice.

## Step 2 — Run the forbid-list (the AI tells — do NOT ship)
- **Colors**: `bg-indigo-500/600`, `slate-900`, `from-indigo-500 to-purple-600`, purple-gradient-on-white. → use a subject-grounded palette in **hex**.
- **Fonts**: Inter / Roboto / Arial / system-ui — *and over-chosen Space Grotesk*. → pick a deliberate display+body pairing.
- **Layout**: centered hero + 3 identical rounded icon-cards; gradient hero text; the Hero→features→social-proof→pricing→FAQ→footer stack.
- **Detail**: everything `border-radius:0.5rem`; emoji as icons; unprompted neon glow; scattered micro-animations.
- The three Anthropic default looks (cream+serif+terracotta / near-black+acid-accent / broadsheet-hairline) — only if the brief demands.

## Step 3 — Make the choices (cheat-sheet)
Typography as personality (deliberate pairing, not your usual) · structure encodes meaning · color from subject (hex) · motion concentrated in ONE orchestrated moment, not sprinkled · **spend boldness once, cut one accessory** · build details in real code, not static mockups.

## Step 4 — Per-medium application
- **Web/app UI** → defer to `frontend-design` two-pass process + this forbid-list.
- **Prototype/MVP** → fast, but still ONE signature move; precision-minimal default; ties into [[demand-validation]] fake-door pages (a landing page that doesn't look AI converts better).
- **Pipeline output** (images/posts/assets) → lock a token system ONCE (palette+type+voice) and make the pipeline reuse it every run — *sameness at scale is the loudest AI tell, so the consistency must be a chosen system, not the model's default.*
- **Brand/identity** → palette + type + voice locked once, reused everywhere; check each artifact against it.

## Step 5 — Prompt patterns (bake into any generation)
1. **Two-pass**: output a token plan (color/type/layout/signature) → review vs. brief, revise anything that "reads like the generic default," say what changed → only then build.
2. **Forbid convergence (paste)**: *"You tend to converge toward generic, on-distribution outputs — avoid this. You still converge on common choices (e.g. Space Grotesk) — think outside the box,"* + the Step 2 list.
3. **Be specific**: hex palette · named reference ("style like Vercel") · exact font ("DM Sans, not Inter") · described layout.

## Step 6 — Self-critique (end in proof)
Ask: **"If I ran a generic prompt, would I land here?"** If yes, it's a default — revise and say what
changed & why. Screenshot if possible (a picture is worth 1000 tokens). Remove one accessory.

## Anti-rationalization
| excuse | reality |
|---|---|
| "it looks clean / fine" | "clean" is often just the AI default — run the forbid-list |
| "it's only a prototype" | prototypes set the taste bar; one signature move is cheap |
| "the pipeline output doesn't need taste" | sameness at scale is the most obvious AI tell |
| "minimal = safe, skip the bold move" | not taking a risk is itself a risk — spend boldness once |

## Maps to
[[design-taste]] · `frontend-design` (craft engine) · [[thinkers/rauno-freiberg]] · [[thinkers/emil-kowalski]] · [[product-generation-pipeline]] · [[demand-validation]]. Kept current via [[learn-from-thinkers]].
