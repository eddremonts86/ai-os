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

## Tech Stack

- **Mobile:** React Native or Flutter, iOS + Android, single daily-list view, one-tap done / snooze / delegate per action.
- **Ingestion:** OAuth integrations for Gmail, Outlook, Google Calendar, Microsoft 365, and Slack; backend cron pulls deltas and writes to a normalised action store.
- **Classifier:** a small server-side rule layer for v1 (unanswered emails > 48 h, missing RSVPs, dangling @-mentions) with a slot for an ML model that learns from the user's thumbs-up / thumbs-down feedback.
- **Sync:** Node.js backend with push notifications so the daily list refreshes when a new action surfaces mid-day (e.g. a Slack thread the user was tagged in goes quiet).
- **Privacy:** source content is parsed in-flight; only a short snippet + the source link is persisted; a "what we store" page is required before the first OAuth screen.
- **Billing:** Stripe-backed free + paid monthly subscription; annual lock.

## Architecture

```
User device (iOS / Android)
   ┌────────────────────────────────────────────┐
   │ Mobile app (single daily-list view)        │
   │  • Done / snooze / delegate per action     │
   │  • Source link back to email / event / msg │
   │  • Thumbs-up / thumbs-down feedback        │
   └────────────────────────────────────────────┘
        │
        │  push (new action surfaced)
        ▼
   Node.js backend
   ┌────────────────────────────────────────────┐
   │  • OAuth token vault (per user, per source)│
   │  • Sync jobs (cron + webhook)              │
   │  • Classifier (rules + ML slot)            │
   │  • Action store (normalised actions)       │
   │  • Stripe billing                          │
   └────────────────────────────────────────────┘
        │
        ├─▶ Gmail / Outlook API
        ├─▶ Google Calendar / MS Graph
        └─▶ Slack API
```

## Milestones

1. **M0 — Spec freeze.** Capture-rule list per source, classifier thresholds, privacy / data-storage policy. End of week 2.
2. **M1 — Gmail + Calendar ingestion.** OAuth flow, normalised action store, daily list renders unanswered emails and missing RSVPs. End of week 5.
3. **M2 — Mobile app.** React Native (or Flutter) app with one-tap done / snooze / delegate, push notifications on new actions. End of week 8.
4. **M3 — Slack + Outlook / MS 365.** OAuth flow for Slack and Microsoft; classifier extends to dangling @-mentions and missing Outlook RSVPs. End of week 11.
5. **M4 — Classifier feedback.** Thumbs-up / thumbs-down on every surfaced action; ML model slot takes over from the rule layer for users with ≥ 50 feedback events. End of week 14.
6. **M5 — Pricing + launch.** Willingness-to-pay research with 20 busy UAE / similar-market professionals; paid tier live; free-tier usage gate at 50 actions per month. End of week 18.

## Risks

- **Classifier accuracy is the product.** A daily list full of false positives ("this Slack thread needs a reply" when it does not) will be uninstalled within a week. Ship the thumbs-up / thumbs-down feedback loop in v1, not v2, and gate the ML slot on ≥ 50 feedback events per user so the model has signal.
- **Privacy posture before OAuth.** Users must see a clear "what we store" page before granting Gmail / Slack access. A buried privacy policy on the OAuth consent screen is a churn event and a trust-killer; ship the page first, the OAuth second.
- **Pricing without a stated number.** The author has not stated a willingness-to-pay amount; pricing the paid tier requires research, not a guess. Run a willingness-to-pay survey with 20 similar busy professionals before locking the price.
- **No manual log vs the "add this myself" gap.** If the classifier misses an action the user actually had to remember, the app is incomplete. Decide whether v1 includes an "add manually" path or whether the classifier must learn it — the trade-off shapes the UX and the classifier's feedback loop.
