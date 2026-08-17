---
id: "479"
slug: is-less-more
title: "Is less, more?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vgdyvf/is_less_more/"
category: indiehackers
date: "2026-08-05"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# Is less, more?

## Problem

Source: https://www.reddit.com/r/indiehackers/comments/1vgdyvf/is_less_more/

Original post:

> Yesterday I spent pretty much the whole day stressing about my app Gamified Lives I launched 1.5 months ago, I’m at 69 users, 20% stickiness, 1 free trial, decent overall retention. Just pushed a new update 2 days ago. Yet it never feels like enough, I was up all night thinking about it, thinking about the stats, thinking about user requests, things I wanted to work on, scared I didn’t post for the day. I then woke up to 5 new users, higher retention then I went to sleep with, and hitting 10,000 website views on my website. I’ve realized now that although going into maintenance mode may feel difficult it pretty much is the only way to keep an app sustainable, listening to users feedback every week and spending 15-30 minutes just writing down everything you heard multiple times, thinking of the what can do better as the founder. At the end of the day users are flowing in, SEO is doing its job, Reddit posts are driving traffic, and there’s no reason to try and be everywhere at once when the app can sustain with me not being there every millisecond stressing about it. So I’ve set a goal for myself to not spend more than 5 hours per week on the app until I hit 100 users, which likely means around 1 month of 1 hour a day every week day not thinking about it every second, I implore you guys to try doing the same if you’re in a similar spot, sure growing is hard, and it’s even harder to let go a little but it does no good to sit there stressing about something you can’t entirely control, all you can control is your understanding of the market you’re in, and how you adjust your copy and your angle, if the product is good people will come over time and whether they all come today or in 6 months makes little to no difference. I’d love to hear what got others to the point where they could stop stressing about their product and instead just focus on the small things that actually move the needle? submitted by /u/kev_habits [link] [comments]

---

What this plan addresses: A "less is more" coaching tool for indie founders: structured weekly caps on app-time, with weekly reflection prompts.

## Objective

A weekly time-cap coaching tool for indie founders, with reflection prompts and an opt-in public log. When I am spending too much time on my app and not seeing traction, I want a weekly time cap with reflection prompts, so I stop stress-looping and start focusing on what actually moves the needle.

## Target Users

- Indie founders with a working app who feel they are spending too much time on it
- Solo developers burning out on a side project
- Bootcamp / accelerator participants who want a sustainable pace

## MVP Scope

- Weekly time-cap settings (e.g. "5h/week")
- Reflection prompts at the end of each week
- Public log (opt-in) of "what I did this week"
- No auto-blocker; this is a thinking aid

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vgdyvf/is_less_more/` follows the constraints in `479-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes the poster's goal of "not more than 5 hours per week" until 100 users
- Plan keeps the cap + reflection framing
- Source did not name a specific app or revenue
