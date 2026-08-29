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

## Tech Stack

- **Twilio programmable voice:** inbound call control with media streams, so audio can be processed in real time rather than recorded and replayed. Her published number forwards in; she keeps the number that eight years of referrals point at.
- **ElevenLabs voice cloning:** the product is her voice, not a voice. Low-latency streaming synthesis from a clone trained on her own recordings, in Russian, is the single component that decides whether callers stay on the line.
- **Streaming speech-to-text with Russian as the primary model:** partial transcripts as the caller speaks, so the response can begin forming before they finish. Batch transcription would add the pause that makes a clone sound synthetic.
- **LLM dialogue orchestration with a hard script boundary:** the model handles conversational phrasing; a state machine owns what may be said. Price, duration and inclusions come from her stored answers, and slot offers come from the calendar — never from generation.
- **CalDAV sync to her iPhone calendar:** Apple offers no server-side calendar API, so free/busy comes through CalDAV with a local cache and a short refresh, plus a hold on any slot offered during a live call.
- **Postgres:** call records, transcripts, spam decisions, offered and held slots, bookings, and the billing ledger that pay-per-result requires.

## Architecture

The call passes through three gates and only the last one costs real money. Gate one is **spam screening**, and it runs before any audio reaches a model: number reputation, calling patterns, and a short challenge for unknown numbers. Three to five nuisance calls a day per user means this gate carries most of the traffic, so it has to be cheap and stay cheap.

Gate two is the **conversation**. Twilio streams audio in; streaming speech-to-text produces partial transcripts; the dialogue state machine decides what stage the call is in (greeting, question, availability, confirmation); the model phrases the next line within that stage; the cloned voice speaks it. Latency budget is the design constraint throughout — a warm voice that pauses two seconds before each reply is a robot with better timbre, and a robot is exactly what lost her 99% of callers.

Gate three is the **booking**. The calendar cache offers a genuinely free slot, holds it for the duration of the call, and writes the event on the caller's confirmation. The hold matters because two summer callers can be on the line within the same hour, and offering the same Saturday twice would be the failure that costs a wedding.

After the call, everything is logged for her review: who called, what was asked, what was offered, what was booked. The billing ledger records a chargeable result only on a confirmed booking, which is why every spam call and every unconverted conversation is a platform cost by design.

## Milestones

1. **M0 — Voice and latency proof.** Clone her voice in Russian, measure the full round trip from caller speech to spoken reply, and decide whether the pipeline can be conversational at all. If it cannot, nothing later is worth building. End of week 3.
2. **M1 — Spam gate.** Number reputation and challenge screening against a real week of her inbound traffic, with the pass-through rate measured. End of week 5.
3. **M2 — Scripted conversation.** Greeting, the three questions she names (cost, duration, inclusions) answered from her own stored wording, graceful handoff to a callback when the caller goes off-script. End of week 8.
4. **M3 — Calendar.** CalDAV read, free-slot offer, in-call hold, event creation on confirmation, and double-booking prevention verified under two concurrent calls. End of week 10.
5. **M4 — Disclosure decision and call log.** Her chosen disclosure position implemented, plus the reviewable record of every answered call. End of week 12.
6. **M5 — Pay-per-result billing.** Booking-triggered charge at $6-10, with the cancellation rule agreed and the per-booking cost of all non-converting traffic measured. End of week 14.
7. **M6 — Summer season pilot.** Run through her high season, five to ten calls a month, tracking booking rate and perceived-human rate. End of week 22.

## Risks

- **The clone may not clear the bar that failed before.** She reports 99% of callers hung up on a standard assistant because it did not inspire trust. A cloned voice raises the ceiling but the bar is a family deciding who photographs their child's christening. If callers still disengage, the product has no fallback position — the whole thesis is that the voice is enough.
- **Disclosure and consent.** A synthetic copy of a real person's voice speaking to unwitting third parties sits in contested legal territory, and rules differ by jurisdiction. Disclosing it protects everyone and may destroy the effect; not disclosing it is a liability she carries. This has to be her decision, made explicitly.
- **Unit economics inverted.** Pay-per-result means the platform funds every spam call, every question-only call and every caller who does not book, and earns $6-10 when one does. At three to five spam calls a day and a few dozen bookings a year per photographer, the ratio of unpaid to paid work is the business risk, not a rounding error.
- **Seasonality against fixed costs.** A cloned voice, a phone number and a calendar sync cost something every month; her winter is one to two calls. Any per-user fixed cost has to survive months that generate no billable result at all.
- **Calendar as the weakest link.** No server-side Apple calendar API means free/busy is a synced approximation. A stale cache that offers a taken Saturday to a wedding client is worse than the missed call the product was built to prevent.
- **Latency is the tell.** Every added component — a longer prompt, a safety pass, a retrieval step — spends milliseconds against the illusion that makes the product work. This constrains how much the dialogue can be improved later.
- **Russian-language pipeline quality.** Voice cloning, speech recognition and event-type vocabulary all have to work in Russian, including terms for christenings, church weddings and newborn discharges. English-first tooling quality does not transfer automatically, and the whole product is an audio experience.
- **A brief from one photographer.** The specification is unusually precise because it comes from a single person who has thought hard about it. Nothing in the source establishes how many photographers share both the problem and the willingness to pay per booking.
