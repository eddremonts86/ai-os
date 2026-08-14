---
id: "487"
slug: we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove
title: "We built a tool that fixes bugs. It couldn't always prove it."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/"
category: indiehackers
date: "2026-08-03"
tech: [TypeScript, Node.js (Fastify), Playwright, PostgreSQL, Redis, Docker, Hetzner]
---
# We built a tool that fixes bugs. It couldn't always prove it.

## Problem

Source: [reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/)

Original post:

> Our tool was telling users bugs were fixed. It couldn't always prove it. Not lying exactly. More like the polite version of "trust me." When we built FetchSandbox, we drew a hard line early: a fix doesn't count until we (1) make the bug actually happen on your real code, (2) apply the fix, and (3) show it stops happening. Reproduce first, then prove. The little test that triggers the bug is what flips from red to green. That rule felt airtight. It wasn't. The hole we didn't see We could only reproduce bugs we'd scripted a reproduction for in advance. For anything outside that set, the honest answer we were forced to give users was: "found it, fixed it, but I can't demonstrate this specific one." Say that out loud and it sounds fine. But think about what you're actually asking the user to do: take your word for it. For a billing bug. For a security edge case. For anything that matters. That bothered me more the longer I sat with it. So we taught it to write the reproduction itself The idea is straightforward. If FetchSandbox encounters a bug it has no pre-scripted test for, it figures out how to trigger that bug on your real code, then runs the same reproduce-apply-prove loop it always has. The implementation was not straightforward. The fake green problem A generated test could be subtly wrong. It could pass your broken code and hand you a green checkmark on an unfixed bug. That's worse than admitting you can't prove it, because now you've actively misled the user. So we added a safety rule: before we trust a reproduction, it has to actually catch the bug on the broken code first. If the generated test can't catch the bug it's supposed to catch, we throw it away. A test that can't fail when the code is broken can't be trusted to pass when the code is fixed. This one rule is what makes the whole thing honest. What it looks like in practice We ran it on a real billing app last week. The bug: a negative seat count slipping through validation and potentially shrinking a customer's plan without them knowing. FetchSandbox found the code path, drove the real request handler, worked out a valid webhook signature on its own to reach it, and stubbed only the database as a passive recorder so the app's own logic decided the outcome. Then it confirmed the test failed on broken code before trusting it to verify the fix. No scripts we wrote. No hand-holding. We just watched it go. Why this matters beyond the feature Most of the AI coding tools I see right now optimize for "did the model produce a plausible fix." That's a low bar dressed up in a nice UI. The harder question is: how do you know the fix is real? The reproduction test is our answer. Not because it's the only answer, but because "make the bug happen, then make it stop" is something you can verify. Confidence is a byproduct of that, not a claim you make. Still early and still building this in the open. If you've run into the prove-vs-claim problem with your own tooling, I'd genuinely like to hear how you're thinking about it. submitted by /u/Common_Dream9420 [link] [comments]

---

What this plan addresses: FetchSandbox: a bug-fixing service that auto-generates reproductions when none exist, then proves the fix.

## Objective

A bug-fixing service that generates a reproduction if the user has none, then proves the fix by running the reproduction against the real code. When a bug fix lands and I am asked to trust it, I want a service that generates a reproduction if I don't have one and proves the fix by running it, so I stop accepting "trust me" reports.

## Target Users

- Engineering teams tired of "trust me, it's fixed" reports
- Solo founders shipping code without a QA function
- Agencies producing AI-built code that needs verifiable proof of fix

## MVP Scope

- Bug ingestion with reproduction script if available
- Auto-reproduction: if no script, the service generates one on the real code
- Apply fix + verify the bug no longer triggers
- Scorecard per fix with concrete proof artifacts

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixe` follows the constraints in `487-.../SPEC.md` and the chosen stack (TypeScript, Node.js (Fastify), Playwright). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes FetchSandbox and its reproduce-apply-prove loop
- Plan keeps the auto-reproduction framing
- Source did not name a price
