---
id: "2503"
slug: rmp-a-subsonic-music-player-for-generating-playlists-on
title: "Rmp, a Subsonic music player for generating playlists on the fly"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49408520"
category: show-hn
date: "2026-08-23"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rmp, a Subsonic music player for generating playlists on the fly

## Problem

When listening to music, I often don't play whole albums, but string
together songs that capture my current mood. In the past, I've written
a tool that records my hearings and generates suggestions from my usual
listening patterns[1] and used it with some scripts around mpd. This
made my way of listening to music easier and worked decently, but I
wished I could also sync and use this with my phone.Recently I've discovered Subsonic, a protocol for music servers
and players. It caught my eye, because it supports "scrobbling"
(apparently the common term for "recording hearings") and generating
similar-song-lists. Pretty much exactly what I had been doing and many
music players support this feature to create "instant playlists". With
a little bit of hacking[2], it was easy to integrate my existing,
collected hearing patterns into a Subsonic server.While I found a decent Subsonic client for my phone, I didn't find a
terminal music player that worked for my style of listening. So I wrote
rmp; it's really minimal, but does what I need it to do: It allows me
to quickly fuzzy search my whole library and then add suggestions for
already queued songs to the queue, while also scrobbling heard songs.[1] https://github.com/codesoap/songmem
[2] https://github.com/sentriz/gonic/compare/master...codesoap:g...

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
