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

## Tech Stack

Chosen so the compliance perimeter (DPDP 2023) is built into the stack rather than bolted on after the fact.

- **Next.js:** the therapist workspace — today's patients, the ambient recorder, SOAP notes, and scheduling.
- **Postgres:** patients, sessions, appointments, and notes, with row-level security enforced per doctor at the SQL layer.
- **Twilio:** the online-session audio path for the auto-admitted notetaker bot in Google Meet.
- **Google Calendar API:** calendar sync and conflict-free scheduling.
- **Whisper (self-hosted):** local ambient transcription with clinical-context prompting.
- **DPDP-compliant storage:** PHI fields column-encrypted; raw audio deleted after transcription.

## Architecture

- **Ambient recorder:** runs locally on the therapist's device in person; a notetaker bot joins Google Meet for online sessions.
- **Transcription pipeline:** audio flows to the self-hosted Whisper, then into SOAP-note generation within a minute of session end.
- **Clinical layer:** medication names and clinical terms come through correctly, in the clinician's language.
- **Practice service:** patients, recurring appointments, 15-minute reminders, and the tier limits (5 / 60 / unlimited sessions).
- **Compliance perimeter:** PHI column encryption, per-doctor row-level security, and consent receipts captured before the first recording.

## Milestones

1. **M0 — In-person loop.** Local ambient recording produces a SOAP note within a minute on one therapist's device.
2. **M1 — Online sessions.** The Google Meet notetaker bot and Google Calendar sync ship; Pro-tier mechanics (60 sessions, 90 minutes) work.
3. **M2 — Clinic hardening.** Row-level security holds under shared rosters, consent capture is wired, and the DPDP audit posture is documented.
4. **M3 — Tier launch.** Free / Pro / Ultra go live exactly as published, with in-session suggestions off by default in Pro.

## Risks

- **DPDP audit gaps:** data residency, the sub-processor list, and the breach-notification SLA must be confirmed before launch.
- **Row-level leakage:** application-layer checks are not enough; the SQL queries must enforce doctor_id themselves.
- **Audio retention mistakes:** any path that keeps raw audio past transcription breaks the core promise.
- **Hallucinated suggestions:** Ultra's in-session homework and talking points must not invent what the therapist never said.
- **Free-tier cost:** ambient transcription on the free tier needs cost guardrails to stay viable at scale.
