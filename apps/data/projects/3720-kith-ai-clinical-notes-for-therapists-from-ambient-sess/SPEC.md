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

## Problem

Therapists and clinical psychologists spend hours per week writing SOAP notes after every session — time that should go to patients. The Show HN post links to [https://www.kith.space](https://www.kith.space), an "AI Clinical Workspace for Therapists" that listens in the background during in-person or online sessions, transcribes with clinical-aware context (medication names and clinical terms come through correctly), and produces clinically specific SOAP notes within a minute of the session ending. The product page lists a free plan with 5 sessions/month and 50-minute sessions, a Pro plan at $20/month for 60 sessions and online-session support, and an Ultra plan at $50/month for unlimited sessions and in-session suggestions that update homework and talking points as the session progresses. The landing page explicitly markets India-compliance: PHI field-encrypted, audio deleted after transcription, DPDP 2023 compliant, row-level security per doctor.

## Objective

Ship an AI clinical-notes workspace for therapists and clinical psychologists that turns ambient session audio (in-person or online, via Google Meet) into clinically specific SOAP notes within a minute, with calendar sync, patient management, and PHI safeguards that meet India's DPDP 2023 from day one. The MVP must cover ambient recording, AI SOAP-note generation, scheduling, and the free/Pro/Ultra pricing tiers described on the source page.

## Target Users

- Primary: independent therapists and clinical psychologists in India running 5–60+ sessions a month who want SOAP notes off their plate.
- Secondary: small clinics with multiple therapists who need per-therapist row-level isolation and a shared patient roster (without leaking patients between doctors).
- Tertiary: therapy-practice admins who need patient management and appointment scheduling tied to the same compliance perimeter.

## MVP Scope

- Ambient transcription that runs locally on the therapist's device (in-person) and via an auto-admitted notetaker bot in Google Meet (online).
- AI-written SOAP notes ready within a minute of session end; clinical-context aware so medication names and clinical terms come through correctly.
- Patient and appointment management with recurring sessions, conflict-free scheduling, and a 15-minute in-app reminder before each booked slot.
- Calendar sync (Google Calendar) with a bring-your-own Teams / Zoom / Meet link on Pro, and a generated-and-emailed meeting link on Ultra.
- Three pricing tiers exactly as published: Free (5 sessions, 50 min each, in-person), Pro ($20/mo, 60 sessions, 90 min, online), Ultra ($50/mo, unlimited, 120 min, in-session suggestions, auto meeting link, direct patient email).
- DPDP-2023-aligned data handling: PHI field-encrypted, audio deleted after transcription, row-level security so each doctor only sees their own patients.

## Design Direction

See `DESIGN.md` for this project's design tokens. The therapist's primary surface is a "today's patients" list with one-tap to start the ambient recorder. Neutral clinical palette (off-white, near-black, one accent for the record/active state, one muted accent for warnings). One display family for headings, one text family for body, and tabular numerals for session duration. No third-party tracking; the consent copy for ambient recording must be visible on the patient screen-share.

## Constraints

- Audio must be deleted after transcription; raw audio must never leave the device in plaintext.
- Per-therapist row-level security is non-negotiable — the SQL queries must enforce doctor_id at the row level, not at the application layer.
- Patient consent for recording must be captured before the first ambient session.
- In-session suggestions (Ultra feature) must update in the clinician's language, not the patient's, and must be off by default in Pro.
- PHI fields (notes, transcripts, diagnoses) must be encrypted at the column level; metadata (timestamps, durations) need not be.
