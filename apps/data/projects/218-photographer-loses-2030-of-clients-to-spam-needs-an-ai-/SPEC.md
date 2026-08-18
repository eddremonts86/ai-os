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

## Problem

A photographer in Russia loses 20–30% of inbound bookings to spam and missed calls. The same bot-style spam hits the phone line with pricing questions and tyre-kickers that the photographer is too busy shooting to handle. A simple answering machine is not enough because real clients want a real conversation before they book. What is missing is a voice clone of the photographer that can answer the phone, qualify the inquiry (date, venue, package), and either book a follow-up or politely deflect spam — in the photographer's actual voice, so the client feels respected and the photographer does not lose the lead. None of the existing inbound call services (Ruby, Smith.ai) offer a voice clone trained on the actual freelancer's voice.

## Objective

A service that gives a Russian photographer a voice clone of herself answering the phone, qualifying the inquiry, and either booking a discovery call or deflecting spam based on a short script the photographer controls.

## Target Users

Solo wedding and event photographers in Russia and the CIS who lose leads to missed calls and spam. Secondarily: solo videographers, makeup artists, and small studio owners with the same pattern.

## MVP Scope

Voice-clone training (10 minutes of the photographer's voice). Twilio-based call answering. Qualifying script (date, venue, package, budget). Spam deflection (caller ID reputation, simple keyword check). Booking into a calendar (Cal.com or similar). Missed-call SMS follow-up. Russian-language UI.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `218-.../SPEC.md` and the chosen stack (Python, FastAPI, Twilio). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Voice clone must be trained on the photographer's explicit consent. Calls must not be recorded without disclosure. The clone must clearly identify itself as an AI on request. Russian-language fluency required. No autonomous commitment to a price — only a discovery call.
