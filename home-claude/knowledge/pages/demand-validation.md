# Demand validation & shipping an MVP (solo-operator playbook)

One line: the evidence-backed sequence to test demand BEFORE building and ship a thin MVP — from
primary sources (Paul Graham, Eric Ries, The Mom Test, YC). Deep research 2026-06-25. Pairs with
[[product-generation-pipeline]].

## The sequence: idea → demand test → MVP → first users
1. **Start from a real problem** you personally have / are uniquely qualified for — NOT an abstract
   brainstorm. The #1 fatal mistake is "made-up / sitcom" ideas that solve problems no one has →
   "sum across the population, zero users" (PG). CB Insights: ~42% of failures = no market need.
2. **Validate demand BEFORE building** — "Should this be built?" not "Can it?" (Eric Ries):
   - **The Mom Test** (Rob Fitzpatrick): talk about THEIR life, not your idea; ask about specifics in
     the PAST, not opinions about the future; listen > talk. (A problem/bias-removal method, **not** a
     purchase-intent test.)
   - **Fake-door / smoke test**: a button/link/ad for a product that doesn't exist yet; count clicks =
     a *behavioral* signal. Validates demand for the **concept**, not that you can deliver it.
   - **Commitment ladder**: view < click < email < pre-order/deposit. A click **overstates** demand —
     escalate to a higher-commitment signal (email → deposit) before building.
   - **Gold-standard signal**: some users **desperately** need even a crappy v1 from an unknown
     2-person startup. "People who could see themselves using it one day" = no real demand.
   - **Ignore vanity metrics** (press, downloads, signups, followers, raw waitlist size = activity, not
     traction). Heuristic: does the number keep growing when you **stop** pushing? Measure *validated learning*.
3. **Build the thinnest MVP** — only a "quantum of utility"; perfectionism = procrastination; your
   initial model of users is always wrong (PG). OR a **concierge / Wizard-of-Oz MVP**: manually do by
   hand what you'll automate later (Zappos, Airbnb, Stripe).
4. **First ~100 users = recruit MANUALLY**, by hand. You can't wait for users to come — go get them;
   do things that don't scale (PG / YC).

## MVP / landing tools (only open-source verified this pass)
- **gpt-engineer** 55.2k★ — CLI codegen; the precursor to Lovable. ⚠️ no longer maintained (author pivoted to Lovable).
- **bolt.diy** 19.5k★ — official OSS fork of Bolt.new; prompt→run→edit→deploy full-stack apps with **any of 19+ LLM
  providers per prompt** (vs Bolt.new locked to its built-in model). ⚠️ WebContainers needs a commercial license for for-profit prod.
- Hosted (v0/Vercel, Bolt.new, Lovable, Replit Agent) + no-code (Framer/Carrd/Webflow) — **NOT** independently verified here.

## Maps to your architecture
The sequence is a deterministic **workflow** (problem → validate → MVP → recruit); the **build** step is a
bounded **agent** (use a tool above); repeatable bits = **skills** (a future `validate-idea` skill;
`deep-research` for trend research). Interviews + manual recruitment = human-in-the-loop. See
[[product-generation-pipeline]], [[when-to-use-what]].

## Honest gaps (still unverified) & refuted
- Unverified: AI marketing/growth tools & launch workflows (Product Hunt/Reddit/X/SEO/cold-email — only the
  manual-recruitment *principle* survived); AI demand-research tooling (search-volume/forum-mining/competitor); hosted MVP-tool head-to-head.
- Don't repeat (refuted 0-3): build-MVP-then-recruit as the canonical *first* step (problem-validation comes
  FIRST); Mom Test as a buy-intent test; "investors weight traction above all."

Sources: paulgraham.com (startupideas, ds), theleanstartup.com, momtestbook.com, ycombinator.com/library,
Kromatic, startups.com; gpt-engineer & bolt.diy GitHub. Full cited report in the 2026-06-25 deep-research run.
