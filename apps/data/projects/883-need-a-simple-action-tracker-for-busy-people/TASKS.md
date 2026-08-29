---
id: "883"
slug: need-a-simple-action-tracker-for-busy-people
title: Need a simple action tracker for busy people
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/bngxaaugn1-need-a-simple-action-tracker-for-busy-pe"
  captured: "2025-10-25"
category: productivity
date: "2025-10-25"
tags: [Productivity]
country: UAE
wtp:
  raw: willing to pay for a monthly subscription (no amount stated)
  currency: USD
  period: month
  min: 0
  max: 0
  mrrMid: 0
tech: [Mobile (iOS + Android via React Native or Flutter), email + calendar + Slack ingestion via OAuth, on-device activity classifier, Node.js sync backend]
---
# Need a simple action tracker for busy people

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (daily-list card, action detail sheet, snooze / delegate modal, "what we store" privacy page)
- [ ] Lock the capture-rule list per source (Gmail, Outlook, Google Calendar, MS 365, Slack) and the classifier thresholds
- [ ] Publish the "what we store" privacy page before the first OAuth screen
- [ ] Decide whether v1 ships with one source (Gmail) or all three at launch (all-three is more compelling but triples the OAuth surface)
- [ ] Run willingness-to-pay research with 20 busy professionals in the UAE / similar markets to set the paid-tier price

## Phase 1: Core

- [ ] OAuth flows for Gmail + Google Calendar + Outlook + Microsoft 365 + Slack with read-only scopes; per-user token vault
- [ ] Backend sync jobs (cron + webhook) populate a normalised action store: unanswered emails > 48 h, missing RSVPs, dangling @-mentions, threads where the user was the last responder
- [ ] Mobile app (React Native or Flutter): single daily-list view, action card with source link back to email / event / message, one-tap done / snooze 1 day / delegate to N
- [ ] Push notifications when a new action surfaces mid-day
- [ ] Thumbs-up / thumbs-down feedback on every surfaced action so the classifier learns from the user's dismissals
- [ ] Classifier rule layer in v1; ML model slot replaces it per-user once ≥ 50 feedback events have been collected
- [ ] Free tier: 50 captured actions per month, one inbox source; paid tier: multi-source, unlimited captures, snooze, delegate, weekly digest
- [ ] Privacy posture: only short snippet + source link persisted; in-flight parsing for everything else
- [ ] End-to-end test: connect Gmail + Google Calendar → seed an unanswered email + a missing RSVP → daily list shows both → mark one done, snooze the other → classifier learns from thumbs-up / thumbs-down

## Phase 2: Deploy

- [ ] Stripe-backed free + paid monthly subscription; annual lock
- [ ] Submit iOS + Android builds; resolve any OAuth / push-notification permission gaps
- [ ] Pilot 50 busy professionals in the UAE / similar markets; measure weekly active rate, capture accuracy, free-to-paid conversion
- [ ] Willingness-to-pay follow-up after pilot; adjust paid-tier price if needed
- [ ] Post-pilot retrospective at week 18: revisit classifier thresholds, capture-rule list per source, free-tier gate (50 actions per month), and the "add manually" vs "classifier learns" trade-off
