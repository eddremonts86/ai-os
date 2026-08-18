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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A UAE resident sets a reminder by texting a WhatsApp number and forgets about it — the reminder comes back in the same thread at the right time, in the same language.

## Target Users

| Stakeholder | Why they care |
|---|---|
| UAE resident (Arabic or English) | Already lives on WhatsApp; will not adopt a separate reminders app. |
| UAE small business owner | Needs reminders for licence renewal, VAT filings, customer follow-ups without hiring an assistant. |
| UAE household | Coordinates school pickup, maintenance, family events across multiple WhatsApp groups. |

## Jobs To Be Done

1. **Functional job** — Be reminded at the right time, in the channel already open, without opening a new app.
2. **Emotional job** — Trust that the reminder will fire even if the phone is on silent or Do Not Disturb.
3. **Social job** — Set a reminder for someone else in the family chat and have it land in their WhatsApp, not the user's.

## Success Metrics

- Reminder delivery success rate ≥ 99% (WhatsApp template accepted + phone delivered).
- Reminder set latency ≤ 5 seconds from inbound message to confirmation.
- Weekly active reminder users — ≥ 60% of users who set one reminder set a second within 7 days.
- Bilingual usage — ≥ 30% of reminders set in Arabic (matching the UAE demographic baseline).

## Pricing & Monetization

Free tier: 10 active reminders per user. Pro tier (AED 19/month): unlimited reminders, recurring reminders, location triggers, multi-user family plan.

## Competitive Landscape

- Google Assistant / Siri — voice and OS-level, but no WhatsApp delivery surface.
- Todoist / TickTick / Any.do — standalone apps, no WhatsApp delivery, weak Arabic support.
- WhatsApp Business broadcast tools (WATI, AiSensy) — outbound-first, no inbound reminder parsing.

## Risks & Open Questions

- [ ] WhatsApp policy changes — Meta can tighten 24-hour session rules or template approval. Mitigation: keep the use case narrow (utility, not marketing); monitor policy announcements weekly.
- [ ] Phone-number-as-identity abuse — someone could set reminders on another user's number. Mitigation: confirmation ping on first reminder set; account binding to the wa.me dashboard.
- [ ] Timezone drift — UAE does not use DST, but users travel. Mitigation: store the reminder in a fixed timezone (Asia/Dubai) and re-confirm on every delivery.

---

_Source:_ [manual](https://problemhunt.pro/en/productivity/0bwf3l7wh1-lack-of-a-simple-and-convenient-reminder-sy) · **Category:** productivity · **Tags:** Productivity, Communication
