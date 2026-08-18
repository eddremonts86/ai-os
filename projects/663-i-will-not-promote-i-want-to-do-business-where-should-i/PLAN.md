---
id: "663"
slug: i-will-not-promote-i-want-to-do-business-where-should-i
title: "I will not promote: I want to do business. Where should I start?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp3cx3/i_will_not_promote_i_want_to_do_business_where/"
category: startups
date: "2026-08-15"
tags: [founder-onboarding, idea-discovery, validation, beginner]
tech: [Astro (static site), Markdown-driven content, Postgres + Drizzle (for the journal), Resend, Plausible]
---
# I will not promote: I want to do business. Where should I start?

## Tech Stack

- **Astro for the static playbook site** — the 30-day content is text-heavy, must index well on Google for "how to start a business first time" search terms, and Astro is the cheapest SEO-first deploy.
- **Markdown-driven content** — the playbook is a folder of markdown files, one per day, version-controlled in git so the playbook's evolution is auditable.
- **Postgres + Drizzle (for the journal)** — the founder's daily entries, tagged to one of the seven questions, with a simple schema that the founder can export as a CSV at the end.
- **Resend** — the weekly Sunday check-in email so the founder does not have to remember the rhythm.
- **Plausible** — analytics on the playbook site so the maintainer can see which days are read and which are skipped.

## Architecture

The playbook is a static Astro site that loads the 30-day markdown files in order. The journal is a small Next.js-style API on the same Postgres, exposed as `/journal/` with a per-founder token. The founder lands on the playbook, reads day 1, hits "log entry", and writes 200-300 words into the journal. The journal entry is tagged to one of the seven questions (a single-select field). Each Sunday, a cron fires a weekly check-in email with a templated prompt that references the founder's last entry. The public playbook serves the 30-day content, a publicly viewable example journal from a real founder (with consent), and the prompt library. There is no AI coach, no chat, no marketplace, no mentor matching — the source is a question, and the product is the silent answer.

```
founder                Astro playbook            Next.js /journal API           Resend          Plausible
  |                       |                       |                       |               |
  |---reads day 1-------->|                       |                       |               |
  |                       |                       |                       |               |
  |---hits log entry----->|                       |                       |               |
  |                       |---POST /journal------>|                       |               |
  |                       |                       |---store--->Postgres   |               |
  |                       |                       |                       |               |
  | (Sunday cron)         |                       |---weekly check-in--->|---email-----> |
  |                       |                       |                       |               |
  |---reads day 30------->|                       |                       |               |
  |                       |                       |                       |               |
  |---exports CSV-------->|                       |                       |               |
  |                       |                       |                       |               |
  |---reads example------>|                       |                       |               |
  |                       |---event----------------------------------------> |               |
```

## Milestones

- **M1 — 30-day playbook text:** One markdown file per day, drafted with two outside first-time founders during a private beta.
- **M2 — Journal web app:** Per-founder token, daily entry form, tag-to-question selector, and a private read view.
- **M3 — Idea scorecard:** A 10-row scoring sheet the founder can apply to each candidate idea, with a published rubric.
- **M4 — Prompt library:** 20 concrete interview scripts for "talk to people with the problem" that the founder can copy.
- **M5 — Weekly check-in email:** Sunday cron + Resend with a templated prompt that references the founder's last entry.
- **M6 — Public example journal:** A real founder's anonymised 30-day journal, published with consent, so the playbook is not a blank page.

## Risks

- **Risk:** The playbook is too generic and the founder cannot apply it to their specific vertical. **Mitigation:** The example journal is from a real founder in a real vertical, demonstrating that the generic process adapts.
- **Risk:** The 30-day window is too short for founders who need to validate a deep domain. **Mitigation:** Document "what to do if you need more time" as a paragraph in the playbook, and let the founder pause the cron.
- **Risk:** The weekly check-in email becomes nagging. **Mitigation:** Tone-test with five founders before launch; ask them to score each email on a 1-5 "feels like a coach" scale.
- **Risk:** The founder uses the playbook but never writes the journal, defeating the purpose. **Mitigation:** The journal is gated by the same per-founder token, and the daily entry is the unlock for the next day's tip.
- **Risk:** The source is a Reddit question, not a product surface; the playbook's value is hard to measure without a strong editorial story. **Mitigation:** The example journal is the editorial story; without it, the product is a wiki.
