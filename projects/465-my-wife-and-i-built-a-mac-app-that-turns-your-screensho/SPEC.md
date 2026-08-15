---
id: "465"
slug: my-wife-and-i-built-a-mac-app-that-turns-your-screensho
title: "My wife and I built a Mac app that turns your screenshots into actions - explain an error and create an issue, add events to Calendar, save contacts and more."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vnbaw1/my_wife_and_i_built_a_mac_app_that_turns_your/"
category: indiehackers
date: "2026-08-13"
tech: [Swift, SwiftUI, CoreData, AppleScript, StoreKit, TestFlight]
---
# My wife and I built a Mac app that turns your screenshots into actions - explain an error and create an issue, add events to Calendar, save contacts and more.

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vnbaw1/my_wife_and_i_built_a_mac_app_that_turns_your/)))))

Original post:

> Hey everybody! For the last few months my wife and I have been building Scinta - a small macOS app that lives in your menu bar. The idea came from a simple but almost daily problem - the number of screenshots lying around on my filesystem got so big that it was impossible to even remember what they were about. A message about a meeting, an email signature, someone's messenger profile, an error from a build - all of this was waiting for "some later time" to be processed. And some later time never arrived. This is the exact problem Scinta solves, and this is how it works - you press a shortcut (like any other screenshot app), select part of the screen, and it proposes the top 3 things it can do with what it sees. We call them smart actions. For example: screenshot an error - get it explained or create an issue directly from Scinta screenshot a message like "dinner Saturday at 7:00 PM" - Scinta proposes the actual event details and creates it in your Calendar screenshot an email signature - the person's contact info is saved to your Contacts it can also blur private and sensitive info before you share a screenshot, extract code or tables, translate text, decode different code formats (including QR and Bar codes) - and more actions are coming There is also an Ask AI feature - if you just have a question about what is on the screen, you ask it right there in the app and get the answer back immediately. Expecting a common question - why not just paste the screenshot into ChatGPT or Claude? That is exactly what I did before, and it is the reason Scinta exists. There you switch apps, upload the screenshot, write a prompt, then copy the result back and still create the event or contact yourself. With Scinta you skip all of this - it understands what can be done with the screenshot and one click gets the result and performs the action - saving to Calendar or Contacts, creating an issue, getting an instant explanation and so on. The demo video shows 3 different smart actions and runs at real speed - nothing is sped up. We're planning to release it within the next 1-2 weeks. If it looks useful, there is a waitlist at scinta.app - and if you would like to try it earlier, comment or DM me and we will send you a build as soon as it's ready. Would love to hear - what smart actions would you like to have after capturing a screenshot? submitted by /u/holub_ua [link] [comments]

---

What this plan addresses: A macOS menu-bar app (Scinta) that turns screenshots into actions via "smart actions" (explain error, draft reply, save to project).

## Objective

A macOS menu-bar app that turns screenshots into actions via suggested next steps (explain error, draft reply, save to project). When I take a screenshot of an error, an email signature, or a UI element, I want the app to suggest the top 3 next actions, so I stop accumulating screenshots I never look at again.

## Target Users

- macOS power users drowning in unsorted screenshots
- Knowledge workers who screenshot errors, emails, signatures and forget to act on them
- Designers who capture UI inspiration and lose it

## MVP Scope

- Screenshot capture with system-wide shortcut
- Top-3 suggested actions per screenshot (explain error, draft reply, save to project)
- On-device OCR for text extraction
- No cloud OCR in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vnbaw1/my_wife_and_i_built_a_mac` follows the constraints in `465-.../SPEC.md` and the chosen stack (Swift, SwiftUI, CoreData). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes Scinta: macOS menu-bar app, screenshots → actions
- Plan keeps the smart-actions framing
- Source did not name a price
