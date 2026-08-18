---
id: "215"
slug: healthcare-professionals-want-ai-for-diagnosis-document
title: "Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't prepare them and no existing tool is built for their workflow."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: health
date: "2026-03-12"
tags: [Health, AI, Documentation]
country: Brazil
tech: [Python, FastAPI, PostgreSQL, Whisper, Claude API, Vue.js]
---
# Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't prepare them and no existing tool is built for their workflow.

## Tech Stack

Python + FastAPI for the orchestration. PostgreSQL on a Brazilian cloud for the patient data. Whisper + a Portuguese-fine-tuned model for voice-to-text. Claude API for the drafting and differential suggestions. Vue.js for the clinician UI. Server located in Brazil for LGPD compliance.

## Architecture

Voice → Whisper → text → SOAP draft → clinician review → persistent note. Drug reference lookup against ANVISA data. Differential suggestions sourced from a Brazilian medical corpus. Per-clinician audit log of accepted vs ignored AI suggestions.

## Milestones

M0 — Portuguese voice-to-SOAP with 90% accuracy on real physician voice. M1 — drug reference lookup. M2 — differential diagnosis suggestion. M3 — 100 clinicians in pilot. M4 — public launch with a clear 'AI-assisted, not AI-decided' stance.

## Risks

Risk of being interpreted as a diagnostic device. Liability if the AI suggests a wrong drug or dose. LGPD obligations require strong data residency. Adoption requires a clinician to trust the output, which takes time. Brazil's regulatory environment for medical AI is in flux.

## Data Model

## Integrations

Python + FastAPI for the orchestration. PostgreSQL on a Brazilian cloud for the patient data. Whisper + a Portuguese-fine-tuned model for voice-to-text. Claude API for the drafting and differential suggestions. Vue.js for the clinician UI. Server located in Brazil for LGPD compliance.
