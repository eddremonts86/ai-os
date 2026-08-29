---
id: "3710"
slug: awe-radio-free-247-internet-radio-stations-for-anyone
title: "Awe Radio, free 24/7 internet radio stations for anyone"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485708"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [iOS app (Swift/SwiftUI), web player, station-owner dashboard]
---
# Awe Radio, free 24/7 internet radio stations for anyone

## Problem

Internet radio has always been technically possible — an Icecast stream, a directory like radio-browser.info, a player — but the listener-side experience has been stuck on either old Winamp-era apps (StreamTuner, the project a commenter linked to in the HN thread to show the lineage) or heavyweight SaaS players. AWE Radio's framing is "Live internet radio in your pocket" on iPhone, iPad, and Apple Watch, plus "Listen on the web" at `listen.aweradio.app`.

The HN post is a one-line Show HN. The site itself is the source: a directory of named stations with explicit mood / genre tags — `listen/chill` (ambient, downtempo, atmospheric), `listen/hype` (dance-pop), `listen/afterdark` (deep-house, house), `listen/cruise`, `listen/focus`, `listen/workout`, `listen/lounge`, `listen/indie` — plus user-started stations (`afropulsefm`, `appuradio`, `booth`, `delusions`). The tagline is "Anyone can start one." The site footer says the project is on iPhone / iPad / Apple Watch and on the web.

The web player at `listen.aweradio.app` exposes a "Station Owner" dashboard with `Dashboard`, `Upload`, `Broadcast`, and `Stats` links — so a station owner can upload tracks, broadcast live, and see listener-side stats (refreshing stream, buffer, latency, bandwidth, listeners, uptime, CPU, memory). The "Live now" section on the marketing site lists the currently-playing track per station.

## Objective

Let anyone run a 24/7 internet radio station that listeners can hear from iPhone, iPad, Apple Watch, or a web tab — without learning Icecast, SHOUTcast, or a streaming stack.

## Target Users

1. **Listeners** — anyone who wants a "tune in" experience that runs in the background across iPhone, iPad, Apple Watch, or a browser tab, with named stations matched to mood and genre.
2. **Station owners** — anyone with a music library and a curator's instinct who wants a 24/7 stream with listener stats, without standing up their own Icecast server.
3. **Small music communities and labels** — anyone who wants a hosted station they can promote as a home for their catalogue.

## MVP Scope

- iPhone / iPad / Apple Watch app on the App Store.
- Web player at `listen.aweradio.app` with the same station catalogue.
- Curated stations with mood / genre tags: chill, hype, afterdark, cruise, focus, workout, lounge, indie, etc.
- User-started stations via `/signup`, with a station-owner dashboard that includes Upload, Broadcast, and Stats.
- Real-time "now playing" per station on the marketing site.
- Out of scope for MVP: live DJ scheduling, listener chat, paid subscriptions per station, podcast-style on-demand replay.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Free at the entry tier. The product name and the landing copy both frame the station catalogue as "free 24/7 internet radio for anyone". Pricing tiers above free are not named in the source.
- Cross-device: iPhone, iPad, Apple Watch, and the web player must all show the same catalogue and the same now-playing.
- The station-owner dashboard is on the web, not on the iOS app — the iOS app is for listening, the web is for running a station.
- The product competes on a technical lineage (StreamTuner, Icecast, radio-browser.info) — the operator has already shipped their stations to radio-browser.info so existing apps can find them, per the HN thread.
