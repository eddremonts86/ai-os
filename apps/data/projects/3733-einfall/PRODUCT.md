---
id: "3733"
slug: einfall
title: Einfall
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/einfall-a-place-for-fugitive-thoughts"
category: product-launch
date: "2026-08-24"
tags: [ProductHunt, Product Launch]
wtp:
  raw: $29.99 one-time for unlimited routing (15 free routing actions)
  currency: USD
  period: one-shot
  min: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Einfall

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Most capture apps already exist; what is missing is one *trusted* destination a thought can land in, regardless of where it was caught, and from which the thought can be routed to the tool that already owns the work — Reminders, Calendar, an Obsidian daily note, a Shortcut, or a user-owned AI agent that decides what to do with it. The maker's value claim is restrained on purpose: no folders, no scripting, no engagement loops, no required server, no account. Capture is one field and one tap. Routing is opt-in per thought, on-device, and reversible by deletion if the thought turned out to be wrong. Privacy is structural, not a checkbox — "no data collected" is the kind of promise that, if broken, breaks the product with it.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Mac / iPhone / iPad power user with capture anxiety | Already loses thoughts to five destinations; wants one trusted place to park them. |
| Obsidian / daily-note user | Wants today's note to keep growing without typing into Obsidian at the moment of capture. |
| Shortcuts / automation builder | Wants a low-friction local capture endpoint they can wire into their own workflows. |
| Local-AI-agent user (Claude Code / Codex) | Wants the agent to look at the latest 50 thoughts and decide what to do with them — not the agent capturing thoughts. |
| Maker / self (Product Hunt author) | Validates that "capture-only + small routing surface" is a product, not a feature inside Notes or Reminders. |

## Jobs To Be Done

1. **Functional job** — Catch a thought in under five seconds on whatever device is in hand, and route it later to the tool that owns the work.
2. **Emotional job** — Stop the "I had a thought and now it's gone" anxiety that comes from capture surfaces that are slow, multiple, or upstream of one another.
3. **Social job** — Keep a private, on-device thought stream that nobody — not the maker, not an analytics SDK, not a sync server — is reading alongside the user.

## Success Metrics

- **Capture time to first thought:** median user captures their first thought within 60 seconds of launching the app (proxy: the surface is reachable, not buried under onboarding).
- **Multi-device capture:** ≥ 40% of monthly active users capture from at least two of {Mac, iPhone, iPad} in a given month (proxy: the "one trusted stream" claim is real, not single-device).
- **Routing actions:** users who hit the free-tier cap (15 routing actions) upgrade to unlimited at a rate that justifies the $29.99 unlock (specific rate is not stated in the source and should be set internally rather than invented).
- **Deletion confidence:** a measurable share of thoughts are deleted rather than routed, deliberately; this is a feature, not a failure mode, and should be reported rather than optimised away.
- **Privacy audit:** zero bytes of captured thoughts leave the user's devices; verified by an external review rather than a self-report page.

## Pricing & Monetization

The ProductHunt listing states the price directly: **capture is free and unlimited; the first 15 routing actions are free; a one-time $29.99 purchase unlocks unlimited routing.** That maps to a `wtp` of {min: 29.99, currency: USD, period: one-shot}. There is no subscription in the model.

- **Free** — capture, unlimited.
- **Free with limit** — 15 routing actions (a "routing action" is defined by the maker as sending a thought to Reminders / Calendar / a file / a Shortcut / the user's AI agent).
- **Paid, one-time** — $29.99 IAP for unlimited routing, no recurrence, no account.

## Competitive Landscape

- **Apple Notes + Reminders + Shortcuts (stock)** — already on the device. The differentiator Einfall claims is *not* a third surface, but a single trusted stream with one-tap routing to those surfaces, plus a local MCP server for the user's own agent — features Notes and Reminders do not expose together.
- **Third-party capture apps (Drafts, Bear, Obsidian itself, Evernote, Notion)** — heavier, more structured, and most of them require an account, a sync layer, or both. The maker explicitly cites their folders / scripting / engagement mechanics as reasons he did not use them.
- **Voice memo + transcription (Apple Voice Memos, Whisper-based tooling)** — fast to record, slow to route; Einfall keeps the same "fast to capture" speed and adds the routing layer.
- **AI-first capture (Replika "memos," Mem, etc.)** — try to summarise and route thoughts automatically. The maker's position is that the user, not the AI, should decide; the agent receives *candidates*, not decisions.
- **Nothing** — the status quo. A lot of users do not have a capture tool at all and rely on memory; Einfall's audience includes those users.

## Risks & Open Questions

- [ ] The "no server" claim is the product. The day Einfall starts syncing through a backend (even for backups) is the day the privacy claim has to be re-stated. Any future feature that pulls data out of the device should be opt-in and clearly labelled; this is not a roadmap item to slip in silently.
- [ ] The MCP server runs only on the Mac. iPhone / iPad users will see a dead-end when they try to route to an agent away from the desk; the listing does not currently imply an iOS-side agent bridge, and adding one without breaking the local-only claim is a real design question.
- [ ] The 15-free-routing-actions ceiling is the conversion hook. If the ceiling feels arbitrary (e.g. 3 actions on a heavy user day, 0 useful actions on a quiet day) it will be resented, not welcomed. The team should make sure that "routing action" is defined in a way the user understands the count, and that the cap is generous enough to be useful in the free tier.
- [ ] "Capture is free forever" puts the unlock price ($29.99) on the burden of justifying itself once, with no recurring revenue. If the team relies on this product for income, they need either a sustained pipeline of new users or an expansion into a tier that does not break the "no account, no server" promise.
- [ ] The maker built Einfall as a Swift-learning project. Code-quality risk is real: an early-1.0 Swift codebase maintained by a non-native speaker benefits from external review before scale. This is a delivery question for the team, not a product-identity question for the user.
