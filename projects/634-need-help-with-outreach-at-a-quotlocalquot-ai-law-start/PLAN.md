---
id: "634"
slug: need-help-with-outreach-at-a-quotlocalquot-ai-law-start
title: "need help with outreach at a \"local\" AI law startup (i will not promote)"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp036s/need_help_with_outreach_at_a_local_ai_law_startup/"
category: startups
date: "2026-08-15"
tags: [legal-tech, seo, outreach, b2b]
country: Central Europe
tech: [Astro (static site), Next.js (app), Postgres + Drizzle, Resend, Plausible]
---
# need help with outreach at a "local" AI law startup (i will not promote)

## Tech Stack

- **Astro for the static playbook site** — the runbook is mostly text, must index well on Google for the same "lawyer AI" terms the founder's product targets, and Astro is the cheapest SEO-first framework to deploy.
- **Next.js for the experiment dashboard** — the working CRM and the per-channel attribution dashboard, because the founder needs forms, signups, and Plausible event handling.
- **Postgres + Drizzle** — the CRM table for re-engagement, with a stage column and a templated email sequence per stage; persistent enough to survive a founder's laptop being stolen.
- **Resend** — sending the re-engagement email waves and the weekly scorecard reminder.
- **Plausible** — analytics on the per-channel landing-page variants so the founder can attribute signups to the channel that paid for them.

## Architecture

The playbook is a public Astro site with the runbook content, indexed for the same "lawyer AI" terms the founder's product targets so it doubles as a content asset. The Next.js app runs the dashboard and CRM, sits on the same Postgres, and exposes three landing-page variants (one per paid channel) at `/lp/google`, `/lp/linkedin`, `/lp/facebook`, each with a UTM-tracked signup form. Resend sends the re-engagement waves and a Friday scorecard remind to the founder. Plausible tags every signup with the channel, and the dashboard shows the founder which channel's CAC is sustainable after two weeks. There is no scraping of LinkedIn, no cold-email automation, and no agency integration — the founder does the outreach themselves and logs the result.

```
founder                Astro runbook          Next.js dashboard          Resend          Plausible
  |                       |                       |                       |               |
  |---reads playbook----->|                       |                       |               |
  |                       |                       |                       |               |
  |---runs ad spend------>|                       |                       |               |
  |                       |                       |                       |               |
  | (Google Ad click)-----|------> /lp/google --->|---form submit-------->|               |
  |                       |                       |---event (channel)-------------------->|
  |                       |                       |                       |               |
  | (Sunday cron)         |                       |---weekly scorecard--->|---email------>|
  |                       |                       |                       |               |
  |---logs reply--------->|                       |                       |               |
  |                       |                       |                       |               |
```

## Milestones

- **M1 — Runbook document:** The channel-by-channel outreach playbook, drafted and reviewed by two outside CEE founders; published on the Astro site.
- **M2 — CRM table:** Postgres + Drizzle schema for previous users, stages, and email templates; wired to the founder's existing email list export.
- **M3 — Per-channel landing pages:** Three Next.js routes, each with UTM-tagged signup, plus Plausible events fired on submit.
- **M4 — Attribution dashboard:** A single page showing spend per channel, signups, activated lawyers, and CAC; refreshed nightly.
- **M5 — Re-engagement waves:** Resend-driven email sequence with three waves over two weeks, a Friday scorecard, and a hand-off template for warm intros.
- **M6 — Two-week pilot run:** The founder runs the playbook on their own business for two weeks at a small budget; the case study ships in the public runbook.

## Risks

- **Risk:** The "lawyer AI" keyword cluster is too competitive to support paid spend at positive ROI. **Mitigation:** Spend the first $50 on broad-match discovery before locking in exact-match keywords; document the result honestly.
- **Risk:** LinkedIn InMail is too expensive for a CEE legal-tech founder; the playbook recommends it anyway. **Mitigation:** Treat LinkedIn as a brand-channel only (sponsored content, no InMail) and document the difference.
- **Risk:** Bar-association sponsorship rules in the founder's country forbid certain copy. **Mitigation:** Include a "rules checklist" appendix in the runbook that the founder's local counsel can review before launch.
- **Risk:** The two-week measurement window is too short; legal-tech purchase cycles are longer. **Mitigation:** Track both signups AND scheduled demos, since demos are the legal-tech buying signal.
- **Risk:** The founder feels overwhelmed by the playbook's surface area and runs nothing. **Mitigation:** The MVP runbook explicitly orders the channels: SEO first, then Google Ads, then the rest; the channel-3 work happens only if channel-1 produced a positive signal.
