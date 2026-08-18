---
id: "291"
slug: automation-of-resume-filling-for-recruiters-saving-40-6
title: Automation of resume filling for recruiters — saving 40-60 minutes on each candidate
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/career/0s98al0y01-automation-of-resume-filling-for-recruit"
category: career
date: "2025-11-18"
tags: [Career, AI, Other]
country: Russia
tech: [Python (FastAPI), Postgres, Playwright browser automation, OpenAI API, hh.ru + SuperJob adapters, Telegram Bot API]
---
# Automation of resume filling for recruiters — saving 40-60 minutes on each candidate

## Tech Stack

- Python (FastAPI) for the parse + post service.
- Postgres on Hetzner for recruiter profiles, candidate sessions, parse audit log.
- Playwright for hh.ru and SuperJob posting automation (logged-in session).
- OpenAI API for CV parsing and field mapping.
- Telegram Bot API for the chat-forward workflow.
- Redis for rate-limit and session state.
- Cloudflare for webhook ingress and bot protection.

## Architecture

FastAPI service: ingest endpoint receives a CV file or chat-pasted text. A parser pipeline (OCR if needed → LLM field extraction → schema validation) produces a structured candidate card. The post step opens a Playwright session, logs in as the recruiter (credentials stored encrypted per recruiter), fills the form, and returns a preview screenshot for recruiter approval. The Telegram bot wraps the same API: forward a chat message → get a card → tap to post.

## Milestones

1. **M0** — Spec freeze, hh.ru Playwright flow for one job board with manual approval. End of week 1.
2. **M1** — CV parsing for PDF + DOCX (no OCR yet). End of week 4.
3. **M2** — SuperJob adapter + OCR for photo CVs. End of week 7.
4. **M3** — Telegram bot wrapper + audit log dashboard. End of week 10.
5. **M4** — Pilot with 30 recruiters; measure time-saved self-report. End of week 14.

## Risks

- **hh.ru UI changes** — Mitigation: snapshot tests in CI against the live form; nightly canary parse-and-dry-run.
- **Recruiter credential compromise** — Mitigation: credentials encrypted at rest, session-scoped, never logged in plaintext; 2FA recommended.
- **152-ФЗ compliance** — Mitigation: explicit data-retention policy; per-recruiter purge endpoint; legal review.
