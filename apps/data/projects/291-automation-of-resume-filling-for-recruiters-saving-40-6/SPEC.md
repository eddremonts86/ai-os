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

## Problem

Russian recruiters (in-house and agency) routinely fill out candidate profiles on job boards (hh.ru, SuperJob, internal ATS) by hand — copying from a CV PDF or a chat, pasting into each field. The title quantifies the loss: 40–60 minutes per candidate, repeated across every system the recruiter posts to. A recruiter handling 5–10 candidates a day loses most of their working time to data re-entry rather than to sourcing or interviewing.

## Objective

Ship a recruiter assistant that takes a CV (PDF, DOCX, photo of paper CV, or pasted plain text) and posts the candidate into the target job board(s) in under 5 minutes, with the recruiter reviewing the parsed fields before submission. Outcome: a recruiter handles 4–5× more candidates per day with the same headcount.

## Target Users

Russian in-house recruiters and agency recruiters (especially IT, retail, blue-collar staffing) handling 5–20 candidates a week. Recruiters comfortable with hh.ru and SuperJob as the primary surfaces. Secondary: small Russian ATS vendors who want a candidate-ingest API without building the parsing themselves.

## MVP Scope

Multi-format CV ingest: PDF, DOCX, PNG/JPG photo (OCR), Telegram chat-pasted text. Parser that returns structured fields (name, contacts, experience, education, skills, languages, expected salary) with confidence per field. One-click post to hh.ru and SuperJob via Playwright automation, with the recruiter seeing the form pre-filled and approving. Telegram bot for recruiter workflows: forward a CV chat message → parsed candidate returned as a Telegram card → one tap to post. Per-recruiter audit log of every parse + post.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/career/0s98al0y01-automation-of-resume-filling-for-re` follows the constraints in `291-.../SPEC.md` and the chosen stack (Python (FastAPI), Postgres, Playwright browser automation). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect hh.ru and SuperJob ToS — automation is via logged-in session, not API abuse. No credential sharing between recruiters; each recruiter logs into their own account in Playwright. No storage of candidate personal data beyond what is needed for the active session — purge after the recruiter deletes the candidate. Russian-language only in v1.
