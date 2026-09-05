---
id: "4228"
slug: tether
title: Tether
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/tether-a-ball-for-boring-meetings"
category: product-launch
date: "2026-08-30"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tether

## Value Proposition

A Mac menu bar ball on an elastic tether with real physics that reacts to real app windows. Drag, fling, slingshot; the ball lands on the top edges of real windows, rolls along them, and reacts when the user moves the windows. Cut the rope and the ball goes loose across the desktop, bouncing off whatever is in the way. Seven balls ship at launch, each with its own weight, grip, and bounce. Gravity, bounce, size, and rope length are live-tunable, with presets. One key hides the ball the instant somebody says the user's name.

Distributed as a one-time purchase on the Mac App Store for macOS 14 and later. No account, no subscription, no telemetry, nothing leaves the Mac. Completely silent, no audio anywhere.

**One-liner:** A Mac menu bar ball on an elastic tether with real physics, seven balls each with their own weight and bounce, one-key hide, one-time Mac App Store purchase, no account and no telemetry.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Mac users in long work meetings | Want to keep their hands busy without leaving the desk. |
| Users with ADHD | Want a silent fidget that does not interrupt the meeting. |
| Users who want real physics | Want the ball to react to real app windows, not play a canned animation. |
| Users who refuse subscriptions | Want a one-time purchase on the Mac App Store. |
| Users who need a hide escape | Want one key to hide the ball the instant somebody says the user's name. |

## Jobs To Be Done

1. **Functional job** — Fidget with a menu bar ball that reacts to real app windows, with seven balls each tunable live.
2. **Functional job** — Cut the rope and let the ball go loose across the desktop, bouncing off whatever is in the way.
3. **Functional job** — Hide the ball instantly with one key when somebody says the user's name in a meeting.
4. **Functional job** — Tune gravity, bounce, size, and rope length live, or leave the presets alone.
5. **Emotional job** — Stop the feeling that the only fidgets available are pens and cables, or a physical ball that is not on the desk.
6. **Social job** — Be the user whose fidget is silent, completely local, and hidden the moment the meeting turns to the user.

## Success Metrics

- **Physics-fidelity rate** — share of interactions where the ball's behaviour matches real physics (lands on top edges, rolls along them, reacts to window moves) rather than a canned animation.
- **Cut-the-rope bounce rate** — share of cut-the-rope interactions where the ball goes loose across the desktop and bounces off whatever is in the way.
- **Live-tunable response time** — wall-clock time from a gravity / bounce / size / rope length change to the ball reflecting the new value. The metric is the live-tunability guarantee.
- **Hide-on-keypress latency** — wall-clock time from the user pressing the hide key to the ball disappearing. The metric is the escape-velocity guarantee.
- **Per-ball weight / grip / bounce distinction** — share of the seven balls whose weight, grip, and bounce the user can feel as distinct. Two balls that feel identical is a per-ball-distinction failure.
- **No-telemetry verification rate** — share of app launches where the app does not call out to a network. A launch that calls out is a no-telemetry guarantee breach.
- **macOS 14+ compatibility rate** — share of macOS 14+ users where the menu bar app installs and runs without regressions. A regression is an OS-compatibility failure.

## Pricing & Monetization

The source is explicit that the app is a one-time purchase on the Mac App Store. The plan does not invent a subscription, a per-ball price, or a paid tier. The one-time-purchase model is the source's monetization. Any future monetization has to be measured against the no-telemetry verification rate and the per-ball weight / grip / bounce distinction, because those are the metrics the source ties to the app's value proposition.

## Competitive Landscape

- **Pens, cables, the corner of a notebook** — the source's named pain; the user reaches for these because the Mac menu bar does not have a real-physics fidget.
- **Physical fidget balls** — the source's named alternative; not on the desk in a meeting.
- **Canned-animation fidgets** — the source's named alternative; predictable, no real-window reaction.
- **Audio fidgets** — the source's named alternative; the maker explicitly declined ("Completely silent, no audio anywhere in the app").

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the real-physics reaction to real app windows is robust across window managers. The source is explicit that the ball reacts to real windows; the open question is how the ball behaves when the user is on a non-standard window manager (a tiling WM, a custom shell) or with mission-control-exposed Spaces.
- [ ] Validate the cut-the-rope bounce behaviour is what the user expects. The source describes the ball going loose across the desktop; the open question is whether the bounce behaviour surfaces a "settled" state or keeps the ball in motion until the user re-attaches the rope.
- [ ] Define the policy on a hide-on-keypress during a screen share. The hide-on-keypress is the escape; the open question is whether the screen share still shows the ball, or whether the hide-on-keypress is visible to the meeting.
- [ ] Confirm the live-tunable range is enough for the user. The source names gravity, bounce, size, and rope length; the open question is whether the user wants additional tunables (the ball's colour, the rope's colour, the rope's anchor point) the plan does not invent.
- [ ] Decide the policy on a Mac App Store review that asks for an eighth ball or a new colour. The source ships seven balls; the open question is whether the app adds an eighth ball, and how the seven-ball launch set is preserved.
- [ ] Establish a documented escalation path when the Mac App Store review rejects the app. The source does not name a review status; the open question is how the app handles a rejection (a privacy concern, a content concern).
- [ ] Define the policy on a future macOS version that breaks the menu bar integration. macOS 14+ is the source's stated minimum; the open question is how the app handles a macOS update that changes the menu bar API.
