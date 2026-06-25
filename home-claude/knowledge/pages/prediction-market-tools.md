# Prediction-market tools — feasibility for a solo smart-money tracker

One line: verified API / legality / regulation facts for building a Polymarket/Kalshi analytics tracker
as a solo operator. Deep research 2026-06-25. Feeds [[demand-validation]], [[product-generation-pipeline]].

## Verdict in one line
**Polymarket = feasible & legal for a solo analytics tracker; Kalshi = blocked-by-default (needs a
commercial data license). The open risk is now DEMAND / saturation, not feasibility.**

## Polymarket — green light (technical + legal)
- **Data**: 3 official APIs (CLOB, Gamma, **Data API**). The **Data API is fully public, no auth** → user
  positions, trades, activity, holders, open interest, **leaderboards** = exactly the whale-tracking surface.
  Also on-chain. Rate limits generous (200 req/10s trades, 150 positions) → solo-scale viable. No verified commercial-use ban.
- **US legality FLIPPED favorable (late 2025)**: CFTC **Amended Order of Designation (Nov 25, 2025)** →
  **Polymarket US** (QCX, via ~$112M QCEX acquisition) is a CFTC-regulated US exchange (DCM); launched
  **Dec 3, 2025**; $425M single-day volume Feb 28, 2026. US users trade via FCMs. (International
  polymarket.com still geoblocks US IPs.) → **corrects the earlier "Polymarket is US-illegal" assumption.**

## Kalshi — blocked by default (the idea-killer for the Kalshi side)
- Great official Exchange API + dev program, BUT **Data Terms = personal, non-commercial only**: expressly
  forbid using Kalshi Data to develop software, redistribute/display prices, or build products/services
  **without prior written consent**. "Kalshi Data" includes prices, volume, OI, leaderboard data. → a
  commercial Kalshi tracker **needs authorization** (the $2M "Builders" grant is the intended path; exact
  terms unverified). **Don't build commercially on Kalshi data without it.**

## Regulation — favorable for PURE analytics
- **17 CFR 4.14(a)(9)**: exempt from CTA registration if you (i) don't direct client accounts AND (ii) don't
  give advice tailored to particular clients. **Identical, non-customized info to all users + never trading
  for them = exempt side.** The test is the *nature* of advice (impersonal vs tailored), not the medium
  (explicitly covers websites/software/newsletters).
- **Don't cross**: collecting individualized client info (net worth/risk/goals) + advising on it disqualifies;
  never auto-execute or take custody. Public marketing is fine under (a)(9). *Not legal advice — get a CFTC
  opinion before launch; whether event contracts are "commodity interests" / a tracker is a "CTA" is open.*

## Still open (the real risks now)
- **Saturation**: only one competitor verified — `jon-becker/prediction-market-analysis` (~3.5k★, MIT, the
  largest public Polymarket+Kalshi dataset, built by one engineer → proves a solo can collect this). Named
  trackers (Polymarket Analytics, polymarketwhales, Domer) + whether Polymarket's built-in leaderboard is
  "good enough" = **unverified**.
- **Demand / willingness-to-pay** for a third-party tracker vs free built-in leaderboards = **unverified**.
- → exactly what a cheap fake-door + concierge test should answer next.

Sources: docs.polymarket.com, docs.kalshi.com + Kalshi Data ToS, CFTC (17 CFR 4.14, Federal Register,
cftc.gov/media/12806), CoinDesk/Reuters, github.com/jon-becker/prediction-market-analysis. Full cited report
in the 2026-06-25 deep-research run.
