---
id: "888"
slug: universal-tracking-service-for-all-mobile-devices
title: Universal tracking service for all mobile devices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/kiv6i361e1-universal-tracking-service-for-all-mobil"
category: other
date: "2025-10-22"
tags: [Other]
country: Russia
tech: [Native iOS (Swift, FindMy + CoreLocation background modes), Native Android (Kotlin, Fused Location Provider + foreground service), React + TypeScript admin dashboard, Postgres + Drizzle ORM, Coolify, Stripe metered billing]
---
# Universal tracking service for all mobile devices

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A user with mixed-OS devices — iPhone and Android in the same household, or one person switching phones — registers every device once and sees them all on a single map, with one "Locate now" and one "Ring" action that work across both ecosystems. Basic functionality is free forever; the platform charges a per-recovery fee only when a locate action actually returns a fresh location within the agreed window and the user marks it as a successful find.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Mixed-OS household user | Find My is iOS-only, Find My Device is Android-only; needs one dashboard that spans both. |
| Frequent forgetter | Forgets the phone at home or in the car; wants a one-tap locate, not per-OS app setup. |
| Small-business owner | Tracks company-issued iOS + Android tablets and phones; same fragmentation pain, higher willingness to pay. |
| Privacy-conscious user | Wants a tracker that is explicit about background-location limits and does not sell location data. |

## Jobs To Be Done

1. **Functional job** — Locate a lost phone (or any registered device) from a single web dashboard, regardless of OS, with one tap.
2. **Emotional job** — Stop worrying about the moment of "where is my phone" being a 10-minute setup across multiple apps; stop paying for tracking subscriptions that work on only one OS.
3. **Social job** — Be able to recommend a tracker to family / colleagues that works for whatever device they happen to own, instead of "well, you have an iPhone, so use Find My."

## Success Metrics

- **Activation:** ≥ 60% of new signups register ≥ 1 device within 7 days; ≥ 30% register ≥ 2 devices (proves the cross-OS value).
- **Locate success rate:** ≥ 70% of "Locate now" actions return a fresh location within 60 seconds (subject to OS background-location constraints).
- **Recovery rate:** ≥ 40% of "Locate now" actions are marked as successful recoveries by the user — the metric that justifies the per-recovery fee.
- **Free-tier retention:** ≥ 50% of free-tier users remain active 6 months after signup (proves the free tier is genuinely useful, not a teaser).
- **Pay-for-result satisfaction:** opt-in survey shows ≥ 80% of users who paid a per-recovery fee agree the fee was "worth it for finding my device."

## Pricing & Monetization

- **Free forever:** register unlimited devices, see last-known location on the map, ring a device, basic dashboard.
- **Pay-per-recovery:** $2 per successful recovery (where "successful" = the locate returned a fresh ping within 60 seconds AND the user marked it as a recovery). A 30-day cooldown per device prevents accidental double-charges.
- **Pro subscription ($5/month, deferred to v2):** would include geofence alerts, location history (30-day), and family / multi-user workspaces.
- Stripe metered billing for the per-recovery fee; the platform never auto-charges for a locate the user did not mark as a recovery.

## Competitive Landscape

- **Find My (Apple) + Find My Device (Google)** — the incumbents; free, OS-native, but cross-OS households have to use both, which is exactly the pain.
- **Life360** — cross-OS family location; subscription-only, no pay-for-result, social features the user did not ask for.
- **Tile / AirTag-style Bluetooth trackers** — work across OSes but require the lost device to be near another user's phone; useless if the phone is at home and the user is at work.
- **Prey / Lookout / Cerberus** — anti-theft suites, cross-OS, but pitched at theft recovery with continuous tracking; over-engineered for "I forgot my phone at home."
- **Carrier-provided family location (Verizon Smart Family, T-Mobile FamilyWhere)** — limited to carrier customers, US-only, no cross-OS unification.
- **Honest tracking apps (the "find my phone with a map" niche)** — many exist; almost all require a paid subscription even for the basic "where is my phone" use case, which is the friction the user explicitly wants to avoid.

## Risks & Open Questions

- [ ] Confirm Apple's background-location policy allows the "force a fresh ping" behavior the "Locate now" action depends on; if Apple rejects the app or restricts the API, the iOS experience degrades to "last-known location" and the recovery metric drops.
- [ ] Validate Google's Fused Location Provider + foreground service combination survives Android 14 / 15 background restrictions; if it does not, the Android app must use a different foreground-service classification, which changes Play Store review.
- [ ] Decide whether Russian users' location data is stored inside Russia (152-FZ compliance); if yes, the platform needs a regional deployment, which is out of scope for v1 unless the pilot cohort requires it.
- [ ] Establish the per-recovery cooldown window (proposed 30 days) so an honest "I found my phone" tap does not double-charge if the user opens the app twice; the rule must be visible in the UI before the user marks a recovery.
- [ ] Confirm the privacy policy and the "we do not sell your location data" claim can survive a third-party privacy audit; the platform's reputation depends on it, and one breach of trust destroys the category.
