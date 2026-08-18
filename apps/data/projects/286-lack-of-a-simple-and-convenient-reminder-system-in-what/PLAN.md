---
id: "286"
slug: lack-of-a-simple-and-convenient-reminder-system-in-what
title: Lack of a simple and convenient reminder system in WhatsApp
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/0bwf3l7wh1-lack-of-a-simple-and-convenient-reminder-sy"
category: productivity
date: "2025-10-29"
tags: [Productivity, Communication]
country: UAE
tech: [Node.js API (Fastify), TypeScript, Postgres, WhatsApp Business Cloud API, BullMQ (Redis), Hetzner]
---
# Lack of a simple and convenient reminder system in WhatsApp

## Tech Stack

- Node.js Fastify API in TypeScript for inbound webhook and outbound delivery.
- Postgres on Hetzner for users, reminders, delivery attempts, audit log.
- WhatsApp Business Cloud API for the verified business number + template messages.
- BullMQ on Redis (Hetzner) for cron-style reminder delivery and retry.
- Next.js dashboard for the wa.[product].ae web view (manage, cancel, recurring).
- Cloudflare for the webhook ingress and rate limit.
- OpenAI gpt-4o-mini for inbound message parsing fallback when regex is ambiguous (Arabic + English).

## Architecture

Single Fastify service exposes one webhook for WhatsApp Cloud. Inbound messages hit a parser that uses regex first for common phrasings (English + Arabic) and falls back to an LLM call only when confidence is low. Parsed reminders go to a BullMQ delayed job that fires at the right time, looks up the user's preferred language and timezone, and calls the WhatsApp send API with a pre-approved utility template. The web dashboard is a thin Next.js app over the same API.

## Milestones

1. **M0** — Spec freeze, WhatsApp Business number verification, English-only one-shot reminders. End of week 1.
2. **M1** — Arabic parsing, recurring (daily/weekly/monthly) reminders. End of week 3.
3. **M2** — Location-triggered reminders, web dashboard MVP. End of week 5.
4. **M3** — Pro tier billing via Stripe (AED 19/month), family plan. End of week 8.
5. **M4** — Launch in UAE with marketing to Arabic WhatsApp groups and small business owners. End of week 12.

## Risks

- **WhatsApp template rejection** — Mitigation: start with the most generic utility template; iterate on wording once approved.
- **LLM parsing cost on ambiguous inputs** — Mitigation: cache parsed intents per user; only re-call on truly new phrasings.
- **Abuse via spam-like patterns** — Mitigation: per-user rate limit (max 100 reminders/day); manual review at higher tiers.
