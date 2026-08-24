---
id: "2087"
slug: check-if-any-of-the-656m-in-unclaimed-royalties-at-the-
title: Check if any of the $656M in unclaimed royalties at The MLC is yours
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49375237"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Check if any of the $656M in unclaimed royalties at The MLC is yours

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, I built this. Quick background on why it exists:When music is streamed on digital streaming platforms (think Spotify, Apple Music, Pandora), there are two separate royalty streams: one for the recording, paid through your distributor (DistroKid, TuneCore, CDBaby), and one for the underlying work (generally known as publishing). The work side's mechanical royalties are collected by The MLC, a nonprofit that was created by the 2018 Music Modernization Act (MMA). If you haven't registered your songs with The MLC, there are issues with your metadata, or about half a dozen other reasons, that money will never reach you, it just collects in a big pile we call the "black box".That pile is big. The MLC's own dashboard currently shows over $656M is held (themlc.com/blanket-royalties), and the biggest problem is the MMA dictates that The MLC cannot hold that money indefinitely. At some point, by law, The MLC must distribute this big pile of cash, and since they don't know who it's supposed to go to, they pay it out through a process called "market share" (themlc.com/marketshare). Market share means they pay it out, pro-rata, to the artists, songwriters and publishers that are in the system, which in practice means the largest publishers collect most of the leftovers.This is slated to begin in January 2027 and will pay portions of the pool out monthly (themlc.com/unclaimed-accrued-royalties), as of this morning, the next 12 months of market share sums up to $76.61M, starting with $6.41M in January.Full disclosure: I run Doubly, which is an independent publishing administrator, so I have a commercial interest in this space. That being said, we're a team of two people and we don't have the bandwidth to directly assist the hundreds of thousands of artists and songwriters who are going to start losing this money in January 2027.That's why I built this self-service tool, no signup, no email, no paywall, the reports are completely actionable without needing anything from us.The tool: paste a Spotify artist link (or search for a Spotify artist by name). It pulls every release on that profile, checks each recording against The MLC's public bulk data, and tells you per-song whether it's fully claimed, partially claimed, registered but unmatched, or missing entirely. It then provides a link to the exact MLC tool that fixes each case. It also estimates the dollars stuck, as a rough range.Even if you're not an artist yourself, you probably know someone who is a musician, please share it with them.Thanks for your time and I'm happy to answer any questions about the industry as a whole, The MLC, the tech, anything really.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49375237) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
