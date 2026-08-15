---
id: "471"
slug: every-quotstartup-idea-validatorquot-is-ai-now-i-went-t
title: "Every \"startup idea validator\" is AI now. I went the other way — real founders vote on your decision, and they can't see each other's answers."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vj4oe6/every_startup_idea_validator_is_ai_now_i_went_the/"
category: indiehackers
date: "2026-08-08"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# Every "startup idea validator" is AI now. I went the other way — real founders vote on your decision, and they can't see each other's answers.

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vj4oe6/every_startup_idea_validator_is_ai_now_i_went_the/)))))

Original post:

> Type "idea validator" into Google and everything on page one is an AI that reads your pitch and generates encouragement. I've tried them. The feedback arrives instantly, costs nothing, and changes nothing — it's a language model telling you what founders in its training data would probably say. So I built the opposite on my platform (LaunchPact — I'm the founder, this is my product). It's called a Founder Poll and the mechanics are deliberately narrow: You get one question with 2–4 options (text or images), live for 24 hours. The voters are founders who actually use the platform — people mid-launch, making the same calls you are. The network is ~1,150 founders; only repeat users who finished onboarding see polls. Voters never see live counts. No bandwagon voting — every vote is someone's independent answer. Each founder sees your poll once, in a modal. Answer or dismiss. No nagging, no duplicate votes, and you can't vote on your own. You see attributed results live (who voted for what); the public only ever sees aggregates after close. It costs $5 (or $10 if you book within 48 hours of the slot). That's not a business model, it's a spam filter — free polls turn into "please validate my landing page" noise within a week, and there's only one poll slot per day globally, so it has to cost something to matter. Honest limits: the voters are founders, not necessarily your customers. This validates decisions — which name, which pricing page, which hero — not your TAM. For "should this company exist," you still need customer discovery interviews; no poll replaces that. If you had one forced-choice question in front of a room of founders for 24 hours — what would you actually ask? Name, pricing, or landing page? submitted by /u/Competitive_Tune_590 [link] [comments]

---

What this plan addresses: A human-curated startup-idea validator that pairs founders with real operators for honest feedback.

## Objective

A human-curated startup-idea validator that pairs founders with real operators for honest feedback, instead of AI-generated vibes. When I have an idea and want honest feedback before building, I want a service that matches me with real operators in the relevant domain, so I do not get AI-generated "this sounds cool" feedback.

## Target Users

- Solo founders with an idea they want validated before building
- First-time founders who do not trust AI validators
- Bootcamp / accelerator participants who want structured pre-build feedback

## MVP Scope

- Idea submission + 3-question intake
- Match with 2-3 real operators in the relevant domain
- Structured feedback within 7 days
- No AI-generated validator output in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vj4oe6/every_startup_idea_valida` follows the constraints in `471-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body argues that every "startup idea validator" is now AI; the poster went the other way (real founders)
- Plan keeps the human-curated framing
- Source did not name a price
