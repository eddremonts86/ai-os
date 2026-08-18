---
id: "667"
slug: how-much-should-i-charge-this-app
title: How much should I charge this app?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvn9t/how_much_should_i_charge_this_app/"
category: saas
date: "2026-08-16"
tags: [saas, consumer, focus, ios]
tech: [SwiftUI, Swift, Lottie, Supabase, StoreKit 2, TelemetryDeck]
---
# How much should I charge this app?

## Tech Stack

- **iOS app:** SwiftUI + Swift 5.10, iOS 16+ deployment target.
- **Companion animations:** Lottie + After Effects source files.
- **Backend:** Supabase (auth + the credits ledger + the cosmetic-catalog metadata).
- **Payments:** StoreKit 2 with auto-renewable subscriptions.
- **Analytics:** TelemetryDeck (privacy-respecting, no third-party tracking).

## Architecture

Single iOS app + a Supabase backend. The timer runs locally; only the credits ledger and the catalog are server-side.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-timer demo. End of week 1.
2. **M1 — Timer + panda companion.** End of week 3.
3. **M2 — Credits ledger + StoreKit 2 paywall.** End of week 5.
4. **M3 — Cosmetic catalog.** End of week 7.
5. **M4 — Public beta.** 200 TestFlight users. End of week 9.

## Risks

- **App Store discoverability** — the category is crowded; the panda hook alone may not be enough to differentiate in search.
- **Pricing hypothesis is unvalidated** — $4.99/month is a guess; the first 1,000 users will tell us if it lands.
