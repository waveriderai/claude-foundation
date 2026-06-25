---
name: validate-idea
description: Validate a product/startup idea BEFORE building it — runs the evidence-based demand-validation playbook (problem-first check, Mom Test interview questions, a fake-door smoke test + commitment ladder, thin-MVP plan) and gives an honest go/no-go. Use when the user says "validate this idea", "should I build X", "is there demand for X", "how do I test this idea", or wants to gauge demand before building.
---

# validate-idea

Turn a raw idea into a concrete validation plan + an honest go/no-go. Based on
`~/.claude/knowledge/pages/demand-validation.md` (primary sources: Paul Graham, Eric Ries, The Mom Test, YC).

## Be honest first (anti-sycophancy — this is the point)
Your job is NOT to encourage the idea. Evaluate it against the playbook and say what's true. If it looks
like a "made-up / sitcom" idea (sounds plausible, solves a problem no one urgently has), say so plainly —
that is the #1 reason products fail. Confirm strengths only where they're real.

## Procedure (produce each artifact with/for the user)
1. **Problem check.** Is there a *real, specific* problem, and does someone the user knows feel it
   *urgently*? Is the user uniquely positioned? Red-flag abstract/brainstormed ideas with no personal
   connection. Output: a one-sentence problem statement + who has it acutely.
2. **Find the desperate few.** Identify the narrow segment that needs even a crappy v1 *now* (not "could
   see themselves using it someday"). If you can't name them, that's a red flag.
3. **Mom Test interview kit.** Draft 5–8 questions that ask about the person's *life and past behavior*,
   not the idea or the future (e.g. "Walk me through the last time you hit <problem>… what did you do?").
   No pitching. Goal = learn if the problem is real, not get compliments.
4. **Demand test design (fake-door + commitment ladder).** Design the cheapest behavioral test: a
   smoke-test landing page / ad for the not-yet-built thing. Define the signal at each rung and a
   pass threshold *before* running: view → click → email → pre-order/deposit. Note that clicks overstate
   demand — require a higher-commitment signal before building.
5. **Vanity-metric guard.** List which numbers would be vanity (downloads, raw signups, followers,
   waitlist size) vs real (deposits, repeat use, "desperate" interviews) for THIS idea.
6. **Thinnest path to learning.** Recommend the smallest MVP ("quantum of utility") OR a
   concierge/Wizard-of-Oz version (do it by hand). Plus a manual first-~100-users recruitment plan
   (do things that don't scale — go get them).

## Optional research
Use the `deep-research` skill for market/trend/competitor context — but treat search-volume/forum signals
as weaker than a real fake-door + commitment-ladder test.

## Output (the artifact — end in proof)
A one-page plan with: problem statement · target "desperate" segment · Mom Test questions · the demand
test + pass thresholds · vanity-vs-real metrics · thinnest-MVP recommendation · **the single riskiest
assumption to test first** · an explicit **GO / NO-GO / TEST-MORE** call with the reason.

## Maps to the architecture
This skill is the saved, reusable step; the full idea→validate→MVP→users loop is a deterministic workflow;
the interviews + recruitment are human-in-the-loop. See [[product-generation-pipeline]], [[when-to-use-what]].
