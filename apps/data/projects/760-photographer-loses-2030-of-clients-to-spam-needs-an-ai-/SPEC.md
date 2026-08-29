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

## Problem

Viktoria is a commercial photographer with eight years of experience shooting christenings, church weddings, birthdays and newborn hospital discharges. About 20-30% of her potential clients prefer to reach her by phone — five to ten calls a month in the summer high season, one to two in winter. She does not answer. Over the last three to four years spam calls have grown to three to five a day, so she stopped picking up unknown numbers; that stops the spam and cuts off real clients at the same time. She already tried the obvious fix and it failed: a voice assistant that answered and asked what message to pass on. Her clients would not talk to it. They are planning an important life event and need to hear a real person, because the decision is about trust — in 99% of cases they hung up after speaking with the assistant and never called back. She adds that she is an introvert and finds phone calls harder than texting, but is explicit that this is not the main issue: she is willing to talk to clients. The problem is spam, and the absence of a tool that filters calls without scaring away the real people.

## Objective

Answer Viktoria's phone in a cloned copy of her own voice, warm enough that a client planning a christening stays on the line, filter the three to five daily spam calls out before they reach her, answer the basic questions about price, duration and what is included, and write the confirmed booking straight into her iPhone calendar — charged per booked client, not per month.

## Target Users

- Primary: Viktoria herself and photographers like her — event photographers whose bookings come from trust, who lose a fifth to a third of enquiries because the phone has become unanswerable.
- Secondary: solo service providers in the same shape, where the buyer chooses the person and not the service, so a generic robot receptionist loses the booking it answers.
- Tertiary: the callers — families organising a christening, a wedding or a newborn discharge, who want a time, a price and reassurance in one call.

## MVP Scope

- Voice clone of the photographer, built from her own recordings, warm and natural rather than a synthesised assistant voice. This is the entire premise: the client should believe they are speaking with her.
- Spam filtering ahead of the conversation, so the three to five nuisance calls a day never become a booking attempt or a notification.
- Answers to the basic questions she names: cost of the shoot, duration, and what is included in the service, from her own answers rather than generated copy.
- Read access to her iPhone calendar to see genuinely free dates, offer one, and hold it during the call.
- Automatic event creation in the calendar once the caller confirms.
- A record of every answered call for her review: who called, what was asked, what was offered, what was booked.
- Pay-per-result billing: a charge only when a call becomes a booked shoot.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Pay-per-result is a stated requirement, not a preference. She says a monthly subscription is not beneficial because winter brings one to two calls and summer brings five to ten, and that $6-10 per booked client (500-800 rubles) is the ideal model. Any subscription pricing rebuilds the product she rejected.
- Her seasonality caps total revenue per photographer: at ten summer calls and two winter calls, a year holds a few dozen bookings, so unit economics have to work on tens of transactions per user per year, not hundreds.
- The failure mode is already documented. A voice assistant that asks to take a message loses 99% of callers. The bar is not "handles the call" but "does not sound like the thing that lost her the clients".
- A cloned voice used to speak to third parties without their knowledge is legally and ethically loaded. Consent for the clone comes from her; disclosure to the caller is the open design question, and disclosing it may reintroduce the exact distrust the clone exists to avoid.
- iPhone calendar integration means CalDAV or a companion app — Apple offers no server-side calendar API, so free/busy accuracy depends on a sync path that can be slow or fragile.
- Latency is a trust signal. A warm voice with a two-second pause before every reply reads as a machine, which puts a hard budget on the speech-to-text, model and speech-synthesis round trip.
- Russian-language conversation, including names of religious ceremonies and event types, is the baseline requirement rather than an internationalisation task.

## Out of Scope

- A message-taking assistant of any kind. That is the solution she already tried and it failed.
- Outbound calling or lead chasing. The problem is inbound calls she cannot answer.
- Payment collection during the call. She asked for a booked date, not a deposit.
