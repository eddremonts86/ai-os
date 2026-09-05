---
id: "5147"
slug: video-wall-live-view-all-your-ring-cameras-at-once-on
title: "Video Wall Live – View all your Ring cameras at once, on the big screen"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49572069"
category: show-hn
date: "2026-09-05"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Video Wall Live – View all your Ring cameras at once, on the big screen

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, I’m the developer of Video Wall Live.I’m sure everyone has seen those “Video Walls” on big TV screens used by security at stores and other commercial establishments, in order to get a single view of all cameras at once.Seeing one of these setups got me thinking - this would be great to have in my house. I have Ring cameras (hardwired PoE, came with the house). I have TVs. I have smart TVs and streaming sticks that run apps. Surely this must exist. After much searching, the only thing I could find to solve this problem was a Homebridge server solution that works with my Apple TV.From there, I spent a few hours researching the best device to install it on, and ordered myself a Raspberry Pi. I assembled it, installed the OS, install Homebridge, a few hours later, success. I was finally able to view my Ring cameras on the TV. But, not all at once! After a few weeks, I realized that even that is not so stable, and occasionally have to reboot.Surely the average Ring consumer will not be able to, or have the patience to setup a Homebridge or Scrypted server. There has to be a better way, a simpler way. A way that doesn’t involve extra hardware plugged in 24/7 with a fan humming.Having developed about half a dozen Apple TV apps, I built a software only solution to solve this problem and Video Wall Live was born.Video Wall Live displays your Ring cameras in a live grid. You can open an individual camera full screen with audio, rearrange the layout, or use Auto-Cycle to rotate through cameras. And now, we have native apps that run on Apple TV, Fire TV, Google TV, Roku, and in a browser.Video Wall Live is available through the Ring App Store, and you connect your cameras and manage the subscription.Now due to the way Ring does things, a few small details: The Ring App Store is only available to users in the US, at the moment. It requires a Ring pro subscription. Ring only supports per camera subscription pricing, so we priced it at $1.99 per cam per month. Multiple TV are supported, up to 10 per household. Yes, I know you hate monthly subscriptions too, but since this runs in the cloud and there are ongoing cloud cost.I would particularly appreciate feedback on setting up, navigating a camera grid with the TV remote, the user experience, and and any feedback or bug reports!Finally, Ring’s privacy policies and subscription pricing bring up strong opinions. And surely there are many other options like Ubiquiti that are better suited for the HN audience. But, Ring is the market leader at the moment, and most people are just not as technical as you guys! We hope in the future to open this up to other platforms and ecosystems.Hopefully this thread can be a discussion on the product, and not the recent controversies and other gripes with Ring!Thanks!

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49572069) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
