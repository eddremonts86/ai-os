---
id: "747"
slug: a-gambling-addict-hasnt-been-able-to-quit-online-casino
title: "A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. He has three hypotheses for solving his own problem. Willing to pay $15–30/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/dopyur7701-a-gambling-addict-hasnt-been-able-to-qui"
  captured: "2026-04-20"
category: psychology
date: "2026-04-20"
tags: [Psychology, Other]
country: USA
wtp:
  raw: $15–30/month
  currency: USD
  period: month
  min: 15
  max: 30
  mrrMid: 22.5
tech: [Mobile (iOS + Android via React Native or Flutter), bank/card linking via Plaid, AI relapse-detection on device screenshots or app usage, end-to-end encryption of all journal data]
---
# A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. He has three hypotheses for solving his own problem. Willing to pay $15–30/month.

## Tech Stack

- **Mobile:** React Native or Flutter, iOS + Android from one codebase; on-device ML model for screenshot/app-launch classification.
- **Bank / card linking:** Plaid Auth + Transactions for US bank coverage; crypto-wallet integration via wallet-connect-style signature verification (read-only, blocking on outbound transfers).
- **AI relapse detection:** on-device classifier that fires on casino-app launch or screenshot-of-casino, with a small server-side fallback for users who grant screenshot permission; no screenshot data leaves the device unless the user explicitly opts into cloud backup.
- **Financial barrier:** Plaid Transfer rails for blocking; friend-confirmer approval via push notification + one-tap approve/decline; revocation requires a 24-hour cool-off so the user cannot undo the protection in a moment of weakness.
- **Encryption:** end-to-end journal with a key only the user holds (recovery phrase at signup, written down, not stored server-side); trusted confirmer sees only their own notifications.
- **Subscription:** Stripe-backed $19/month (mid-point of $15–30 author range) with annual lock at $15/month.

## Architecture

```
User device (iOS / Android)
   ┌──────────────────────────────────────────┐
   │ React Native app                         │
   │  • Tapered simulator (cent-stakes)       │
   │  • On-device relapse detector            │
   │  • Panic button → breathing / balance /  │
   │    call trusted person                    │
   │  • E2E-encrypted journal                  │
   │  • Subscription state (Stripe)            │
   └──────────────────────────────────────────┘
        │
        │ (events only, never screenshots)
        ▼
   Server (typed events)
        │
        ├─▶ Plaid  ◀──▶ Bank/card linking + transfer blocking
        ├─▶ Crypto-wallet verifier (read-only)
        └─▶ Push  ◀──▶ Trusted confirmer: approve / decline
```

## Milestones

1. **M0 — Spec freeze.** Simulator mechanics (stake size, pause rules, brightness taper), relapse-detector model card, financial-barrier rule schema. End of week 2.
2. **M1 — Tapered simulator.** Cent-stakes casino-style app with mandatory pauses, brightness taper, weekly dose reduction; clinician-reviewed harm-reduction gate before activation. End of week 5.
3. **M2 — Panic button.** On-device detector for casino app launches / screenshots; one-tap breathing, balance check, trusted-person call. End of week 8.
4. **M3 — Financial barrier.** Plaid bank/card linking; friend-confirmer invite + approve/decline; 24-hour revocation cool-off. End of week 11.
5. **M4 — Crypto coverage.** Read-only wallet verification; outbound-transfer blocking for casino counterparty addresses. End of week 14.
6. **M5 — Pilot.** 50 anonymous users, 90-day retention measured, clinician review of taper outcomes. End of week 20.

## Risks

- **On-device screenshot detection on iOS.** Apple restricts background screen capture; the detector may need iOS Screen Time API or a user-granted accessibility permission that Apple has not consistently approved for addiction apps. Build a fallback (foreground-only detection with a clear "open this app when you feel the urge" CTA) before relying on background detection.
- **Tapered simulator as a trigger.** Cent-stakes casino UX could re-trigger heavy gamblers and worsen outcomes. Gate activation behind a clinician-reviewed "harm-reduction vs harm-creation" questionnaire and offer a non-casino alternative (breathing + balance check only) for users who fail the gate.
- **Friend-confirmer liability.** If a confirmer declines a transfer and the user finds another channel, the friend may feel responsible. Document the boundary clearly: the confirmer approves *this transfer*, not the user's broader behaviour; provide a one-tap "I need to step back" off-ramp for the confirmer.
- **Plaid coverage for casino merchant codes.** Not every US issuer exposes gambling MCCs; the financial barrier must work for the user's actual cards, not a curated list. Build a "card not covered" honest fallback (the app blocks the urge + offers a human hotline) instead of pretending the card is protected.
