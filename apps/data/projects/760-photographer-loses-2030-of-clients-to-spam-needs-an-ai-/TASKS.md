---
id: "760"
slug: photographer-loses-2030-of-clients-to-spam-needs-an-ai-
title: "Photographer loses 20–30% of clients to spam — needs an AI clone with a copy of her voice to answer calls and book sessions."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/rlr11kl8y1-photographer-loses-2030-of-clients-to-sp"
  captured: "2026-03-03"
category: marketing
date: "2026-03-03"
tags: [Marketing, AI, Freelance, Business, Other]
country: Russia
wtp:
  raw: "$6–10 per booked client (500–800 rubles), pay-per-result"
  currency: USD
  min: 6
  max: 10
  period: one-shot
tech: [Twilio programmable voice, ElevenLabs voice cloning, streaming speech-to-text, LLM dialogue orchestration, CalDAV iPhone calendar sync, Postgres]
---
# Photographer loses 20–30% of clients to spam — needs an AI clone with a copy of her voice to answer calls and book sessions.

## Phase 0: Scaffold

- [x] Capture the problem, the failed assistant attempt and the pay-per-result price from ProblemHunt
- [ ] Twilio number and media-stream pipeline with call forwarding from her published number
- [ ] Postgres schema: calls, transcripts, spam decisions, slot holds, bookings, billing ledger
- [ ] Collect her voice recordings and her own wording for price, duration and inclusions
- [ ] Write DESIGN.md (call log, booking review, settings — a mobile-first surface she checks between shoots)
- [ ] Settle the voice-clone consent record and the disclosure position with her

## Phase 1: Core

- [ ] Russian voice clone with streaming synthesis, quality-reviewed by her before any live call
- [ ] End-to-end latency measurement from caller speech to spoken reply, with a budget per component
- [ ] Streaming Russian speech-to-text with partial transcripts driving early response formation
- [ ] Spam gate: number reputation, pattern checks and a challenge for unknown numbers, before any model call
- [ ] Spam pass-through measured against a real week of her inbound traffic
- [ ] Dialogue state machine owning call stages, with the model phrasing lines inside a stage only
- [ ] Answers to cost, duration and inclusions served from her stored wording, never generated
- [ ] Off-script handling: graceful, human-sounding fallback to a callback rather than an invented answer
- [ ] CalDAV read of her iPhone calendar with a short-refresh cache
- [ ] In-call slot hold so two concurrent summer callers cannot be offered the same Saturday
- [ ] Event creation in her calendar on caller confirmation
- [ ] Call log for her review: caller, questions asked, slot offered, outcome
- [ ] Chosen disclosure implemented in the call flow
- [ ] Pay-per-result billing at $6–10 per confirmed booking, with the cancellation rule defined
- [ ] Cost per booking including all non-converting traffic, reported per month

## Phase 2: Deploy

- [ ] Live on her real number ahead of the summer high season
- [ ] Track booking rate on answered client calls and perceived-human rate from transcripts
- [ ] Review a full high season, five to ten calls a month, against the 20–30% she was losing
- [ ] Verify in production
