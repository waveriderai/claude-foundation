# Growth & marketing for a solo operator (post-MVP)

One line: get your first 100→1000 users — channel FOCUS, the credible channel menu, launch mechanics
that can't be gamed, and an honest AI-tooling reality check. Deep research 2026-06-25. Pairs with
[[demand-validation]], [[product-generation-pipeline]].

## The one principle that matters most (HIGH confidence, primary sources)
**Focus on ONE channel; don't spray.** The #1 growth failure is investing in too many channels and none
enough — you generally only need to excel at ONE to succeed. (Rob Walling's Stair Step; First Round; the
Traction book's "Bullseye"; Brian Balfour's "One Problem · One Solution · One Channel.") → test channels
cheaply, then **commit to the single best one**.

## The channel menu — pick ONE (consumer-scoped)
Lenny Rachitsky's 7 ways consumer apps got their first ~1000 users: (1) where users gather **offline**,
(2) **online**, (3) invite your **network**, (4) **FOMO**/exclusivity/waitlist, (5) **influencers**,
(6) **press**, (7) **pre-launch community**. First Round's 3 *scalable* consumer lanes: **paid · virality · content**.
- ⚠️ **B2B caveat (important)**: that menu under-weights **founder-led cold outreach / sales** — legitimate and
  often superior for solo B2B (founder-led ~8–15% reply rates; beats SDR-led by 30–50%). Don't dismiss it.
- **Durability**: owned/earned (virality, word-of-mouth, UGC) > paid for a bootstrapper (paid = renting
  someone else's audience). But virality can't be forced — it's partly luck.
- **SEO/content** is the most *reliable* "one channel": topics are found systematically via keyword research
  (vs unpredictable virality). On a fresh domain, target low-difficulty long-tail (KD<30) + patience (~3–6mo).

## Launch mechanics — robust, and they CAN'T be gamed
- **HN "Show HN"**: must be something runnable/holdable (NOT a blog/signup/newsletter); title must begin
  "Show HN"; **soliciting upvotes is banned + voting-ring-detected**.
- **Product Hunt**: build buzz ~30 days ahead; supporters need **pre-existing** accounts — launch-day
  new-account votes get **removed**. Rewards a genuine pre-built audience, not fresh-account upvoting.
- **The real metric**: business KPIs (signups, conversions). **Ranking/upvotes are vanity** (PH ~3%
  conversion). B2B 50–300 signups = success; B2C 500–1500; PH favors B2C self-serve products.

## AI marketing tools — the honest reality check (you asked for hype-skepticism)
- ✅ **Debunk (HIGH)**: Google does **NOT** penalize content for being AI-generated. Its spam policy targets
  **scaled low-value content** ("scaled content abuse") — "it doesn't matter how the content is created." So
  AI content is fine **only if** it's genuinely helpful/quality and **not bulk-published**.
- ⚠️ **Hype flag (the key finding)**: **almost no AI marketing TOOL survived verification** — no AI
  content/ad-copy/cold-email generator showed credible effect-size evidence. Treat their efficacy as
  **unproven until tested against your own metric** (use the `optimize-prompt` loop on the copy).
- ✅ **What survived = measurement, free/OSS**: **PostHog** (OSS, MIT core — analytics + A/B + flags + surveys;
  ~1M events/mo free) and/or **Umami** (37.3k★, MIT, runs on a $5 VPS). Instrument first so you *know* which
  channel works before committing.

## The sequence (post-MVP) → maps to your architecture
pick ONE channel → instrument (PostHog/Umami) → create/launch → measure conversions → double down. The
sequence = deterministic **workflow**; content/copy = a **skill / bounded agent** (verify quality + tune with
optimize-prompt); channel choice + community = **human**. See [[product-generation-pipeline]], [[when-to-use-what]].

## Still-thin gaps + refuted
- Unverified: specific AI-tool efficacy, cold-email deliverability benchmarks, build-in-public effect, Reddit-launch specifics.
- Don't repeat (refuted 0-3): "AI content 0.011 ranking correlation", "86.5% of top pages are AI", "content takes 12–24mo so it's too slow for solos".

Sources: Rob Walling/MicroConf, First Round Review, Lenny's Newsletter, Google Search Central docs,
news.ycombinator.com guidelines, PostHog & Umami GitHub. Full cited report in the 2026-06-25 deep-research run.
