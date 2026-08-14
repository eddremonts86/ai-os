---
id: "436"
slug: what-problem-makes-you-think-omfg-this-sucks-there-must
title: What problem makes you think Omfg this sucks there must be a better way? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_omfg_this_sucks/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# What problem makes you think Omfg this sucks there must be a better way? (I will not promote)

## Problem

Source: https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_omfg_this_sucks/

Original post:

> I’m an engineer and I like building software/AI systems, but I’m trying very hard not to build a solution in search of a problem. So instead of asking for startup ideas, I’m curious about problems people actually deal with. What’s something in your work that is genuinely annoying, expensive, repetitive, error-prone, or takes way more time than it should? I’m especially curious about things like: processes that still involve a lot of spreadsheets/copy-pasting/manual checking information scattered across different systems software you pay for but still have to work around things you regularly have to verify or reconcile by hand tasks where you’ve thought “why the hell isn’t this automated?” I don’t have a product to sell. I’m trying to understand real problems before deciding whether anything is worth building. If you have one, I’d be interested in what the problem is, what you currently do to deal with it, and whether you’ve already tried software that was supposed to solve it. Thank you!! submitted by /u/JuniorLeg6988 [link] [comments]

---

What this plan addresses: Curated catalogue of "why isn't this automated?" workplace problems, sourced from public forums and ranked by time lost.

## Objective

A curated, sourced catalogue of workplace problems phrased the way people actually complain about them, so engineers can pick from real demand instead of brainstorming in a vacuum. When I want to build something, I want to start from a sourced catalogue of "this sucks" problems, so I do not end up building a solution in search of a problem.

## Target Users

- Engineers looking for ideas that are not "AI wrapper" but actual workflow pain
- Process auditors collecting cross-industry examples
- Internal-tools product managers looking for demand signals

## MVP Scope

- Searchable index of problems phrased as "this sucks" with original source quote
- Filters by industry, role, frequency, current workaround
- Each problem has a "submit a solution idea" form that goes to moderators
- No invented market size; all entries cite the original post

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vm5qbw/what_problem_makes_you_think_` follows the constraints in `436-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source says the poster is trying to avoid "solution in search of a problem"
- Plan is the implied tool: a public catalogue of real problems
- Source did not name an industry, country, or budget
