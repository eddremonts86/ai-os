---
tags: ["saas", "consumer", "focus", "ios"]
tech: ["SwiftUI", "Swift", "Lottie", "Supabase", "StoreKit 2", "TelemetryDeck"]
id: "667"
slug: how-much-should-i-charge-this-app
title: How much should I charge this app?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvn9t/how_much_should_i_charge_this_app/"
category: saas
date: "2026-08-16"
---## Phase 0: Scaffold

- [ ] Create a fresh Xcode project `apps/667-how-much-should-i-charge-this-app/` (SwiftUI app lifecycle, iOS 16+ deployment target)
- [ ] Initialize git and add `.gitignore` excluding `*.xcuserdata`, `DerivedData`, `.build`
- [ ] Write SPEC.md and the matching DESIGN.md tokens (timer + panda visual identity)
- [ ] Configure the Lottie animation pipeline: After Effects source → bodymovin export → SwiftUI wrapper
- [ ] Provision a Supabase project with the auth schema and the credits-ledger table
- [ ] Wire StoreKit 2 configuration files and the auto-renewable subscription product IDs
- [ ] Set up TelemetryDeck and verify the analytics events reach the dashboard

## Phase 1: Core

- [ ] SwiftUI single-timer screen with the animated panda (Lottie, After Effects source)
- [ ] Reward logic: credits on completed sessions (Supabase credits ledger)
- [ ] Supabase auth + credits ledger + cosmetic-catalog metadata
- [ ] StoreKit 2 paywall: free / $4.99 monthly / $29.99 annual
- [ ] Cosmetic catalog: companion skins, session themes
- [ ] TelemetryDeck integration with privacy-respecting event names

## Phase 2: Deploy

- [ ] App Store submission + TestFlight beta
- [ ] Supabase production environment + Stripe webhook reconciliation (if cross-platform later)
- [ ] 200-UserFlight beta with a feedback form
- [ ] Post-mortem at week 9
