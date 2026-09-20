# SPEC.md — VODForge – a free local desktop UI for YouTube video/playlist downloads

## Problem

I built VODForge because I work with a CTV company that needed to pull YouTube videos from our channel partners into our media workflow.<p>Converter sites are always an option but the bitrate wasn&#x27;t optimal for a CTV network that needs to make multiple streaming version off of a single source file. So I build vodforge to use yt-dlp and ffmpeg under the hood with preconfigured settings for the highest quality end result, automatically adjusting the output settings based on source quality, frame rate, and things like that.<p>It became a game changer internally for us because we were able to avoid sketchy converter sites and avoid paid converter software. Eventually I decided to release it for free and others loved it as well. We started to add support for many of the features that other software charges for, supporting 4K, playlist support, customizing application theme, persistent searchable library, auto organizing downloads by channel and playlist, MP3 support up to 320 kbps, and much more.<p>Looking for feedback on the user experience and additional features that you might find useful. My goal is to grow VODForge into a widely adopted free tool for people who do not want to deal with sketchy websites, CLI mess, or pay for things that you could ultimately do for free given time and effort. VODForge wants to make it EASY and maintained for you. We know anyone can make a GUI wrapper, but that is a trivial way to describe what VODForge aims to offer, user-friendliness, &quot;it just works&quot;, libraries and packages maintained for you. All you should think about is what to download next.<p>VODForge awaits...

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49590354)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T20:07:30Z

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
