---
id: "434"
slug: if-you-could-talk-to-an-expert-for-30-minutes-before-st
title: "If you could talk to an expert for 30 minutes before starting your business, what would you ask? I will not Promote"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vm717r/if_you_could_talk_to_an_expert_for_30_minutes/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, PostgreSQL, Stripe Connect, Resend, Vercel]
---
# If you could talk to an expert for 30 minutes before starting your business, what would you ask? I will not Promote

## Problem

Source: https://www.reddit.com/r/startups/comments/1vm717r/if_you_could_talk_to_an_expert_for_30_minutes/

Original post:

> I’ve been thinking about how much founders figure out through trial and error. If you had access to someone who had actually built a business in your industry and could ask them anything for 30 minutes before making a major decision: What would you ask? Would it be: “Is this business idea actually worth pursuing?” “How should I price this?” “How do I get my first 100 customers?” “Should I raise funding or bootstrap?” “What am I completely overlooking?” Curious what founders here would use those 30 minutes for. submitted by /u/Inner_Dragonfly7388 [link] [comments]

---

What this plan addresses: Structured founder-expert Q&A marketplace: questions vetted, 5-minute video answers, founder-rated.

## Objective

A 5-minute expert-answer marketplace structured around the questions founders actually want answered. When I have 30 minutes with an expert, I want the question already vetted and the answer reusable, so my hour does not become a one-off conversation.

## Target Users

- First-time founders who would pay $50-$200 for an expert answer in their industry
- Domain experts who want a low-friction way to monetise 5 minutes of advice
- Accelerators running founder-cohort sessions

## MVP Scope

- Question board tagged by industry
- Experts claim questions and reply with a 5-minute video
- Founders pay to unlock the question + answer
- Ratings prevent low-quality replies

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vm717r/if_you_could_talk_to_an_exper` follows the constraints in `434-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source is a Reddit question asking what founders would ask an expert
- Plan flips the question into a marketplace
- Source did not name a price; defaults to a small founder-pay tier and expert-claim flow
