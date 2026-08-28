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

## Phase 0: Scaffold

- [ ] Audit any existing client/server code and confirm where the audio-purge invariant lives
- [ ] Pick the transcription engine and document its per-minute upstream cost
- [ ] Define the minute-pack ledger schema with one-year expiry
- [ ] Decide on the encryption-at-rest scheme for stored transcripts

## Phase 1: Core

- [ ] Build the upload/link flow and confirm video stays client-side per the source
- [ ] Wire the 5-minute free preview path so it does not consume paid minutes
- [ ] Implement the minute-pack ledger: purchase, deduct, enforce one-year expiry
- [ ] Run speaker identification, AI insights, cleanup tools, 99-language translation, and 21 export formats end-to-end on a sample job
- [ ] Confirm the source audio is purged after processing and only the encrypted transcript remains

## Phase 2: Deploy

- [ ] Ship the web app to production with the privacy commitments documented on a public page
- [ ] Verify in production: run a real job end-to-end, confirm the audio is gone, confirm the transcript is encrypted and downloadable in at least one of the 21 export formats

---

_Generated automatically by Lúa on 2026-08-26_
