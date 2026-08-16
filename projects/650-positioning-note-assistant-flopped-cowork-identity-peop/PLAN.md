---
id: "650"
slug: positioning-note-assistant-flopped-cowork-identity-peop
title: "Positioning note: “assistant” flopped; “Cowork + identity + people memory” landed better"
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Telephony (Twilio or similar), email (SES/Postmark), identity-aware LLM orchestration, a CRM-style memory store, a calendar provider, a Cowork-style UI for the human user to oversee and intervene.

## Architecture

Inbound phone/email → router → LLM with identity + memory context → response (speak / send) with optional human-approval gate. Cowork UI exposes live activity and intervention controls.

## Milestones

- [ ] Phone-number provisioning + inbound handler
- [ ] Email provisioning on a custom domain
- [ ] Identity model: agent acts as user with disclosure
- [ ] People-memory store
- [ ] Calendar + double-booking handling
- [ ] Cowork UI for human oversight
- [ ] Positioning copy tested against the failed "assistant" wording

## Risks

- Legal exposure on identity disclosure (deepfake / impersonation) is jurisdiction-dependent.
- Latency on phone calls is a hard product bar; telecom-grade.
- "AI for humans" positioning is fragile; the brand has to be carefully built.
