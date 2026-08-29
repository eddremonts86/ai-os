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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A therapist in India can run a session — in-person or via Google Meet — and Kith listens in the background, transcribes with clinical context, and produces a clinically specific SOAP note within a minute, while keeping audio deleted after transcription, PHI field-encrypted, and every doctor's patients isolated at the row level under DPDP 2023.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Independent therapists | Want SOAP notes off their plate without giving up control of patient data. |
| Clinical psychologists | Need medication-name and clinical-term accuracy, not generic transcription. |
| Small clinics | Need per-therapist row-level isolation and a shared roster without cross-doctor leakage. |
| Therapy-practice admins | Need scheduling, reminders, and patient management on the same compliance perimeter. |
| Patients | Want a clinician who is present in the session, not typing notes. |

## Jobs To Be Done

1. **Functional job** — Turn a 50-minute therapy session into a clinically specific SOAP note within a minute of session end.
2. **Emotional job** — Stop dreading the post-session paperwork and be fully present with the patient.
3. **Social job** — Look like a clinician who runs a tight, modern practice without burning out.

## Success Metrics

- **Time saved:** median SOAP-note time drops from ~25 minutes to ≤ 2 minutes per session within the first month.
- **Note quality:** ≥ 90% of generated SOAP notes are accepted by the therapist without rewrite (or with light edits only).
- **Compliance:** zero PHI incidents and zero row-level leakage events in the first 12 months.
- **Activation:** ≥ 70% of signed-up therapists complete their first ambient session within 14 days.
- **Plan mix:** ≥ 30% of paid therapists upgrade from Free to Pro within 60 days; ≥ 10% upgrade to Ultra within 90 days.

## Pricing & Monetization

Three tiers exactly as published on the source page: Free (5 sessions/month, 50 min each, in-person only), Pro ($20/month, 60 sessions, 90 min, online with bring-your-own Teams/Zoom/Meet link), Ultra ($50/month, unlimited sessions, 120 min, in-session suggestions, auto-generated meeting link, direct patient email). Annual billing offers 2 months free.

## Competitive Landscape

- **Manual SOAP notes** — slow, error-prone, and pulls the clinician out of the session.
- **Generic transcription (Whisper, Otter)** — no clinical context, no SOAP structure, no DPDP posture.
- **US-only ambient-AI scribe tools** (Abridge, Nabla, Suki) — comparable product shape but priced for US payers and not built around India compliance.
- **Practice-management suites (Practice Fusion, SimplePractice)** — strong on scheduling and billing but no ambient scribe.
- **DIY Notion / Sheets + Whisper** — possible but no row-level isolation, no clinical prompts, no audit trail.

## Risks & Open Questions

- [ ] Confirm the DPDP 2023 audit posture (data residency, sub-processor list, breach-notification SLA) before launch.
- [ ] Decide the consent-capture flow for first-time patient recordings and store the consent receipt with the transcript.
- [ ] Validate that the in-session suggestions feature (Ultra) does not introduce hallucinated homework or talking points the therapist did not actually say.
- [ ] Confirm the row-level isolation holds under clinic-shared-roster scenarios where an admin should see metadata but not clinical content.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49487976) · **Category:** show-hn · **Tags:** Show HN,Health Tech,Therapists,AI Notes,Compliance
