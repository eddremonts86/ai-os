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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (simulator UI tokens, panic-button card, financial-barrier confirm/decline screen)
- [ ] Lock the subscription price at $19/month (mid-point of $15–30) with annual lock at $15/month
- [ ] Build the relapse-detector model card and the on-device vs server fallback matrix
- [ ] Decide the clinician-reviewed harm-reduction gate that gates simulator activation
- [ ] Provision Plaid Auth + Transactions; map US bank coverage for casino-counterparty detection

## Phase 1: Core

- [ ] Tapered simulator: cent-stakes casino-style app with mandatory pauses, brightness reduction, weekly dose taper
- [ ] Clinician-reviewed harm-reduction questionnaire before simulator activation; alternative path (breathing + balance check only) for users who fail the gate
- [ ] On-device relapse detector for casino app launches / screenshots (iOS Screen Time API or accessibility permission)
- [ ] Panic button card on every detector trigger: breathing exercise, balance check, one-tap call to a trusted person
- [ ] E2E-encrypted journal with a recovery phrase the user writes down at signup (never stored server-side)
- [ ] Anonymous signup: no email, no phone; trusted-confirmer is the only shared identifier
- [ ] Plaid bank/card linking + transfer-blocking with friend-confirmer invite
- [ ] Friend-confirmer approval: push notification with one-tap approve / decline; 24-hour revocation cool-off so the user cannot undo protection in a moment of weakness
- [ ] Read-only crypto-wallet verification + outbound-transfer blocking for casino counterparty addresses
- [ ] 30-day usage dashboard: triggers, interventions, dollars blocked, taper progress
- [ ] End-to-end test: anonymous signup → simulator setup → trusted-confirmer invite → financial barrier rule → detected casino app launch → panic button → friend declines transfer → journal entry

## Phase 2: Deploy

- [ ] Submit iOS + Android builds; resolve background-detection permission gaps before launch
- [ ] Stripe-backed subscription at $19/month with annual lock at $15/month
- [ ] Pilot 50 anonymous users with 90-day retention measurement
- [ ] Clinician review of taper outcomes and harm-reduction gate effectiveness at week 20
- [ ] Marketing landing page that names the three hypotheses (simulator + panic button + financial barrier) explicitly, so the author can recognise his own framing
- [ ] Post-pilot retrospective: revisit subscription price, harm-reduction gate, friend-confirmer liability language
