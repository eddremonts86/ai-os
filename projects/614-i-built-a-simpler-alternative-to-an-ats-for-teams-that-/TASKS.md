---
id: "614"
slug: i-built-a-simpler-alternative-to-an-ats-for-teams-that-
title: I built a simpler alternative to an ATS for teams that receive CVs by email
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0wp4/i_built_a_simpler_alternative_to_an_ats_for_teams/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, recruitment, cv-parsing, b2b, freemium]
scores:
  money: 6
  learn: 5
  fun: 5
tech: [Python, FastAPI, PostgreSQL, OpenAI API (CV extraction), IMAP/Graph email ingestion, Next.js]
---
# I built a simpler alternative to an ATS for teams that receive CVs by email

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` → `apps/614-i-built-a-simpler-alternative-to-an-ats-for-teams-that-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Connect to a single IMAP mailbox (the founder's own recruitment mailbox) and confirm new mail with CV attachments is detected.
- [ ] Implement the CV extraction pipeline: PDF/DOCX → text → LLM extraction → structured candidate record (experience, skills, technologies, languages, role context).
- [ ] Hand-parse 20–30 real CVs from the founder's own mailbox; record the share of extracted fields a recruiter leaves unchanged.
- [ ] Build the candidate list view with filters by skill, technology, language and role context.
- [ ] Build the per-candidate detail view with editable fields and the original CV alongside.
- [ ] Add Microsoft Graph support alongside IMAP so Microsoft 365 mailboxes work.
- [ ] Write the public sign-up flow for the free plan: no time limit, no payment details required.
- [ ] Onboard the first 5–10 small teams / recruitment agencies from the founder's network.
- [ ] Collect the honest feedback the poster is asking for: is "recruitment inbox → searchable CV library" a clear and useful proposition?
- [ ] Decide, from real usage, what plan limits (volume of CVs, seats, retention window) actually drive an upgrade — then define the paid tier around that limit.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Lúa generated this analysis automatically on 2026-08-15_