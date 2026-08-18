---
id: "218"
slug: photographer-loses-2030-of-clients-to-spam-needs-an-ai-
title: "Photographer loses 20–30% of clients to spam — needs an AI clone with a copy of her voice to answer and book or deflect."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-03"
tags: [AI, Voice, Photography]
country: Russia
tech: [Python, FastAPI, Twilio, ElevenLabs, PostgreSQL, Cal.com]
---
# Photographer loses 20–30% of clients to spam — needs an AI clone with a copy of her voice to answer and book or deflect.

## Tech Stack

Python + FastAPI for the orchestration. Twilio for the telephony. ElevenLabs for the voice cloning with a custom-voice model. PostgreSQL for the call and qualification data. Cal.com for the booking. SMS follow-up via Twilio. Russian-language prompt set.

## Architecture

Inbound call → Twilio → ElevenLabs voice agent → qualification script → booking or deflection → SMS follow-up. Voice clone trained per photographer. Spam detection via caller ID reputation and short keyword check. Dashboard per photographer with the call log.

## Milestones

M0 — voice clone training fine-tuned for Russian. M1 — Twilio integration with qualification script. M2 — booking into Cal.com. M3 — 20 photographers in pilot. M4 — public launch with a clear 'AI answering service' stance.

## Risks

Voice clone may sound robotic on certain callers. Spam pattern detection may misclassify a real client. Russian-language fine-tuning of the voice clone may be limited. Pricing discussion must not auto-commit to a number the photographer has not set.

## Data Model

## Integrations

Python + FastAPI for the orchestration. Twilio for the telephony. ElevenLabs for the voice cloning with a custom-voice model. PostgreSQL for the call and qualification data. Cal.com for the booking. SMS follow-up via Twilio. Russian-language prompt set.
