---
id: "457"
slug: i-can-build-the-saas-finding-the-first-customer-is-the-
title: I can build the SaaS. Finding the first customer is the hard part.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnwlm6/i_can_build_the_saas_finding_the_first_customer/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, PostHog, Stripe, Resend, Vercel]
---
# I can build the SaaS. Finding the first customer is the hard part.

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vnwlm6/i_can_build_the_saas_finding_the_first_customer/

Original post:

> As a solo developer, I’m realizing something: Coding isn’t my biggest problem anymore. Distribution is. I can build the MVP. I can fix bugs. I can improve the UI. But then comes the question: Where are the first people who will actually pay? I’ve tried thinking about cold email, Reddit, X, LinkedIn, communities… but every channel feels different. I’m curious about other solo founders: What was the hardest part of getting your first customer? Was it: Finding the right people? Getting replies? Getting them to try the product? Getting them to trust you? Or actually asking for the payment? And most importantly: What finally worked for you? I’d rather learn from real founder experiences than spend months guessing. submitted by /u/mrjaspergames [link] [comments]

---

What this plan addresses: A "first customer" co-pilot for solo SaaS founders: structured outreach, ICP narrowing, and weekly progress tracking.

## Objective

A "first customer" co-pilot for solo SaaS founders: structured weekly check-ins, ICP narrowing, and templates for the 5 most common first-customer motions. When I have shipped a SaaS and have zero paying customers, I want a structured weekly co-pilot that asks about ICP narrowing and outreach, so I do not drift into "build more features" instead of selling.

## Target Users

- Solo SaaS founders with a working product and zero paying customers
- Solo developers who have shipped but not sold
- First-time founders who feel lost after the build phase

## MVP Scope

- Weekly check-in flow: ICP narrowing, outreach count, replies, learnings
- Public accountability log (opt-in) so the founder has social pressure
- Templates for the 5 most common first-customer motions
- No "AI SDR" in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnwlm6/i_can_build_the_saas_finding_the_` follows the constraints in `457-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says "I can build the SaaS. Finding the first customer is the hard part."
- Plan is the implied structured co-pilot
- Source did not name a niche or product
