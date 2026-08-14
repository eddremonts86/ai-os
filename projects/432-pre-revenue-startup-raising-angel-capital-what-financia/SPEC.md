---
id: "432"
slug: pre-revenue-startup-raising-angel-capital-what-financia
title: Pre-revenue startup raising angel capital - what financials need to be in a pitch deck/data room? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vma20k/prerevenue_startup_raising_angel_capital_what/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Node.js API (Hono), PostgreSQL, Resend, Stripe, Railway]
---
# Pre-revenue startup raising angel capital - what financials need to be in a pitch deck/data room? (I will not promote)

## Problem

Source: https://www.reddit.com/r/startups/comments/1vma20k/prerevenue_startup_raising_angel_capital_what/

Original post:

> I’m looking for some advice from founders, investors and/or people who've raised pre-seed/angel rounds. I’m a young(ish) (first-time) founder working on a very early-stage consumer climate/nature tech startup. In essentially concept/MVP (product hasn't been built yet) stage and trying to understand what “good” looks like when presenting the financial side of the business to angel investors. I feel reasonably comfortable explaining the product and market but the finance side (and business model) is where I’m getting stuck. For context, the concept has elements of Sweatcoin and Treeapp: encouraging people to get outside, rewarding movement and giving users ways to engage with nature-positive actions like tree planting. Potential revenue streams will include advertising, offer walls, sponsorships, affiliates, subscriptions and corporate partnerships. Main question: At pre-revenue, pre-product stage, what financial information do angel investors expect to see? Should a pre-seed financial model include things like: 3–5 year revenue projections User growth assumptions Revenue per user CAC and LTV Development and team costs Burn rate and runway Unit economics Base/upside/downside scenarios Break-even assumptions And how much of that belongs in the pitch deck VS data room? I’m conscious that without users or revenue, a lot of the numbers are assumptions. I don’t want to create a fantasy spreadsheet just because investors (may) expect to see numbers, but I want to demonstrate that I understand how the economics of the business could work. Similarly, what would you expect to see in the data room from a company this early? I’m looking to raise enough capital to move the product forward and ideally bring an angel onboard who can also provide guidance and mentorship. Would really appreciate perspectives from anyone who has raised at this stage or looks at early-stage deals/start-ups submitted by /u/Ok_Bear_9606 [link] [comments]

---

What this plan addresses: Pitch-deck financial-section generator for pre-revenue founders raising angel capital.

## Objective

A pitch-deck financial-section generator that outputs the four slides angel investors actually open, without the founder having to hire a CFO or learn Excel finance. When I am raising angel capital pre-revenue, I want the financial slides an angel actually opens, so I do not lose the meeting to a missing cash-bridge or an unsupported burn number.

## Target Users

- Pre-revenue founders raising between $250K and $2M from angels
- First-time fundraisers who do not yet have a CFO
- Angel mentors running pitch-practice cohorts

## MVP Scope

- Form-driven builder: founder inputs amount raising, current cash, monthly burn, planned hires, expected revenue ramp
- Explicit "I don't know" allowed for every input
- Output is 4 LaTeX-ready slides + a one-page PDF export
- Slides cover use of funds, 18-month cash bridge, milestone-tied hires, downside case

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vma20k/prerevenue_startup_raising_an` follows the constraints in `432-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Node.js API (Hono)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source explicitly asks "what financials need to be in a pitch deck"
- Plan addresses that exact question
- Source did not state raise size or country; plan defaults to USD with non-USD override
