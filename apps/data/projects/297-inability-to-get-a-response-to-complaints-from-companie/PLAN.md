---
id: "297"
slug: inability-to-get-a-response-to-complaints-from-companie
title: Inability to get a response to complaints from companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/avqi69p261-inability-to-get-a-response-to-complaints-from-"
category: legal
date: "2025-10-29"
tags: [Legal, Consumer, Communication]
country: Argentina
tech: [Next.js 14, TypeScript, Postgres, MercadoPago, WhatsApp Business API, PRO Argentina consumer-protection API, Hetzner]
---
# Inability to get a response to complaints from companies

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the operator console and analytics dashboard.
- Postgres on Hetzner for complaint records, response timers, escalation logs.
- WhatsApp Business Cloud API for the bot.
- PRO Argentina superintendo form auto-fill (HTML scraping or partner API where available).
- OpenAI API for sector-specific email draft generation.
- Cloudflare for ingress and rate limit.
- Sentry + Logtail for monitoring.

## Architecture

WhatsApp bot is the primary surface. Bot state machine: collect motive + company + evidence → generate sector-specific email draft → user confirms → send via platform email relay → start 10-business-day timer → daily status check → on miss, surface escalation CTA → user confirms → pre-fill regulator form. Operator console shows aggregated case-load, response rates per company, and PRO hand-off status.

## Milestones

1. **M0** — Spec freeze, WhatsApp bot, single sector (telecom/ENACOM). End of week 1.
2. **M1** — Email relay + 10-business-day timer + sector-specific email templates. End of week 4.
3. **M2** — Multi-sector templates (bank, retail, utility, airline, delivery). End of week 7.
4. **M3** — PRO Argentina escalation: pre-filled forms for the top 5 superintendOS. End of week 10.
5. **M4** — Operator analytics dashboard + aggregate feedback to PRO Argentina. End of week 14.

## Risks

- **Sector template accuracy** — Mitigation: legal-reviewed templates; consumer-protection lawyer on retainer for first 90 days.
- **Email deliverability** — Mitigation: SPF + DKIM + DMARC for the platform relay domain; monitored bounce rate.
- **PRO Argentina portal changes** — Mitigation: weekly canary scrape; pre-filled form tested end-to-end with mock data.
