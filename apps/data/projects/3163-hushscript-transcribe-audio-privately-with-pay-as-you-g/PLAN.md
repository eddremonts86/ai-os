---
id: "3163"
slug: hushscript-transcribe-audio-privately-with-pay-as-you-g
title: Hushscript – Transcribe audio privately with pay-as-you-go pricing and speaker labels
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/hushscript?utm_campaign=startup-184394&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [Web app, transcription API, encryption-at-rest, prepaid credits]
---
# Hushscript – Transcribe audio privately with pay-as-you-go pricing and speaker labels

## Tech Stack

A web app on the client (so video can stay on-device per the source) talking to a transcription API. Transcripts are stored encrypted at rest with retention controls, behind an account model that holds prepaid minute packs valid for a year. AI insights, speaker identification, 99-language translation, and 21 export formats are server-side features layered on top of the core transcription pipeline.

## Architecture

The web client uploads audio (video stays local), the server runs transcription with speaker labels, AI insights and optional translation, then stores the resulting transcript encrypted with a per-user retention setting. A minute-pack ledger tracks prepaid minutes and their one-year expiry. Audio is purged after processing per the source's privacy commitment; only the encrypted transcript survives.

## Milestones

- Transcription pipeline that completes a job, then purges the source audio as promised.
- Minute-pack ledger with one-year validity enforced at purchase and at use.
- Encrypted transcript storage with a user-visible retention control.
- Speaker identification, AI insights, cleanup tools, 99-language translation, and 21 export formats wired end-to-end.
- 5-minute free preview path that does not consume paid minutes.

## Risks

The privacy promises are explicit commitments — any path that retains audio past processing, or leaks transcript keys, kills the product. The minute-pack ledger has to be exact; rounding errors or missed expiries are direct user-visible bugs. Source does not name a transcription engine, so vendor lock-in and per-minute upstream cost are both open.
