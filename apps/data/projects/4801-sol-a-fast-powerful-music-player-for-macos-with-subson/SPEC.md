---
id: "4801"
slug: sol-a-fast-powerful-music-player-for-macos-with-subson
title: "Sol, a fast, powerful music player for macOS, with Subsonic support"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49541112"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Sol, a fast, powerful music player for macOS, with Subsonic support

## Problem

Hello! You may have seen me post here before about my other app, Gramola, a music dock that slides out from the edge of your Mac's screen.Today, I wanted to showcase a sister project to it that I started building when I grew frustrated with other music players, when I was on the search for one to integrate Gramola with (their speed and their often outdated UI to be precise).So I made my own! Sol is a music player, podcasts and internet radio app for macOS that follows all modern macOS style decisions, while seeming familiar for fans of the good old days of iTunes.Here's some highlights:- Incredibly fast, even with hundreds of thousands of songs or more.- It browses the way you remember, and it's super customizable, with different views and ways to make it your own, from a multi-column browser, to a grid view, to having a spiritual successor to CoverFlow!- It supports multiple libraries, local ones, network storage, even Navidrome and Subsonic-compatible ones. Sol doesn't have a central library that everything you add gets added to, although you can set it up that way if you want, it simply keeps track of all the locations where you keep your music.- It plays a lot of formats, MP3, AAC, ALAC, FLAC, WAV, AIFF, Opus, Ogg Vorbis, DSD, Monkey's Audio, Musepack, AC3, EAC3, CAF, AU, W64...- Gapless playback, match sample rate mode, ReplayGain.- Cue sheets as virtual tracks.- Has a rich visual metadata editor.- 10 or 31 band equalizer.- 2 top bar visualizers.- Smart playlists.- LastFM integration, autoscrobbling and stats page.- Discord Rich Presence.- Automation and control via AppleScript, Shortcuts or Sol's own local API (https://sol.fulltimefeline.com/api)- Regex rules for metadata editing and folder importing.- A steered shuffle option called SolDJ.- Internet radio and podcasts.- Synced lyrics (and transcriptions for podcasts).- Metadata, lyrics, and album art fetching.- Absolutely ZERO telemetry or analytics.And more!Sol is predominantly Swift and SwiftUI+AppKit, and built on the robust foundation of SFBAudioEngine, forked to make it MAS-friendly.It's available on the Mac App Store free to try for 7 days, then it's just a $19.99 one time purchase.Hope you like it, feel free to ask any questions, technical or otherwise!https://sol.fulltimefeline.com

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
