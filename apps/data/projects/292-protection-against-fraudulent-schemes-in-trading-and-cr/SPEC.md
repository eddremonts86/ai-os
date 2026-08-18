---
id: "292"
slug: protection-against-fraudulent-schemes-in-trading-and-cr
title: Protection against fraudulent schemes in trading and cryptocurrency investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/3ix68wvr71-protection-against-fraudulent-schemes-in-tra"
category: finance
date: "2025-10-29"
tags: [Finance, Security, AI]
country: Madagascar
tech: [Next.js 14, TypeScript, Postgres, Chainalysis / TRM Labs (txn risk), WhatsApp Business API, Orange Money / MVola payment APIs]
---
# Protection against fraudulent schemes in trading and cryptocurrency investments

## Problem

Madagascar residents are exposed to a wave of fraudulent trading and crypto investment schemes — fake brokers, social-media-coordinated pump-and-dumps, and 'guaranteed return' WhatsApp groups — that cost them money they cannot afford to lose. The title frames the gap as protection, not detection: there is no consumer-facing tool that flags a suspect scheme before money moves, or that helps recover funds after a transfer. Local regulators can warn, but the warnings do not reach the moment of decision in a WhatsApp chat.

## Objective

Ship a consumer protection layer for Malagasy users that flags suspect trading and crypto schemes in real time (during a WhatsApp conversation or before a payment) and provides a clear recovery pathway if a transfer has already happened. Outcome: a user pauses a payment or escalates a fraud report within minutes, with the local authority able to act.

## Target Users

Malagasy adults 20–55 active on WhatsApp and mobile money (Orange Money, MVola, Airtel Money). First-time crypto buyers approached via Telegram/WhatsApp 'mentorship' groups. Secondary: local authorities (BCMM, the central bank's AML unit) that want a consumer-side data source for early fraud signals.

## MVP Scope

WhatsApp bot that listens to messages in a user-authorised chat context (user forwards a suspicious offer) and returns a risk score based on scheme patterns (guaranteed returns, unlicensed broker, copy-trade pressure). Pre-payment check: user pastes a payment reference or wallet address; the bot flags it against a known-bad list and scheme-pattern database. Fraud report flow: user submits a fraud case with payment proof (Orange Money receipt screenshot); the case is queued to a partner legal-aid clinic and to the relevant authority. French + Malagasy language support.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/3ix68wvr71-protection-against-fraudulent-sche` follows the constraints in `292-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Madagascar.

For Madagascar, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

No integration with bank or mobile-money core rails in v1; the system only sees what the user pastes or forwards. Personal data handled under Madagascar's data protection law (Loi n° 2014-038) — explicit consent, 24-month retention max, right to erasure. Bot responses must be educational, not legal advice. French + Malagasy only in v1.
