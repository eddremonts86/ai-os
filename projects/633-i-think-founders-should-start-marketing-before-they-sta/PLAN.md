---
id: "633"
slug: i-think-founders-should-start-marketing-before-they-sta
title: I think founders should start marketing before they start building.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voy6zq/i_think_founders_should_start_marketing_before/"
category: saas
date: "2026-08-15"
tags: [marketing, validation, mvp, founder]
tech: [Next.js 14, Markdown-driven blog, PostHog, Resend (email), SQLite via Drizzle]
---
# I think founders should start marketing before they start building.

## Tech Stack

- **Next.js 14 (App Router)** — single deployable that serves the research journal UI, the public landing page, and the weekly email opt-in.
- **SQLite via Drizzle ORM** — the journal is a single table per founder; no need for a managed DB at this scale.
- **Resend** — transactional email for the weekly digest; chosen because the API is the simplest stable one for this volume.
- **PostHog** — product analytics for the protocol; which weeks the founder actually completes, which checkpoints are skipped.
- **Markdown-driven blog** — the protocol itself is published as a public read so the tool also serves as a content-property for the founder to share when talking about the problem.

## Architecture

The founder signs up, gets a public journal URL, and a structured six-week protocol that is rendered as a checklist. Each week has a recommended action and a "log" form that appends to the journal. A cron job runs every Sunday, aggregates the week's logs, and sends a digest via Resend. The founder can also publish posts about the problem on X, Reddit, or LinkedIn and drop the public journal link in the post so that responses get linked back. PostHog captures which weeks the founder completes vs skips, which is metadata the founder can review at the week-6 decision. There is no AI narrating the founder's work; the digest is templated, not synthesised.

```
founder            Next.js app             Resend          PostHog
  |                     |                     |               |
  |---sign up---------->|                     |               |
  ||                     |               |
  |                     |---store--->SQLite   |               |
  |                     |---event----------------------->     |
  |                     |                     |               |
  | (Sunday cron)       |---digest template-->|---email------>|
  |                     |                     |               |
  |---week 6 decision-->|                     |               |
  |<--build/pivot/kill summary              |               |
```

## Milestones

- **M1 — Protocol document:** The six-week checklist in markdown, edited weekly with two outside founders during a private beta.
- **M2 — Journal app:** Log a conversation, log a post, log a response, view the journal. No email yet.
- **M3 — Weekly digest:** Cron + Resend wired up, with a test founder receiving the digest for three weeks to validate the timing.
- **M4 — Public share links:** Public journal page the founder can drop into a Reddit post; click logs the visit as a signal.
- **M5 — Week-6 decision flow:** A guided build/pivot/kill form that locks the journal after submission and produces a shareable summary.
- **M6 — Public launch:** Founder-facing landing page, an example journal (with a real founder's anonymised six weeks), and a one-page protocol the founder can print.

## Risks

- **Risk:** The protocol is too rigid; problems that take 12 months of quiet work get killed at week 6. **Mitigation:** Surface a "this is taking longer than six weeks" escape hatch after week 4 and let the founder mark the protocol as paused, not killed.
- **Risk:** The digest becomes nagging and the founder unsubscribes. **Mitigation:** Tone-test with five founders before launch; ask them to score each weekly email on a 1-5 "feels like a coach" scale.
- **Risk:** The MVP's "talk to people" advice is unscriptable and the founder stalls. **Mitigation:** Ship the prompt library in M1, not as a stretch goal.
- **Risk:** The journal app distracts from the real work (talking to people). **Mitigation:** Cap log time to under 5 minutes per entry, and explicitly call out in the protocol that the journal is the smallest possible surface.
- **Risk:** The product is so simple it looks like a Notion template and never gets traction. **Mitigation:** The weekly email is the moat — a Notion template cannot send a digest on a Sunday.
