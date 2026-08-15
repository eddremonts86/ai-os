---
id: "477"
slug: building-saas-got-10x-easier-getting-someone-to-care-so
title: building saas got 10x easier. getting someone to care somehow got 10x harder. so we built this.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vh6uro/building_saas_got_10x_easier_getting_someone_to/"
category: indiehackers
date: "2026-08-06"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# building saas got 10x easier. getting someone to care somehow got 10x harder. so we built this.

## Problem

Source: [reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vh6uro/building_saas_got_10x_easier_getting_someone_to/)

Original post:

> i’ve built multiple products over the last few years. every time, the same thing happened. we spent weeks building. shipped the product. posted it everywhere. then waited for customers who never came lol. ai made building software insanely fast, but it didn’t solve the part where you actually have to find the right people, understand why they might care, message them without sounding like spam, follow up, and turn replies into calls. that’s why we started building sumora. sumora is an ai outbound workspace for b2b founders and agencies. you give it your website and describe the kind of customer you want. it helps you: • find matching prospects on linkedin and instagram • identify useful signals around their business • research the company before outreach • draft personalised opening messages • create follow-up sequences • manage leads and replies in one place • move interested people towards a meeting the important part is that it isn’t built for blasting thousands of identical ai messages. every campaign stays human-reviewed. we’ve already been running the process manually with founders and agencies, and one recent reddit post led to seven booked calls in a single day. proof attached with the private details blurred. https://app.notion.com/p/Here-s-the-proof-lol-3b0f3ba8b2cc8011a2eee644d5f6ee87 today, we officially launched sumora on indie hackers: https://www.indiehackers.com/product/sumora honestly, i’d love some support and brutal feedback from other builders. what feels clear? what feels confusing? what would stop you from trying it? we’re also personally onboarding a small number of live b2b products and agencies right now. instead of giving you an empty dashboard and disappearing, we’ll help you define the first target segment, create the initial prospect list, write the linkedin or instagram sequence, and launch the campaign with you. best fit: • you already have a live product or service • you know roughly who the buyer is • you can currently accept more customers • one closed customer is actually valuable to the business you can check out the launch. and if you want to map your first campaign with us directly: https://cal.com/trysumora full disclosure: i’m Devansh, one of the founders. submitted by /u/contralai [link] [comments]

---

What this plan addresses: A "first 10 users" distribution playbook for solo founders who feel building got easier but distribution got harder.

## Objective

A 30-task playbook for the first 10 users, written for a solo founder who feels the build-vs-distribution gap. When my SaaS is built and nobody cares, I want a 30-task playbook for the first 10 users with definitions of done, so I stop iterating on the product and start iterating on distribution.

## Target Users

- Solo founders who feel the build-vs-distribution gap
- Indie hackers with a finished MVP and zero users
- Bootcamp / accelerator participants comparing distribution stories

## MVP Scope

- 30-task playbook for the first 10 users
- Each task has a "definition of done"
- Public log (opt-in) of completed tasks
- No "AI growth" in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vh6uro/building_saas_got_10x_eas` follows the constraints in `477-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body argues building SaaS got 10x easier but getting someone to care got 10x harder
- Plan is the implied playbook for the first 10 users
- Source did not name a niche or revenue target
