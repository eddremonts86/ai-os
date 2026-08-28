---
id: "833"
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
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automation of resume filling for recruiters — saving 40-60 minutes on each candidate

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. The resume parser runs as a worker alongside the API; document OCR and extraction are not bundled into the SPA. Same stack as the rest of the AI-OS apps so the upload flow, field proposal, and review screen ship alongside the other corpus apps.

## Architecture

The recruiter uploads a resume; a worker parses it and extracts the fields. The recruiter-facing app renders the proposed fields onto the candidate profile fields the ATS or spreadsheet actually has and asks for confirmation per field. A short log records the edits so the recruiter can re-use them on the next candidate.

```
resume upload (PDF / DOCX)
        ↓
worker parses and extracts fields
        ↓
field-to-form proposal onto candidate profile
        ↓
recruiter confirms / edits each field
        ↓
logged extraction per candidate
```

## Milestones

1. Resume upload that accepts PDF and DOCX, with a clear storage and retention story surfaced in the UI.
2. Field extraction for the fields the post implies (name, contact, experience, education, skills).
3. Field-to-form proposal that maps extracted fields onto the candidate profile fields.
4. Review screen where the recruiter confirms or edits each field before write.
5. Per-candidate extraction log so the edit history can be reused on the next candidate.

## Risks

- The 40 to 60 minutes saving is the post's claim; marketing copy must not assert it without an MVP measurement.
- Resume data is personal data; storage, retention, and consent need a clear story before any upload flow ships.
- Country of submission is Russia; resume conventions and language handling must not assume English-only input.
- No ATS is named in the post; integration depth cannot be promised until one ATS is selected from interviews.
