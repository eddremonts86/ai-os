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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/833-automation-of-resume-filling-for-recruiters-saving-40-6/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the resume upload flow (PDF, DOCX) with a clear storage and retention story surfaced in the UI.
- [ ] Implement the field extractor for the fields the post implies (name, contact, experience, education, skills).
- [ ] Build the field-to-form proposal that maps extracted fields onto the candidate profile fields.
- [ ] Add the review screen where the recruiter confirms or edits each field before write.
- [ ] Add the per-candidate extraction log so the edit history can be reused on the next candidate.
- [ ] Measure time per candidate against the recruiter's actual baseline before quoting the 40 to 60 minute saving in any copy.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
