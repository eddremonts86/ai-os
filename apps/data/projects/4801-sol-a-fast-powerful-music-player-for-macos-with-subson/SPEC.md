# SPEC.md — Sol, a fast, powerful music player for macOS, with Subsonic support

## Problem

Hello! You may have seen me post here before about my other app, Gramola, a music dock that slides out from the edge of your Mac&#x27;s screen.<p>Today, I wanted to showcase a sister project to it that I started building when I grew frustrated with other music players, when I was on the search for one to integrate Gramola with (their speed and their often outdated UI to be precise).<p>So I made my own! Sol is a music player, podcasts and internet radio app for macOS that follows all modern macOS style decisions, while seeming familiar for fans of the good old days of iTunes.<p>Here&#x27;s some highlights:<p>- Incredibly fast, even with hundreds of thousands of songs or more.<p>- It browses the way you remember, and it&#x27;s super customizable, with different views and ways to make it your own, from a multi-column browser, to a grid view, to having a spiritual successor to CoverFlow!<p>- It supports multiple libraries, local ones, network storage, even Navidrome and Subsonic-compatible ones. Sol doesn&#x27;t have a central library that everything you add gets added to, although you can set it up that way if you want, it simply keeps track of all the locations where you keep your music.<p>- It plays a lot of formats, MP3, AAC, ALAC, FLAC, WAV, AIFF, Opus, Ogg Vorbis, DSD, Monkey&#x27;s Audio, Musepack, AC3, EAC3, CAF, AU, W64...<p>- Gapless playback, match sample rate mode, ReplayGain.<p>- Cue sheets as virtual tracks.<p>- Has a rich visual metadata editor.<p>- 10 or 31 band equalizer.<p>- 2 top bar visualizers.<p>- Smart playlists.<p>- LastFM integration, autoscrobbling and stats page.<p>- Discord Rich Presence.<p>- Automation and control via AppleScript, Shortcuts or Sol&#x27;s own local API (<a href="https:&#x2F;&#x2F;sol.fulltimefeline.com&#x2F;api" rel="nofollow">https:&#x2F;&#x2F;sol.fulltimefeline.com&#x2F;api</a>)<p>- Regex rules for metadata editing and folder importing.<p>- A steered shuffle option called SolDJ.<p>- Internet radio and podcasts.<p>- Synced lyrics (and transcriptions for podcasts).<p>- Metadata, lyrics, and album art fetching.<p>- Absolutely ZERO telemetry or analytics.<p>And more!<p>Sol is predominantly Swift and SwiftUI+AppKit, and built on the robust foundation of SFBAudioEngine, forked to make it MAS-friendly.<p>It&#x27;s available on the Mac App Store free to try for 7 days, then it&#x27;s just a $19.99 one time purchase.<p>Hope you like it, feel free to ask any questions, technical or otherwise!<p><a href="https:&#x2F;&#x2F;sol.fulltimefeline.com" rel="nofollow">https:&#x2F;&#x2F;sol.fulltimefeline.com</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49541112)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T19:22:43Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
