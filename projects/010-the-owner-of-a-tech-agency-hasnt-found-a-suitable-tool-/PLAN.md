---
id: "010"
slug: the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-
title: "The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/24mf80ltt1-the-owner-of-a-tech-agency-hasnt-found-a"
  captured: "2026-07-17"
category: business
date: "2026-07-17"
tags: [Business, Dev, Productivity, No-Code, Other]
country: Colombia
wtp:
  raw: "$100/month"
  currency: USD
  min: 100
  max: 100
  period: month
  mrrMid: 100
tech: [Next.js, Postgres, Porkbun API, UptimeRobot API, Resend]
---

# The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month.

## Tech Stack

- **Frontend:** Next.js 14 with a single-pane dashboard layout.
- **Database:** Postgres on Neon; per-agency tenant schema.
- **Integrations (read-only):** Porkbun API + Namecheap API + GoDaddy API for domains; Linear API + Asana API for projects; UptimeRobot API + BetterStack API for monitoring.
- **Notifications:** Resend for email; SMS optional via Twilio.
- **Proposal PDFs:** Puppeteer on a Node serverless function with per-agency branding.

## Architecture

A self-contained integration diagram lives at [`assets/agency-single-pane-integration.html`](assets/agency-single-pane-integration.html) (open in any browser; SVG rendered inline, no server required).

A daily cron pulls the current state from each integration into a per-agency view; the dashboard queries only the local snapshot so the agency owner never waits on a third-party API. Proposal generation renders a template with the agency's branding into a PDF via Puppeteer and ships it via email with a tracking pixel.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + first agency partner. End of week 2.
2. **M1 — Client list + domain renewals.** Porkbun integration, expiry warnings, renewal reminders. End of week 6.
3. **M2 — Project + monitoring integrations.** Linear / Asana + UptimeRobot / BetterStack. End of week 10.
4. **M3 — Proposal engine + PDF.** Template editor, PDF render, send + tracking. End of week 14.
5. **M4 — 30-agency pilot.** 30 LATAM agencies across the $100–$200 plans. End of week 22.

## Risks

- **Third-party API rate limits** — pulling from 4 APIs per agency per day is fine at 30 agencies; at 1,000 it may not be. Cron batched by agency, with exponential backoff per failure.
- **Proposal PDF quality** — agencies are picky; the first 10 PDFs must look indistinguishable from a hand-crafted proposal. Puppeteer + per-agency branding is the floor; v2 may use LaTeX.
- **Read-only integration model** — some agencies will ask "why can't you update Linear from here?" The answer is intentional (lower trust burden), but the FAQ must be loud.