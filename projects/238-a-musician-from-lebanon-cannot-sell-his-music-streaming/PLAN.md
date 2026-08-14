---
id: "238"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Other]
country: Lebanon
tech: [Next.js 14, TypeScript, PostgreSQL, Stripe Connect (Stripe Atlas), S3-compatible storage, Icecast streaming server, Telegram Bot API]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales

## Tech Stack

Next.js 14 (TypeScript) for the web frontend and artist dashboard. PostgreSQL for artists, tracks, sales, payouts. S3-compatible object storage (Backblaze B2) for audio files. Icecast for the live radio stream. Stripe Connect with Stripe Atlas as a fallback for non-Lebanese artists, plus a Lebanese payout partner (research during M1) for Lebanon-based artists. Telegram Bot API for artist notifications of sales and payouts.

## Architecture

Three services: a Next.js web app (player, artist dashboard, admin), an Icecast streaming origin that mixes the three channels, and a small Node.js payment worker that handles direct sales and monthly per-play settlements. Audio files live in S3-compatible storage; Icecast pulls HLS segments from a transcoding worker (ffmpeg).

## Milestones

M1: Lebanese payout partner research and onboarding flow. M2: Artist dashboard, audio upload, transcoding to HLS. M3: Web player with three channels. M4: Direct-purchase flow via Stripe / Lebanese partner. M5: Per-play micro-payment engine and monthly settlement.

## Risks

Lebanese payout-rail settlement can stall for weeks; cash-flow buffer needed. Audio transcoding at scale needs careful queue design. Per-play economics depend on listener base — slow ramp.
