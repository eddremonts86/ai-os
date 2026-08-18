---
id: "205"
slug: a-gambling-addict-hasnt-been-able-to-quit-online-casino
title: "A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. Need a long-term accountability system that adapts to relapse."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: health
date: "2026-04-20"
tags: [Health, Habits, Mental Health]
country: USA
tech: [Swift, Kotlin, Firebase, Cloud Functions, Twilio, GPT-4-class]
---
# A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. Need a long-term accountability system that adapts to relapse.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/205-a-gambling-addict-hasn-t-been-able-to-qu/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Swift, Kotlin, Firebase, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: USA`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for USA.
- [ ] Provision the iOS/Android signing pipeline and confirm TestFlight/Internal Testing build distribution.
## Phase 1: Core

- [ ] SMS-based daily check-in with streak state
- [ ] Plaid integration with gambling merchant flag list
- [ ] Late-night geofence with consent
- [ ] Third-strike escalation workflow
- [ ] Sponsor / family contact onboarding with explicit consent
- [ ] Privacy policy and data retention rules
- [ ] On-call rota for human escalation
- [ ] First 100 self-referred users in pilot

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Swift, Kotlin, Firebase) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 205-a-gambling-addict-hasn-t-been-able- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Swift, Kotlin, Firebase errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
