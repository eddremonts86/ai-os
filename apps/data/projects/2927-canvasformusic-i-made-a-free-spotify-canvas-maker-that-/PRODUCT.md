---
id: "2927"
slug: canvasformusic-i-made-a-free-spotify-canvas-maker-that-
title: "CanvasForMusic – I made a free Spotify Canvas maker that doesn't suck"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49436381"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# CanvasForMusic – I made a free Spotify Canvas maker that doesn't suck

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello I know most of you are devs, but if you also make music, this is for you.I've been on a hunt lately of finding tools for artists centred around promoting and posting music and rebuilding them with more intention. If it helps me promote my own music easier, it will surely help others too.Recently, I was having a look around at the top search ranking Spotify Canvas Maker tools for artists and found that they all sucked. They produced generic looking canvas videos using stock images or stock videos and didn't really have any options that actually looked decent to add to your song on Spotify. It's a small detail but you may as well just leave the static cover art on the song rather than have a corny looking canvas on Spotify.I'm a big fan of getting more quality out into the world, easier. Not just more quantity. There was already too much slop and low effort tools in the creative world, well before AI entered the picture.The idea was to make it as low friction as possible for the artist and let them use assets they already have for the release. The user will add their artwork for the release, then they can choose between a Vinyl rotating preset or a crop & zoom preset that makes their artwork a bit more interesting by bouncing around the image. I might add another but for now these are a good starting point.I built it in under a day, mainly because I was able to leverage what I had already built with BeatVisualiser (a music visualiser product of mine) and brought over the vinyl animation and in browser rendering process. This was an easy choice for me as I just needed to take something I've already built on my app and repurpose it and it lets an artist get a Canvas video per Spotify's required specs quick and easy, no strings attached, no faffing about in After Effects or video editors and it also doubles as a natural upsell into my music visualiser app.I made sure to get looping figured out on the Vinyl preset by locking the variable speeds to only be loop friendly for the 8 second limit. Certain rotating speeds left a visible break in the animation which looked ugly.Completely free to use, no sign up or anything.Cheers!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49436381) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
