---
id: "781"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [Retail, AI, Business, Other]
country: Russia
tech: [Python, FastAPI, CLIP, OpenCLIP, Qdrant, PostgreSQL, Redis, Telegram Bot API, Next.js, Tailwind CSS, Docker]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.

## Problem

The capture is a one-line problem statement: a user spends hours manually searching for parts for Chinese cars, and wants an AI agent that understands queries from photos or text and finds the part. The title is the entire ground truth; the only other metadata is `country: Russia`.

The actor is implicit but consistent: someone who works on Chinese-brand cars (Chery, Haval, Geely and the rest of the post-2015 import wave that the country tag makes plausible), or someone who helps them, and who currently has no shortcut through the manual hunt. The pain is the time cost, named explicitly as "hours of manual searching". The missing thing is an AI agent — note the choice of "agent" rather than "search engine" — that accepts either a photo of the part or a text description and returns the part.

The capture names no specific car brand, no specific part type, no specific supplier and no specific region within Russia. The honest reading of the source is that the user wants one assistant that takes whatever they have (a snapped photo of the broken part, or a half-remembered text description) and narrows the search from "hours of guessing" to "a short list of candidates". The Russian-language tooling implication follows from the country tag and the Chinese-car context but is not stated in the body, so the architecture has to support Russian without inventing facts the post does not supply.

## Objective

Ship a parts-search agent that accepts a photo of an automotive part or a free-text description and returns a short, ranked list of candidate parts for Chinese-brand cars, with enough metadata for the user to act (part number, fitment range, supplier, price band). The unit of success is one user query that used to take hours now returning a small set of candidates in seconds.

## Target Users

- Independent mechanics and small workshops who service Chinese-brand cars and currently rely on phone calls and part catalogues they search by hand.
- Car owners who do their own basic repairs and want to identify a part before they order it.
- Parts suppliers and aggregators who want a faster intake path than a phone call from every customer.
- Fleet managers running a small fleet of Chinese-brand vehicles who need a faster parts identification across multiple units.

## MVP Scope

- A photo query that accepts a phone-camera image and uses CLIP / OpenCLIP to embed the part photo, then retrieves visually similar part images from a curated catalogue.
- A text query that accepts Russian or English free-text descriptions and embeds them with the same model, so a text query and a photo query land in the same vector space.
- A small Russian-language catalogue that maps a part identity (brand, model range, year range, part number, supplier) onto the visual and text embeddings.
- A FastAPI backend that takes either input type, runs the vector search against Qdrant, and returns a ranked short list of candidates with the metadata the user needs to act.
- A Telegram bot as the primary surface, because the post's user is more likely to snap a photo on the phone than to open a laptop, and Telegram is the operating channel of the audience the country tag implies.
- A web surface for catalogue curation and supplier onboarding, where a parts supplier can upload new part photos, attach metadata and watch the catalogue grow.
- A confidence signal on every result so the user can tell when the agent is sure versus when the top candidate is a guess.
- A small feedback loop so a user who accepts or rejects a candidate improves the next ranking without requiring a full training run.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The agent must answer in seconds; an hour of waiting defeats the "hours of manual searching" promise.
- The photo path must work on a phone-camera image with imperfect framing and lighting, not just on a clean product photo.
- The text path must accept Russian without forcing the user to transliterate; the catalogue must carry Russian metadata, not only English.
- The result must always carry the part number and the fitment range the user can hand to a supplier; the visual similarity alone is not enough.
- The catalogue must be honest about coverage: a model the agent has never seen should be reported as a guess, not a confident match.
- The feedback loop must not poison the ranking: a noisy "reject" from one user should not wipe out a candidate for everyone.
- The Telegram bot must work on the worst Russian 3G: a small image, a fast round-trip and a graceful fallback when the photo upload stalls.
