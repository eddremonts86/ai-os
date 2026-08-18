---
id: "635"
slug: starting-outreach-at-a-local-ai-law-startup-i-will-not-
title: "Starting outreach at a local AI law startup, I will not promote"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp00z2/starting_outreach_at_a_local_ai_law_startup_i/"
category: startups
date: "2026-08-15"
tags: [legal-tech, seo, google-ads, linkedin]
country: Central Europe
tech: [Astro (static site), Next.js (app), Postgres + Drizzle, Resend, Plausible]
---
# Starting outreach at a local AI law startup, I will not promote

## Tech Stack

- **Astro for the static playbook site** — the decision matrix and the Google Ads kickoff guide are mostly text, need to index well for the same "lawyer AI" terms the founder's product targets, and Astro is the cheapest SEO-first deploy.
- **Next.js for the kickoff companion app** — the cold-email template generator, the weekly outreach log, and the conversion-tracking wiring that the founder can hand to the Google Ads dashboard.
- **Postgres + Drizzle** — the prior-user re-engagement table that the founder is already running; the playbook adds stage and template columns on top of the existing email list, not a parallel system.
- **Resend** — sending the cold-email waves and the weekly outreach-remind email so the founder does not have to remember the cadence.
- **Plausible** — tracking on the founder's "the product is now usable" public page so the founder can see which channel drove the visit.

## Architecture

The playbook is a public Astro site with the decision matrix front and centre, plus the Google Ads kickoff guide and the cold-email template as linked pages. The Next.js app runs the cold-email wave generator and the weekly outreach log, both backed by Postgres. Resend sends the cold-email waves through the founder's own sending domain (so the deliverability story is the founder's, not the playbook's) and a weekly Sunday reminder to fill in the outreach log. Plausible tracks the public page so the founder can correlate spikes in visits to spikes in ad spend. The architecture is intentionally a thin layer over the founder's existing stack; the goal is to make the playbook executable, not to introduce a new tool the founder has to learn.

```
founder                Astro playbook            Next.js app                Resend          Plausible
  |                       |                       |                       |               |
  |---reads matrix------->|                       |                       |               |
  |                       |                       |                       |               |
  |---generates cold-email|                       |                       |               |
  |----------------------->|------> Next.js ----->|                       |               |
  |                       |                       |---templated body----->|               |
  |                       |                       |                       |---send--->    |
  |                       |                       |                       |               |
  | (Sunday cron)         |                       |---weekly reminder--->|---email--->   |
  |                       |                       |                       |               |
  |---visits public page--|------> events -------|----------------------->|               |
  |                       |                       |                       |               |
```

## Milestones

- **M1 — Decision matrix:** A single page that ranks Google Ads, Facebook, LinkedIn, and direct partnerships for the founder's shape, with a recommended first channel and a budget cap.
- **M2 — Google Ads kickoff guide:** Step-by-step account setup, the three keyword groups to test, conversion tracking wired to the founder's signup, and a "do not do this" list.
- **M3 — Cold-email template:** Three subject lines, a body template, a follow-up cadence that the founder can run in waves, and a spam-filter sanity check.
- **M4 — Public-facing page:** A "/" page on the founder's existing site that says "the product is now usable" without re-lying about the founder-story, plus a UTM-tracked CTA per channel.
- **M5 — Weekly outreach log:** A single-page Next.js form the founder fills in by hand each Friday, summarising what was sent, what was opened, and what was replied.
- **M6 — Two-week stop/go rule:** A documented threshold (e.g., CAC below $25) that tells the founder to keep spending or to stop, with a one-paragraph rationale the founder can defend to a peer.

## Risks

- **Risk:** The poster's identity is identical to plan 634 in the corpus; the two plans will read as clones if the prose is too aligned. **Mitigation:** Sharply differentiate the second-pass playbook by centering the decision matrix and the cold-email wave, not the channel-by-channel runbook.
- **Risk:** The Google Ads kickoff guide is too generic and the founder cannot follow it. **Mitigation:** Record a 10-minute screencast of the founder actually setting up the account, and embed the video in the guide.
- **Risk:** The cold-email template lands in spam because the founder's sending domain is new. **Mitigation:** Document a one-week warm-up plan (10 emails per day to known contacts) before the partner wave.
- **Risk:** The bar's advertising rules forbid the cold-email copy. **Mitigation:** Include a "rules checklist" appendix and recommend the founder sends the template to their own counsel before the first wave.
- **Risk:** The two-week measurement window is too short for legal-tech buying cycles. **Mitigation:** Track both signups AND scheduled demos, since the demo is the legal-tech purchase signal.
