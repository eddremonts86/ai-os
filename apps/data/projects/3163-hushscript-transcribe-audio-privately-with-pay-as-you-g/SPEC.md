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

## Problem

Most transcription tools lock audio behind a subscription or hold on to the user's files. Hushscript is positioned as a privacy-first alternative: video stays on the device, audio is not retained after processing, transcripts are encrypted with built-in retention controls, and pricing is pay-as-you-go via minute packs (no subscription). The first five minutes of any job are free. Beyond the privacy and pricing model, it ships automatic speaker identification, AI insights, cleanup tools, translation across 99 languages, and 21 export formats. Minute packs are valid for a year.

## Objective

Give people who care about audio privacy — and who don't want another monthly bill — a way to transcribe audio and video on demand, paying only for the minutes used and trusting the service to not keep their files.

## Target Users

Privacy-conscious users and people who only transcribe occasionally — the source frames both as the audience ("privacy-first", "without a subscription"). Source does not name a specific vertical (journalists, lawyers, researchers) so do not invent one.

## MVP Scope

Upload or link audio/video, a 5-minute free preview, pay-as-you-go from a prepaid minute pack (one-year validity), encryption of stored transcripts with a retention control, automatic speaker identification, AI insights, cleanup tools, 99-language translation, and 21 export formats. Source explicitly states video stays on-device and audio is not kept after processing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The privacy guarantees ("video stays on device", "audio isn't kept after processing", encrypted transcripts with retention controls) are explicit commitments in the source — they are not optional and have to survive every code path. Pay-as-you-go means there is no auth-walled subscription to fall back on, so the minute-pack ledger and its one-year validity have to be correct. Source does not name the underlying transcription engine, the encryption provider, or the export format list — those are open.
