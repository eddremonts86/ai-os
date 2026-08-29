---
id: "757"
slug: healthcare-professionals-want-ai-for-diagnosis-document
title: "Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't scale and tools feel too technical. Need a simple, clinically relevant path."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/6p14z4bz51-healthcare-professionals-want-ai-for-dia"
  captured: "2026-03-12"
category: education
date: "2026-03-12"
tags: [Education, Health, AI, Other]
country: Brazil
wtp:
  raw: $80/month
  currency: USD
  period: month
  min: 80
  max: 80
  mrrMid: 80
tech: [Web (TypeScript/React), clinical-scenario LMS backend (Node.js), OpenAI or Anthropic API for AI-fluency role-play, video hosting, certificate generator]
---
# Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't scale and tools feel too technical. Need a simple, clinically relevant path.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (module player tokens, exercise runtime UI, certificate PDF layout)
- [ ] Lock the curriculum: 12–16 modules mapped to the five clinician-stated needs (image interpretation, documentation, patient explanation, guideline lookup, scheduling/reporting)
- [ ] Sign clinician-reviewer contract with the author (Gilson Leal, Brazil) documenting his role and the 1% equity proposal
- [ ] Pick the first CME jurisdiction (US ACCME, Brazilian CNA, or EU EACCME) and start the recognition process
- [ ] Provision Stripe-backed billing at $80/month with monthly cancel and annual lock at $65/month

## Phase 1: Core

- [ ] Module player: video + transcript + inline term-definition panel
- [ ] First three modules live: image interpretation with an AI second opinion; discharge summary draft from a chart; patient-friendly explanation at a sixth-grade reading level
- [ ] Exercise runtime with an embedded AI tool per module; clinicians perform the task, not a multiple-choice quiz
- [ ] "Bring your own API key" mode for hospital systems with their own enterprise LLM contract
- [ ] Zero-technical-prerequisite UX check: every term used in a lesson is defined inline the first time it appears
- [ ] PDF certificate generator with the clinician's name, module title, completion date, and a verification URL a hospital or CME body can hit
- [ ] Per-module clinician-only discussion board with moderation and clinical-lead pinning
- [ ] Mobile-first responsive layout; every exercise completable in ≤ 15 minutes on a 6-inch screen
- [ ] AI-output review: every exercise artefact is benchmarked against a clinician-advisor rubric before the certificate is issued (no certifying a clinically wrong answer)
- [ ] End-to-end test: clinician signup → first module → exercise → certificate → CME submission flow (US ACCME or Brazilian CNA path)

## Phase 2: Deploy

- [ ] Pilot 100 clinicians; measure 90-day retention and exercise completion rates per module
- [ ] Expand to residency-program team plans with a shared progress dashboard
- [ ] Add the remaining 9–13 modules over the first six months, prioritised by per-module demand from the discussion board
- [ ] Add a second CME jurisdiction once the first is recognised
- [ ] Post-pilot retrospective at week 18: revisit subscription price, CME coverage, exercise-length assumptions
