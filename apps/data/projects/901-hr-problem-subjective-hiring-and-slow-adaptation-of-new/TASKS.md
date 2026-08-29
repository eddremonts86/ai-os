---
id: "901"
slug: hr-problem-subjective-hiring-and-slow-adaptation-of-new
title: "HR problem: subjective hiring and slow adaptation of new employees"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/otnixd2971-hr-problem-subjective-hiring-and-slow-ad"
  captured: "2025-10-08"
category: career
date: "2025-10-08"
tags: [Career]
country: Russia
wtp:
  raw: "5,000–10,000 RUB ($55–110) per hired employee"
  currency: USD
  min: 55
  max: 110
  period: hire
  mrrMid: 82.5
tech: [Scenario-based assessment engine, Node.js backend, PostgreSQL, LLM-assisted resume structuring with human review, ATS integrations via webhook, Onboarding task orchestration]
---
# HR problem: subjective hiring and slow adaptation of new employees

## Phase 0: Scaffold

- [x] Capture the problem from ProblemHunt, including the mis-hire costs and the 1–6 month adaptation window
- [ ] Write DESIGN.md (candidate comparison view, assessment submission, onboarding track)
- [ ] Legal review of permitted selection criteria; confirm gender and age are excluded from every filter
- [ ] Pick the first role to build a task library for, and confirm it with the HR author
- [ ] Write the assessment rubric for that role, with worked examples at each level

## Phase 1: Core

- [ ] ATS webhook integration: pull candidates from the existing screening pipeline
- [ ] Resume structuring: extract and organise claims for a recruiter to review, with no automated rejection
- [ ] Scenario task delivery for the first role, with a stated time expectation for the candidate
- [ ] Submission capture and rubric scoring, with the rubric visible to both recruiter and candidate
- [ ] Side-by-side candidate comparison built from rubric evidence, not a single composite score
- [ ] Inter-rater agreement report: novice versus senior recruiter scoring the same submissions
- [ ] Audit trail per candidate decision, retained for the legal record
- [ ] Onboarding track: practical tasks with reviewers and dates, replacing text and video courses
- [ ] Productivity checkpoint at defined intervals, measured against the 1–6 month baseline
- [ ] Per-hire billing at 5,000–10,000 RUB, triggered on a confirmed hire
- [ ] End-to-end test: one opening from ATS intake through assessment, hire and first onboarding checkpoint

## Phase 2: Deploy

- [ ] Pilot on one department's openings with the HR author
- [ ] Measure candidate drop-off caused by adding the assessment step
- [ ] Compare time to productivity against the pre-pilot cohort
- [ ] Decide on a second role's task library only after the first one shows rater agreement
