---
id: "463"
slug: i-built-an-ios-app-blocker-that-forces-you-to-complete-
title: I built an iOS app blocker that forces you to complete a challenge before unblocking an addictive app.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vnlnni/i_built_an_ios_app_blocker_that_forces_you_to/"
category: indiehackers
date: "2026-08-13"
tech: [Swift, SwiftUI, iOS Screen Time API, CoreData, StoreKit, TestFlight]
---
# I built an iOS app blocker that forces you to complete a challenge before unblocking an addictive app.

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vnlnni/i_built_an_ios_app_blocker_that_forces_you_to/)))))))

Original post:

> [preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…]([preview.redd.it/yhlgprar57jh1.png…](https://preview.redd.it/yhlgprar57jh1.png?width=1233&format=png&auto=webp&s=bc853d5dfd5d54c321dff415f1e3e3f04355e159)))))))) Like a lot of us, I struggle with mindless scrolling. I'd open apps like Instagram or YouTube purely out of muscle memory. Existing app blockers didn't quite work for me, they were either too easy to bypass (just tap "ignore limit") or just annoying hard blocks. So, I built Hold Up. The core idea is simple: instead of just blocking an app entirely, Hold Up introduces "friction" to break the impulsive habit. When you try to open a blocked app, it pauses and makes you do a challenge (like staring at the camera without blinking for a few seconds) before you can get in. For those who want a hard block, a strict mode is available as well. Apps can be blocked using either a timer or a schedule. It's live on the App Store, and I'm looking for constructive feedback from fellow builders to improve it. The app has a free tier you can try out. Here is the App Store link: https://apps.apple.com/us/app/app-blocker-detox-hold-up/id6777367419 Would really appreciate any honest feedback you can throw my way. Thanks! submitted by /u/Revenue007 [link] [comments]

---

What this plan addresses: An iOS app-blocker that forces you to complete a challenge before unlocking distracting apps.

## Objective

An iOS app-blocker that gates every unlock behind a real challenge (math, typing, breathing) instead of a friction-less "are you sure?" tap. When I want to stop opening distracting apps, I want a tool that makes me complete a real challenge before unlocking, so I cannot tap through a confirmation dialog in 2 seconds.

## Target Users

- iOS users who want to break doomscrolling habits
- Students who want a hard barrier against social during study hours
- Knowledge workers trying to keep focus blocks

## MVP Scope

- Select apps to block + define a challenge (math problem, typing test, breathing exercise)
- Challenge must be completed to unlock for a set time window
- Streak counter + weekly summary
- No cloud sync in MVP (on-device only)

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vnlnni/i_built_an_ios_app_blocke` follows the constraints in `463-.../SPEC.md` and the chosen stack (Swift, SwiftUI, iOS Screen Time API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions an iOS app blocker with a challenge-unlock mechanic
- Plan keeps the challenge-first framing
- Source did not name a price or challenge type
