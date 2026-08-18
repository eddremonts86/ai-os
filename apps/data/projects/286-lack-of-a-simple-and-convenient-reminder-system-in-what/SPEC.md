---
id: "286"
slug: lack-of-a-simple-and-convenient-reminder-system-in-what
title: Lack of a simple and convenient reminder system in WhatsApp
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/0bwf3l7wh1-lack-of-a-simple-and-convenient-reminder-sy"
category: productivity
date: "2025-10-29"
tags: [Productivity, Communication]
country: UAE
tech: [Node.js API (Fastify), TypeScript, Postgres, WhatsApp Business Cloud API, BullMQ (Redis), Hetzner]
---
# Lack of a simple and convenient reminder system in WhatsApp

## Problem

People in the UAE already live on WhatsApp for both work and personal communication, but the reminder tools available to them — phone calendars, generic to-do apps — sit outside WhatsApp and require a context switch. The title is simple: there is no lightweight way to set a reminder from inside WhatsApp and have it ping back in WhatsApp at the right time, in Arabic or English. Users either forget, paste a reminder into a chat that scrolls away, or use an app they open once and never again.

## Objective

Ship a WhatsApp-native reminder service that lets a UAE user set a one-shot, recurring, or location-triggered reminder by sending a short message to a business number, and receive the reminder back in the same WhatsApp thread, in Arabic or English. Reduce the number of 'I forgot' moments for the user without making them install another app.

## Target Users

UAE residents (mixed nationalities, Arabic and English primary languages) who already use WhatsApp as their default messaging surface. Small business owners who want reminders for invoice due dates, contract renewals, visa expirations, trade licence renewals. Households coordinating school pickup, maintenance visits, and bill payments.

## MVP Scope

WhatsApp Business Cloud API integration with a single verified business number. Inbound message parser that understands English and Arabic reminder phrasings: 'remind me tomorrow at 9am to call the accountant', 'ذكرني بعد ساعة بإصلاح التكييف'. One-shot, daily, weekly, and monthly recurring reminders. Location-triggered reminders via WhatsApp's location share. Cron-based delivery via BullMQ workers. Web dashboard at wa.[product].ae for the user to see and cancel upcoming reminders. Per-user timezone stored on first interaction (Gulf Standard default).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/productivity/0bwf3l7wh1-lack-of-a-simple-and-convenie` follows the constraints in `286-.../SPEC.md` and the chosen stack (Node.js API (Fastify), TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in UAE.

For UAE, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

WhatsApp Business API templates must be pre-approved for outbound reminders; v1 uses only utility templates, not marketing. Free-form chat reminders work in the 24-hour session window after a user-initiated message; otherwise the system falls back to a template. Must not store message bodies beyond what is needed to deliver the reminder. Bilingual UX in Arabic and English; right-to-left layout in Arabic.
