---
id: "3718"
slug: snippety-a-native-text-expander-for-mac-and-iphone
title: Snippety – a native text expander for Mac and iPhone
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488310"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, macOS, iOS, Productivity]
tech: [Swift, SwiftUI, AppKit, CloudKit, Apple Shortcuts]
---
# Snippety – a native text expander for Mac and iPhone

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Mac and iPhone user types a keyword like `;reply` and Snippety expands it into a fully-formatted, context-aware reply — asking for the customer's name, branching on whether they are on the Free or Premium plan, calculating a follow-up date, and inserting the right wording — all in one keystroke, with no account, no server, and snippets living on the device or in the user's own iCloud.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Power users and developers on macOS | Already use a text expander and want conditional logic, shell-out, and no subscription pressure. |
| iOS-first knowledge workers | Want to expand the same snippets on their phone via a custom keyboard, not a viewer. |
| Support and sales agents | Maintain shared email templates and want one snippet per scenario with branching on plan / region / status. |
| DevOps / SRE on-call | Run shell commands inside snippets (e.g. `;kube-events`) to paste live cluster status. |
| Apple Shortcuts and Siri power users | Want named snippet actions they can chain into larger workflows. |

## Jobs To Be Done

1. **Functional job** — Type a short keyword, get a context-aware, branching, calculated-text snippet inserted in any app.
2. **Emotional job** — Stop maintaining five near-duplicate snippets when one conditional template will do.
3. **Social job** — Look like the team member who always replies with the perfect wording in under ten seconds.

## Success Metrics

- **Snippet creation:** first snippet authored within 10 minutes of install for ≥ 80% of new users.
- **Expansion volume:** median active user expands ≥ 30 snippets per day within week 2.
- **Templating adoption:** ≥ 40% of power users create at least one snippet that uses a conditional block.
- **Cross-device:** ≥ 25% of paid users open Snippety on both macOS and iOS in the same week.
- **Churn:** monthly churn ≤ 3% on the low monthly plan; lifetime-update buyers churn ≤ 1%/year.

## Pricing & Monetization

Free tier (limited snippet count, full templating). A low monthly subscription, and a one-time purchase with lifetime updates. No forced subscription, no hidden fees, no telemetry required to keep the app working. The free tier is the funnel; the paid tiers unlock unlimited snippets and the iOS keyboard.

## Competitive Landscape

- **TextExpander** — mature SaaS, conditional blocks, but subscription-only and the snippets live on TextExpander's servers.
- **Typinator** — Mac-only, no iOS keyboard, no conditionals in the same form.
- **Raycast Snippets** — bundled with Raycast, but conditional templating is shallow and there is no native iOS keyboard.
- **aText** — Windows/Mac, no iOS, no conditionals.
- **Built-in macOS Text Replacement** — free, no conditionals, no shell-out, no cross-device.

## Risks & Open Questions

- [ ] Confirm Apple App Review will accept the custom keyboard extension without a "Full Access" paywall.
- [ ] Decide the free-tier snippet cap before launch.
- [ ] Validate that the iCloud sync path does not surface snippets from disabled categories accidentally.
- [ ] Decide whether to ship the on-device AI features (translation, rewrite) in v1 or push to v2.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49488310) · **Category:** show-hn · **Tags:** Show HN,Product,macOS,iOS,Productivity
