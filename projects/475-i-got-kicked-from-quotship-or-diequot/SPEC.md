---
id: "475"
slug: i-got-kicked-from-quotship-or-diequot
title: "I got kicked from \"Ship or Die\" 😢"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vi0q98/i_got_kicked_from_ship_or_die/"
category: indiehackers
date: "2026-08-07"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# I got kicked from "Ship or Die" 😢

## Problem

Source: https://www.reddit.com/r/indiehackers/comments/1vi0q98/i_got_kicked_from_ship_or_die/

Original post:

> Hi fellow indiehackers 👋 Well today I have not too positive news unfortunately.. I didn't launch a startup within the 30 day threshold, so I got kicked 😢 I can still read along on the discord but cannot post any messages. There is even a tweet on my failure. I owe it completely to myself though. I have been building a new startup in the past month, but just haven't come along as far as I would've hoped. Also I currently don't want to focus on a "launch" campaign, as I'm still refining the product, so I'm starting with a direct outreach approach first for people who need my product. Also, I have been building pretty much non-stop since March, and together with a full-time job I noticed my mind and body just needed a rest. I took a week off, and only after that week did I realize how tired I actually was 😅 But owing it to just that wouldn't do it justice I think. I also think that for me the benefits of ship or die had started to wear off. The discord was more and more starting to become just the same bunch of people talking together, it was becoming more of a distraction than a benefit for me. Also the community has definitely calmed down since launch so I think a combination of those factors caused me to just not have the motivation to round up my product into a launch it wasn't ready for. Still, the public "shame" (even though it went rather unnoticed) and the fact I didn't make it, can play parts. I'm mentally in a much better place now, and also feel that through the past months I've become way more active in "free" communities like on X or here on Reddit. So did I feel bad? Maybe for a moment, but it doesn't really mean anything in the grand scheme of things. I'll just keep focusing on my product. My goal is simple now: 1 customer in the next week. I'm only doing what it takes to get there. Which means no feature building anymore, just personal outreach to people who need my product here on Reddit. Still looking back, joining Ship or Die has been a positive thing for me. It taught me to bet on myself and be active in a small little community of fellow builders. It showed me where I am on my path and that it's really possible to achieve success. Not sure about the $250 price tag though, it seems a bit steep for this lesson and 2 months of these "perks". But still this was their experiment as well and in the beginning you don't know how things pan out. Keep building, keep shipping, keep showing up where your target audience is. Don't give up 💪 submitted by /u/TravelingTice [link] [comments]

---

What this plan addresses: A "Ship or Die" alternative: a low-stakes monthly build-in-public accountability track with a 30-day finish line.

## Objective

A gentler monthly build-in-public accountability track with a 30-day finish line, designed for indie hackers who do not fit the "Ship or Die" model. When I want build-in-public accountability but cannot commit to "Ship or Die," I want a gentler monthly track with weekly check-ins and a public demo day, so I stay consistent without burning out.

## Target Users

- Indie hackers who tried "Ship or Die" and want a gentler format
- Solo founders who want monthly accountability
- Bootcamp / accelerator participants who want cohort momentum

## MVP Scope

- Monthly cohort signup
- Weekly check-in flow
- Public demo day at the end of each cohort
- No penalty for missing a week

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vi0q98/i_got_kicked_from_ship_or` follows the constraints in `475-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the poster "got kicked from Ship or Die"
- Plan is the implied gentler alternative
- Source did not name a specific ship date or product
