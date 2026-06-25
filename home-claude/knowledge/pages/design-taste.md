# Design Taste — escaping the generic "AI vibe-coded" look

The problem: everyone building with AI ships the same thing — the same shadcn/Tailwind SaaS
template, the same indigo→purple gradient, the same centered hero, the same emoji bullets. Backed by
a `deep-research` pass (2026-06-25; 22 verified claims; primary sources: Anthropic frontend-design
SKILL.md + Claude cookbook, interviews with Rauno Freiberg & Emil Kowalski, a 3.2M-post Reddit tell
analysis + a 1,590-page Show HN audit).

**The key insight — taste is a process, not a look.** Hard-coding one aesthetic just creates the
*next* tell (the cream+serif+terracotta "look" became a tell precisely because it went from choice
to default). What makes work stand out is the discipline:

> **Ground in the subject → forbid the AI's default convergence → one bold move + restraint everywhere else.**

House default (when a brief specifies no style): **precision-minimal** — the Linear/Vercel/Rauno
register (lean, exact spacing, characterful-but-restrained type). But always subject-ground first.

## (a) Anti-patterns to forbid — the "made by AI" tells
Empirically the #1 + #2 tells are **default shadcn/Tailwind** and the **"AI purple"/indigo gradient**.
Root cause: Tailwind UI defaulted buttons to `bg-indigo-500` ~5 yrs ago → flooded training data →
models think "purple buttons are what buttons look like" (Tailwind's creator Adam Wathan publicly
apologized, Aug 2025). Forbid list:
- **Color tokens**: `bg-indigo-500/600` (`hover:bg-indigo-700`), `slate-900`, `from-indigo-500 to-purple-600` hero gradients; purple gradient on white.
- **Fonts**: Inter / Roboto / Arial / system-ui — *and over-chosen Space Grotesk* (the model's "non-default" default).
- **Layout**: centered hero + three identical rounded icon-cards; gradient hero text; the stacked sequence Hero→features grid→social proof→pricing→FAQ→footer.
- **Detail**: `border-radius: 0.5rem` on everything; emoji used as icons; unprompted neon glow; scattered micro-animations.
- **Anthropic's three default "looks"** (surface regardless of brief — use only if the brief demands): cream `#F4F1EA`+serif+terracotta · near-black + single acid-green/vermilion · broadsheet hairline-rules + zero-radius.
- Note: bento grids / glassmorphism / aurora-mesh gradients rank *lower* as tells (partly Twitter-meme artifacts) — not top priority to ban.

## (b) Design thinkers tracked (and why their work isn't AI-looking)
- **[[thinkers/rauno-freiberg]]** (Vercel) — "quality = patience + focus"; "a solution with less"; master HTML/CSS/JS; details emerge from real implementation, not static vectors.
- **[[thinkers/emil-kowalski]]** — taste is a *trainable* instinct (expose→absorb→apply); animate only with purpose, "sometimes the best animation is no animation"; don't animate frequent/keyboard actions.
- (Candidates to round out later: Josh Comeau, Brian Lovin, Jordan Singer — not yet verified.)

## (c) Principles cheat-sheet (2025–2026, intentional vs. stale)
- **Typography as personality** — pair display+body deliberately, *not the families you'd reach for on any other project*; characterful display used with restraint + complementary body + utility face. Type treatment is memorable, not a neutral delivery vehicle.
- **Structure is information** — numbering/eyebrows/dividers must encode something true, not decorate.
- **Color** — replace default tokens with a subject-grounded palette specified by **hex** (4–6 named values).
- **Motion** — concentrate on *one* orchestrated page-load (staggered `animation-delay`) over scattered micro-interactions; extra animation reads as AI-generated; don't animate frequent actions.
- **Restraint / one bold move** — spend boldness in one signature place, keep everything else quiet; cut decoration that doesn't serve. ("Remove one accessory.")
- **Craft in the real medium** — build details in code/high-fidelity, not static mockups.
- **Stale tells** — Windows-era / Bootstrap / default-Material; default rounded-gray-card SaaS with a blue primary button.

## (d) Reusable prompt patterns
1. **Two-pass workflow** — FIRST output a compact token plan (color/type/layout/signature) from the brief; THEN review it against the brief, revise anything that "reads like the generic default you'd produce for any similar page," say what changed & why; only THEN write code. If brief underspecified: "name one concrete subject, its audience, and the page's single job."
2. **Forbid the model's convergence (paste verbatim)** — "You tend to converge toward generic, on-distribution outputs — avoid this. You still converge on common choices (e.g. Space Grotesk) — think outside the box." + the (a) forbid-list.
3. **Be specific** — palette by hex; name a reference/design language ("style like stripe.com / Vercel"); pick the exact font ("use DM Sans, not Inter"); describe the layout instead of letting the model choose.
4. **Ground in subject** — build with the brief's real content/materials/vernacular.
5. **One bold move + restraint elsewhere.**

## Caveats (from the research)
- Tells are **time-sensitive**: today's escape look becomes tomorrow's default — re-mine discourse periodically (that's what [[learn-from-thinkers]] is for here).
- Tell-ranking is from Reddit *complaint* frequency (discourse signal), not blind visual detection.
- Cross-medium (images/posts/brand) is **under-evidenced** by web-UI sources — the skill applies the same process by analogy; treat as a hypothesis to refine.
- Refuted in verification (don't lean on): "taste is THE differentiator"; "distinctiveness comes purely from detail not systems"; "AI just reproduces the median."

## How this plugs in
- The `design-taste` skill (`~/.claude/skills/design-taste/`) operationalizes this page.
- Built on the official `frontend-design` plugin skill (the web-UI craft engine).
- [[learn-from-thinkers]] tracks Freiberg + Kowalski → keeps the tells current.
- Used by the product/prototype flow so taste is a default gate. See [[product-generation-pipeline]], [[demand-validation]], [[when-to-use-what]].
