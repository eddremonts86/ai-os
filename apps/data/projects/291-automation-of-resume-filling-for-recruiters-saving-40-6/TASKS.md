---
id: "291"
slug: automation-of-resume-filling-for-recruiters-saving-40-6
title: Automation of resume filling for recruiters — saving 40-60 minutes on each candidate
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/0s98al0y01-automation-of-resume-filling-for-recruit"
category: career
date: "2025-11-18"
tags: [Career, AI, Other]
country: Russia
tech: [Python (FastAPI), Postgres, Playwright browser automation, OpenAI API, hh.ru + SuperJob adapters, Telegram Bot API]
---
# Automation of resume filling for recruiters — saving 40-60 minutes on each candidate

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/automation-of-resume-filling-for-recruiters-saving-40-6/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] CV ingest: PDF, DOCX, PNG/JPG photo (OCR), pasted plain text.
- [ ] Parser pipeline: OCR → LLM field extraction → schema validation with confidence per field.
- [ ] Recruiter profile: hh.ru + SuperJob credentials (encrypted), audit log access.
- [ ] Playwright hh.ru flow: login → form fill → preview screenshot → recruiter approval.
- [ ] Playwright SuperJob flow: same shape as hh.ru.
- [ ] Telegram bot: forward CV chat message → return parsed card → tap to post.
- [ ] Per-recruiter audit log of every parse + post action.
- [ ] Field-edit UI: manual correction before posting, with the corrected value saved to improve future parses.
- [ ] Rate limit per recruiter and per job board to avoid bot detection.
- [ ] Personal-data purge endpoint (152-ФЗ compliance).
- [ ] Pilot onboarding kit: 30 recruiters, 5 industries, week-12 outcome review.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), Postgres, Playwright browser automation) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 291-automation-of-resume-filling-for-re MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), Postgres, Playwright browser automation errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
