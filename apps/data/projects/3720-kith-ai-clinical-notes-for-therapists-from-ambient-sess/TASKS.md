---
id: "3720"
slug: kith-ai-clinical-notes-for-therapists-from-ambient-sess
title: Kith – AI clinical notes for therapists from ambient session audio
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487976"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Health Tech, Therapists, AI Notes, Compliance]
tech: [Next.js, Postgres, Twilio, Google Calendar API, Whisper (self-hosted), DPDP-compliant storage]
---
# Kith – AI clinical notes for therapists from ambient session audio

## Phase 0: Scaffold

- [x] Read the Show HN post and landing page to confirm the Free/Pro/Ultra tiers, the DPDP 2023 claim, and the ambient in-person and Meet flows
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md tokens for the "today's patients" surface with the one-tap recorder
- [x] Scaffold the Next.js workspace, the Postgres schema with doctor_id on every clinical table, and the Whisper job skeleton

## Phase 1: Core

- [ ] Implement local ambient recording on the therapist's device with consent capture before the first session
- [ ] Build the self-hosted Whisper transcription with clinical-context prompting for medication names and clinical terms
- [ ] Generate SOAP notes within a minute of session end
- [ ] Enforce row-level security per doctor_id in SQL, including shared-roster clinic scenarios
- [ ] Add Google Calendar sync, recurring appointments, and the 15-minute in-app reminder
- [ ] Implement the Google Meet notetaker bot and the Pro and Ultra session limits
- [ ] Column-encrypt PHI fields and delete raw audio immediately after transcription

## Phase 2: Deploy

- [ ] Confirm the DPDP audit posture: data residency, sub-processor list, and breach-notification SLA
- [ ] Launch the three tiers exactly as published (Free 5 sessions at 50 min, Pro $20 for 60 online, Ultra $50 unlimited)
- [ ] Ship Ultra in-session suggestions off by default in Pro and in the clinician's language

---

_Generated automatically by Lúa on 2026-08-29_
