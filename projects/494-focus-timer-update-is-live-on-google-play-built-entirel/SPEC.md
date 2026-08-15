---
id: "494"
slug: focus-timer-update-is-live-on-google-play-built-entirel
title: "Focus timer update is live - on Google Play, built entirely from your feedback"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo0368/focus_timer_update_is_live_on_google_play_built/"
category: sideproject
date: "2026-08-14"
tech: [React Native, TypeScript, Android, Google Play, AsyncStorage]
---
# Focus timer update is live - on Google Play, built entirely from your feedback

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vo0368/focus_timer_update_is_live_on_google_play_built/)))))))

Original post:

> A few weeks ago I shared JustFocus here, a minimal focus timer I built from the first sketch in Figma all the way to Google Play. Since then over 80 people have tried it and I wanted to say thank you 🤍 (Play Console still stubbornly shows 1 install, but that’s a known issue at this point.) The new update is out and almost everything in it came directly from comments here and reviews on Google Play: • Dark mode • Custom timer • Session start and end times • Pause, resume and stop controls • Expandable session history • Landscape support Still the same idea underneath: pick what you’re focusing on, set a session, no ads, no registration, nothing to buy. If you tried it before, I’d love to know if it feels better now. And if you haven’t, this is a good moment to 🤍 JustFocus - Google Play submitted by /u/Spurginukas [link] [comments]

---

What this plan addresses: JustFocus: a minimal focus timer built from user feedback, with dark mode, custom timer, and session history.

## Objective

A minimal focus timer with the explicit features users asked for: custom timer, session timestamps, history, dark mode, landscape support. When I want a focus timer that does exactly what I ask, I want a no-ads / no-registration app with the features I actually use, so I do not have to navigate a productivity suite.

## Target Users

- Knowledge workers who want a no-frills focus timer
- Students needing a Pomodoro-style tool without ads
- Anyone who tried "fancy" focus apps and quit

## MVP Scope

- Custom timer with start / pause / stop
- Session start + end timestamps
- Expandable session history
- Dark mode, landscape support
- No ads, no registration, no purchase

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo0368/focus_timer_update_is_live` follows the constraints in `494-.../SPEC.md` and the chosen stack (React Native, TypeScript, Android). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes JustFocus updates on Google Play and the explicit feature list
- Plan keeps the no-ads / no-registration framing
- Source did not name a price (free was implied)
