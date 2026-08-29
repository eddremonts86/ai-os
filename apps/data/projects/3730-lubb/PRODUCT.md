---
id: "3730"
slug: lubb
title: Lubb
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/lubb-heartbeat-for-sleep"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Lubb

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Lubb replaces the "play something to fall asleep" reflex with a felt heartbeat you can tuck under your pillow. For someone sleeping alone, missing a partner, or simply overstimulated by audio apps, the slowest and quietest version of "I'm here" is a soft, repeating lub-dub under the ear, not another soundscape. The maker frames it as a dedicated heartbeat companion built around the iPhone's Taptic Engine — a single, narrow product rather than a sleep platform — and ties it to Dr. Bruce Perry's argument that patterned sensory stimulation pulls a stressed body back to a calm state. The implied trade is real: give up sound, give up tracking, give up recommendations; get a private, low-distraction, non-audio cue that does its work while you stop looking at it.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Adults who sleep alone | Want a calm, non-audio companion at bedtime; tired of sleep apps that require headphones or a soundscape. |
| Anxious sleepers sharing a room | Need a tactile-only sleep cue they can feel without disturbing a partner or roommate. |
| Long-distance couples | Use a shared slow rhythm as a low-bandwidth "presence" signal at night without a phone call. |
| Taptic-Engine-friendly iPhone owners | Most modern iPhones already vibrate; Lubb converts an existing capability into a dedicated sleep surface. |
| Maker (Oğuzhan Taşımaz) | Validation of a "dedicated heartbeat companion" as a category, distinct from noise libraries and sleep trackers. |

## Jobs To Be Done

1. **Functional job** — Fall asleep without putting more sound or more screen into the room.
2. **Emotional job** — Feel less alone or less overstimulated at bedtime, with a cue that is private and reassuring.
3. **Social job** — Be able to say "I have a thing for nights like this" without needing to explain a full sleep setup; the product is small enough to slot in alongside, not replace, the rest of the user's routine.

## Success Metrics

- **Activation:** ≥ 70% of users who open the app reach the "start heartbeat" button on their first session (proxy: the path from cold open to the haptic running is ≤ 3 taps).
- **Trial completion:** ≥ 50% of users who start a nightly trial let it run to the auto-stop without manually cancelling (proxy: the haptic rhythm is tolerable for the full 10-minute trial).
- **Retention:** ≥ 30% of users return within 7 nights for at least one additional session (proxy: the product is being used as a sleep onset tool, not as a one-off novelty).
- **Conversion:** the share of users who go from "trial only" to "paid nightly session" is reported in the listing's own metrics once available; no concrete rate is stated in the source, so the team should set its own target and avoid inventing one in this plan.

## Pricing & Monetization

The ProductHunt listing marks Lubb as **Free**; it does not state a price, a subscription, or an in-app purchase, so no `wtp` field is set. The listing does mention a "free 10-minute nightly trial," which strongly implies a paid mode beyond the trial, but no number is quoted — `wtp` is left `absent` rather than invented. Plausible monetisation surfaces for a product in this position:

- **Per-session unlock** — pay once or via IAP for an unlimited nightly session after the 10-minute trial ends.
- **Subscription** — a low monthly or yearly fee that removes the 10-minute cap and unlocks additional patterns or paces.
- **One-time unlock** — a single IAP that permanently unlocks unlimited nightly sessions.

The maker chose to ship without an account, so any of these has to be implemented through the App Store's StoreKit / IAP system rather than a backend.

## Competitive Landscape

- **White-noise / sleep soundscape apps (Calm, Endel, Noisli)** — audio-first; Lubb is haptic-only, which is the differentiation. Reviewed against in the ProductHunt "Similar Products" rail (Endel explicitly listed).
- **Heartbeat / sound-of-a-partner apps (Apple's own bedtime sounds, third-party "heartbeat for sleep" apps)** — typically ship a recorded audio heartbeat through the speaker, which is the exact opposite of Lubb's "felt, not heard" claim.
- **Generic iOS haptic apps and Core Haptics demos** — expose the Taptic Engine to the user but require the user to design the rhythm themselves; Lubb's narrowness is the value.
- **Sleep trackers (AutoSleep, Sleep Cycle)** — measure after the fact; orthogonal product to Lubb but frequently competing for the same phone-on-the-nightstand slot.
- **Guided meditation (Headspace, Calm Daily Calm)** — content-heavy, audio-heavy; overlapping audience (anxious sleepers) but a different mechanism.

The maker's positioning is explicit on the ProductHunt listing: "Most heartbeat and sleep apps are either sound libraries or trackers. This is a dedicated heartbeat companion built around the iPhone's Taptic Engine, so it feels physical instead of like another noise app."

## Risks & Open Questions

- [ ] The haptics quality cap is set by the iPhone's Taptic Engine. Users on older devices or on iPads that ship with weaker / no Taptic hardware will have a degraded or silent experience; the app should detect this and tell the user rather than failing silently.
- [ ] Trial mechanics beyond the 10-minute nightly free trial are not described in the source. Before the MVP ships, the team must decide whether post-trial use is paywalled at all, and if so, exactly how (IAP vs. subscription vs. nothing) — silent paywalls or surprise IAPs would damage trust with the kind of user who chose a no-account app.
- [ ] "No account, no analytics" is a load-bearing privacy claim for a product that touches bedtime. Any future change (analytics SDK, push for re-engagement, A/B testing framework) breaks that claim and must be flagged before implementation.
- [ ] Maker tooling in the source includes Remotion (a React-based video framework) in the "Built With" rail. That is more naturally a marketing-video tool than a runtime stack for the iOS app; if the team rebuilds, the runtime stack is likely Swift / SwiftUI on top of Core Haptics, with Remotion only generating the launch video.
