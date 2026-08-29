---
id: "780"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Media, Other]
country: Lebanon
tech: [Elixir, Phoenix LiveView, PostgreSQL, Stripe Connect, Cloudflare R2, Mux, Tailwind CSS, Docker, Fly.io]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales.

## Problem

The capture is a one-line problem statement: a musician from Lebanon cannot sell his music, because streaming pays pennies and Bandcamp does not accept payments in his country. The author wants a fair radio-platform with direct sales. The title is the entire ground truth; the only other metadata is `country: Lebanon`.

The actor is a musician, not a platform owner. The pain has two distinct shapes: the royalty income from large streaming services is too small to live on, and the largest artist-direct-sales platform refuses to take the musician's payments at all. The missing thing is a radio-platform — which implies continuous, scheduled playback rather than per-track streaming — with a direct-sales path that does not depend on a payment processor the musician's country is excluded from.

The capture names no specific royalty rate, no specific payment processor, no specific competitor beyond Bandcamp, no specific genre and no specific price. The honest reading of the source is that a working musician in `country: Lebanon` needs a sales channel that combines scheduled discovery with a direct-to-fan checkout that survives the payment-processor exclusion the post names.

## Objective

Ship a radio-platform for musicians that combines scheduled, always-on playback of a catalogue with a direct-to-fan sales path the musician can actually be paid through, so a listener can discover a track on the radio and buy it (or a bundle, or a subscription to the artist) without the platform intermediating the payment. The unit of success is one Lebanese musician selling one track to one fan, paid out in a currency they can receive.

## Target Users

- Independent musicians whose countries are excluded from the major direct-sales platforms and who cannot survive on streaming royalties alone.
- Listeners who want to discover new music through scheduled, curated radio rather than algorithmic playlists.
- Music fans who want to pay the artist directly and see the split, rather than pay a platform that pays pennies back.
- Small labels and collectives representing a roster of independent musicians, who need a shared radio surface with per-artist analytics.
- Cultural organisations and diasporas who want a radio presence for their scene that does not depend on a single international platform.

## MVP Scope

- An Elixir + Phoenix LiveView radio surface that streams a scheduled, always-on mix of the musician's catalogue, with the now-playing track and its album art visible to any visitor.
- Per-musician onboarding with a catalogue import path (manual track upload or a CSV-style import from an existing export), and a per-track metadata editor.
- A direct-sales checkout that runs on a payment processor that supports payouts to the musician's country, with a graceful fallback path when the primary processor cannot serve that country.
- A fan-side purchase flow that supports single-track purchase, album purchase and a monthly artist subscription, with the split shown to the buyer at checkout.
- A radio schedule editor that lets the musician or a curator place tracks into rotation slots, weight genres and queue featured records.
- A musician dashboard showing radio listen counts, conversion from listen to sale, and a payout history that reconciles with the processor's ledger.
- An audio path that uses Mux for adaptive bitrate delivery and Cloudflare R2 for cheap long-tail storage of the lossless masters.
- A documented onboarding flow for a musician in a country the primary processor does not serve, so the fallback path is reachable in practice and not just listed.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The radio surface must be always-on and audible to a fan without an account; the discovery value lives in the listen, not the sign-up.
- A musician must be paid in a currency they can actually receive, which means the platform cannot assume a single payment processor covers every country the title names.
- A track on the radio must clearly link to its purchase page within a small number of taps; the listen-to-sale conversion path is the entire product thesis.
- The split shown to the buyer at checkout must match the actual split; the platform's cut is disclosed and the remainder is what the musician sees in the payout ledger.
- The platform must not require a listener to log in to listen; accounts exist for buyers and musicians, not for casual visitors.
- The audio path must survive a regional block event; if the primary CDN is blocked, the radio still plays from a fallback.
- The platform must respect the musician's existing rights: if a track is licensed non-exclusively elsewhere, the musician marks that on upload and the radio respects the existing commitments.
