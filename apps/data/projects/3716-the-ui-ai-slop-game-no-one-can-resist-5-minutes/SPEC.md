---
id: "3716"
slug: the-ui-ai-slop-game-no-one-can-resist-5-minutes
title: The UI AI-Slop game. No one can resist 5 minutes
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488507"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Game, UI, AI]
tech: [Vanilla JavaScript, HTML, CSS, WebAudio, Canvas]
---
# The UI AI-Slop game. No one can resist 5 minutes

## Problem

AI-generated UIs have a recognisable texture: the same "Let's get you verified ✨" copy, the same six-cell one-time passcode, the same country dropdown, the same "We use AI-powered validation to keep your data safe 🚀" reassurance lines, the same "Your security matters to us, so this step is required 🛡️" pressure wording. Designers and product people have started calling this "AI slop". The Show HN post [https://ai-rush.lol/](https://ai-rush.lol/) turns that pattern into a browser game: a "hostile interface speedrun" of 48 UI specimens (and three hidden ones) that the player has to recognise and solve, with a 5-minute timer and a "mercy mode" for levels that require a microphone, camera or motion. The source page describes every level by name — "Continue To Your Account", "One-Time Passcode", "Select Your Country", "Accept Our Cookies", "Just Checking You're Human", "Scroll To Accept", "Drag To Unlock", and so on — and posts the live leaderboard by handle. The captured brief "I turned AI slop into a UI game" describes the same product.

## Objective

Ship a single-page web game that turns 48 recognisable AI-generated UI patterns into solvable levels under a five-minute clock, with a mercy mode that drops the levels requiring device permissions, a separate mercy leaderboard, and a "lab" submission flow that lets any visitor submit their own level and ships it with their handle on it.

## Target Users

- Primary: designers, product managers, and front-end engineers who collect and meme AI-generated UI patterns and want a sharable 5-minute reference.
- Secondary: anyone on Hacker News / X / Product Hunt who clicked the Show HN link and wants to play through once.
- Tertiary: AI-UI researchers collecting examples of "default-LLM UI" patterns to study.

## MVP Scope

- 48 playable levels mirroring the published sheet: confirm/cancel dialog, OTP input, country dropdown, quantity stepper, cookie banner, password field with live validation, image CAPTCHA, date picker, interstitial ad, scroll-to-accept gate, password strength meter, phone-number input, shake-to-undo, voice verification, autocorrect text field, no-backspace text field, toast notification stack, slide-to-unlock, selfie identity check, biometric prompt, five-star rating, loading progress bar, pricing table, locked-listicle slots, 2FA push prompt, address autocomplete, idle-timeout modal, volume control, multi-step wizard, login form, four-field form, rotating-page checkout, "level failed to generate" crash, "please stand up" check, second login form, PIN entry, second CAPTCHA, country/region/city cascade, quantity stepper (variant), drag-to-reorder list, password confirm pair, seat map, three-slider settings, tag input, date-range picker, colour picker, accordion settings panel.
- A 5-minute clock and a per-level skip; the clock does not pause.
- Mercy mode that disables levels requiring microphone, camera or motion, removes four punishing modifiers, and posts to a separate leaderboard.
- A leaderboard with seeded runs from the source page (federico_sciuca, em, Itos) and the ability for new players to submit a handle and time.
- A "lab" intake where visitors can submit their own written level; if accepted, it ships with their handle on it.
- Public profile pages that let any visitor replay a seeded run and try to beat its score.

## Design Direction

See `DESIGN.md` for this project's design tokens. Visual language should be deliberately ugly on purpose: each level reproduces the AI-slop style (rounded corners, soft drop shadows, gradient CTAs, emoji-laden copy), and the chrome around the game (header, clock, leaderboard) stays deliberately understated so the slop pops. One display family for the level titles, one text family for body, and one mono family for the clock. No third-party tracking, no analytics, no login.

## Constraints

- Each level must be solvable without external network calls except for the static assets for that level.
- Microphone, camera, and motion APIs are only invoked in mercy-mode-excluded levels and must be opt-in per level.
- Scores must be tied to a handle and a seed so replays are verifiable.
- Source links to the AI Rush site only for the per-level sheet; no scraping of third-party UIs beyond the public demos on the source page.
