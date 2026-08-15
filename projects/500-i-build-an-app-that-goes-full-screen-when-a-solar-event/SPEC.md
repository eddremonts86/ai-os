---
id: "500"
slug: i-build-an-app-that-goes-full-screen-when-a-solar-event
title: I build an app that goes full screen when a solar event happens in space
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnyzad/i_build_an_app_that_goes_full_screen_when_a_solar/"
category: sideproject
date: "2026-08-14"
tech: [Swift, SwiftUI, macOS, EventKit, StoreKit, TestFlight]
---
# I build an app that goes full screen when a solar event happens in space

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vnyzad/i_build_an_app_that_goes_full_screen_when_a_solar/)))))

Original post:

> built Celestial - Solar Dial, a little macOS app for people who like keeping an eye on what's happening in the sky. It can notify you when events like eclipses, equinoxes, and solstices happen, with a fullscreen celestial visualization designed to make the moment feel a little more special. The idea came from setting a reminder for the August 12, 2026 solar eclipse and then completely forgetting about it. When the notification eventually appeared, my whole screen changed into the eclipse visualization - and I realized that was probably the coolest reminder I'd ever received. 😄 It also has: 🌞 Live solar position 🌑 Eclipse & celestial event notifications 🪐 Interactive solar dial 🖥️ macOS menu-bar app 📱 Widgets 🔒 No tracking / no accounts 💳 One-time purchase, no subscription I built the whole thing because I wanted something that makes astronomical events feel like events, rather than just another calendar notification. Would love feedback from other indie makers on the idea/design. https://apps.apple.com/in/app/celestial-solar-dial/id6796619339?mt=12 submitted by /u/InformationFun4466 [link] [comments]

---

What this plan addresses: Celestial - Solar Dial: a macOS menu-bar app that goes full-screen on solar events (eclipses, equinoxes, solstices).

## Objective

A macOS menu-bar app that goes full-screen on solar events (eclipses, equinoxes, solstices) so the moment feels like a moment, not a calendar notification. When a solar event is approaching, I want a menu-bar app that goes full-screen when the event happens, so I do not miss it like a normal reminder.

## Target Users

- Astronomy enthusiasts who want a low-friction solar-event companion
- macOS power users who like menu-bar utilities
- Anyone who has missed a solar event and felt bad about it

## MVP Scope

- Full-screen celestial visualization on solar events
- Notifications for eclipses, equinoxes, solstices
- Live solar position
- One-time purchase, no subscription

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnyzad/i_build_an_app_that_goes_f` follows the constraints in `500-.../SPEC.md` and the chosen stack (Swift, SwiftUI, macOS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes Celestial - Solar Dial explicitly with the full-screen-on-event framing
- Plan keeps the macOS + one-time purchase framing
- Source did not name a price
