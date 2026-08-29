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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An event photographer's phone becomes answerable again. Spam is filtered before it rings, real callers hear her own cloned voice rather than a robot, they get the price, the duration and what is included, and they leave the call with a date already in her iPhone calendar. She pays $6-10 only when a call becomes a booking — nothing in the winter months when almost nobody calls.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Event photographer (Viktoria) | Loses 20-30% of potential clients because three to five spam calls a day made the phone unusable, and the assistant she tried lost 99% of the callers it answered. |
| Solo service provider chosen for who they are | A wedding planner, a private tutor, a therapist: the caller is buying the person, so a faceless robot answering is worse than no answer. |
| Family planning a christening or wedding | Wants a human-sounding answer, a price, and a date, in one call, from the photographer they are considering trusting with an irreplaceable day. |
| The photographer's calendar | Currently the only source of truth about availability, and the thing an assistant cannot read — which is why message-taking created a second step instead of a booking. |

## Jobs To Be Done

1. **Functional job** — Turn an inbound call from an unknown number into either a filtered-out spam call or a shoot on the calendar, without picking up the phone.
2. **Emotional job** — End the daily attrition of ignoring the phone and knowing some of those rings were clients. Her own framing: the daily battle with spam.
3. **Social job** — Sound to a family planning an important event like a professional who answers her phone, not like a business hiding behind an answering machine.

## Success Metrics

- **Booking rate on answered client calls:** the direct counterpart to the 99% hang-up rate of the assistant she tried. If callers do not stay on the line, nothing else matters.
- **Recovered enquiries:** bookings from calls she would previously have let ring, measured against the 20-30% of clients she says she loses.
- **Spam pass-through:** share of the three to five daily spam calls that reach the conversation. Every one that gets through burns model cost and her trust in the filter.
- **Calendar accuracy:** double-bookings and offered-but-unavailable slots. One wrong slot offered to a wedding client costs more than the tool earns in a season.
- **Perceived-human rate:** share of callers who show no sign of realising they spoke to a clone, tracked from call transcripts. This is the product's actual differentiator and it can be measured.
- **Revenue per photographer per year:** at her volumes — five to ten calls a month in summer, one to two in winter — this lands in the low hundreds of dollars, which is the constraint the whole business model has to fit.

## Pricing & Monetization

She states it precisely: $6-10 per booked client (500-800 rubles), and explains why a subscription does not work for her — few clients in winter, many in summer, so pay-per-result is the ideal model for her business. That is the model, and it inverts the usual SaaS economics: the platform carries the cost of every filtered spam call and every unconverted conversation, and only earns on the confirmed booking. The gross margin per booking has to absorb telephony, speech recognition, model turns and voice synthesis for all the calls that earned nothing.

## Competitive Landscape

What she has tried, and what she does instead, is the whole landscape as stated:

- **Standard voice assistants** — answer and offer to take a message. Clients will not talk to them: it sounds like a robot, does not inspire trust, cannot answer simple questions and certainly cannot book a shoot. 99% hung up and did not call back.
- **Ignoring unknown numbers** — her current strategy. Blocks the spam, loses the 20-30% of clients who prefer the phone.
- **Answering manually** — checking each call for spam costs time and nerves; after three to five spam calls in a row she stops picking up. The behaviour is not a preference, it is exhaustion.
- **Carrier spam filters** — reduce nuisance volume, but they do not answer a client's questions or book a date, which is the half of the problem that costs her money.

## Risks & Open Questions

- [ ] Decide the disclosure position for a cloned voice speaking to third parties. Legally and ethically it is the central question, and disclosure may reintroduce the distrust the clone exists to eliminate — which is a product decision she has to make, not a default to pick silently.
- [ ] Establish whether latency can stay inside conversational range across streaming speech-to-text, model turn and voice synthesis. A warm voice with a two-second pause reads as a machine.
- [ ] Confirm a reliable iPhone calendar path. Apple has no server-side calendar API, so free/busy accuracy rests on CalDAV or a companion app, and an offered-then-unavailable slot is a worse failure than a missed call.
- [ ] Cost out the model: at $6-10 per booking with three to five spam calls a day per user and a few dozen bookings a year, the unpaid call volume may exceed the paid one by two orders of magnitude.
- [ ] Define what counts as a booked client for billing, and what happens when the caller cancels. Pay-per-result needs an unambiguous result.
- [ ] Russian-language dialogue including religious ceremony vocabulary is a baseline requirement; validate voice-clone quality and recognition accuracy in Russian before assuming an English-first pipeline transfers.
- [ ] The author wants 1% equity in the startup that builds this and offers direct feedback. Settle that before treating her as the design partner she is well placed to be.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/marketing/rlr11kl8y1-photographer-loses-2030-of-clients-to-sp) · **Category:** marketing · **Tags:** Marketing,AI,Freelance,Business,Other
