---
id: "662"
slug: trying-to-automate-lead-generation-but-everything-autom
title: trying to automate lead generation but everything automated feels spammy?i will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp4cvt/trying_to_automate_lead_generation_but_everything/"
category: startups
date: "2026-08-15"
tags: [outbound, deliverability, cold-email, b2b]
tech: [Next.js 14, Postgres + Drizzle, Prospeo API, Resend, Cloudflare DNS]
---
# trying to automate lead generation but everything automated feels spammy?i will not promote

## Tech Stack

- **Next.js 14 (App Router)** — the three-panel workspace, the deliverability dashboard, and the warm-up plan tracker all live in one deployable that the founder opens every morning.
- **Postgres + Drizzle** — the canonical store for contacts, sent emails, replies, and the "do not email again" list; the relational integrity is what makes the workspace trustworthy for both daily send and audit.
- **Prospeo API** — verified contact list source the poster is already using; the MVP wraps Prospeo rather than competing with it.
- **Resend** — threaded sending through the sender's warmed-up domain; chosen for its deliverability primitives and webhook-driven reply ingestion.
- **Cloudflare DNS** — the sending domain's SPF/DKIM/DMARC records are managed and validated through the product, so the deliverability dashboard is real, not aspirational.

## Architecture

The workspace is a Next.js app with three panels: an import panel that runs a Prospeo query and lands the contacts in a Postgres table, a brief panel that generates a per-contact briefing from the public record and the verified contact data, and a composer panel that lets the sender write (or rewrite) the email body before sending through Resend on the warmed-up domain. A cron job runs every hour to ingest Resend webhooks (bounces, replies, out-of-office), classify replies, and surface the "interested" bucket to the sender's inbox. The deliverability dashboard reads from the same Postgres tables plus Cloudflare DNS to render the per-domain reputation and the SPF/DKIM/DMARC status. The "do not email again" list is enforced at the import level so the sender cannot accidentally re-import a known contact.

```
sender                Next.js workspace         Prospeo         Resend          Cloudflare
  |                       |                       |               |               |
  |---import query------->|----API call---------->|               |               |
  ||                       |               |               |
  |                       |                       |               |               |
  |---writes email------->|                       |               |               |
  |---hits send---------->|                       |               |               |
  |                       |---SMTP via warmed-->|               |               |
  |                       |                       |               |               |
  | (hourly cron)         ||               |               |
  |                       |                       |               |               |
  |---reads reputation--->|                       |               |               |
  |                       |---DNS check-------------------------------->|               |
  |                       |                       |               |               |
```

## Milestones

- **M1 — Three-panel workspace:** Import, brief, composer; the no-auto-send design is enforced at the UI level so it cannot be bypassed.
- **M2 — Prospeo integration:** Verified contact import, with a "do not email again" check at ingest.
- **M3 — Deliverability dashboard:** Domain reputation, SPF/DKIM/DMARC status, send volume, bounce rate, and a 5% tripwire that halts sending.
- **M4 — Warm-up plan:** A 7-day plan (10 emails per day to known contacts) tracked in the workspace, with reputation snapshots at the end of each day.
- **M5 — Reply classifier:** Resend webhook ingestion, classification into "interested / not now / not interested / out of office", and the "interested" surfaced to the sender's inbox.
- **M6 — Public case study:** Document the founder's pre-product reply rate (2% automated / 8-10% manual) and the post-product reply rate after 30 days, with the per-campaign scorecard.

## Risks

- **Risk:** The "no auto-send" stance is seen as a feature gap by users who want automation. **Mitigation:** The composer is the loudest design element; the product is upfront about the trade-off.
- **Risk:** The per-contact brief is too thin and the sender still spends 18 minutes of research. **Mitigation:** Ship the brief with three tiers (light, standard, deep) and let the sender choose how much they want; track time per email.
- **Risk:** The 5% bounce tripwire is too strict for new sending domains. **Mitigation:** The tripwire is calibrated by domain age; new domains are allowed up to 8% for the first 14 days.
- **Risk:** Resend's deliverability is not a substitute for the sender's own domain warm-up. **Mitigation:** The product explicitly tells the sender that warm-up is their job and tracks the result.
- **Risk:** The product is wrapped around Prospeo and looks like a thin wrapper itself. **Mitigation:** The workspace's value is the brief, the deliverability tripwire, and the reply classifier — not the list source.
