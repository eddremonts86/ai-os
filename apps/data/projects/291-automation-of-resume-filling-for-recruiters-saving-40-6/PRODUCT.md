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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Russian recruiter hands the assistant a CV and a target job board; the form is filled and the recruiter just confirms — 40–60 minutes saved per candidate.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Russian in-house recruiter | Handles 10+ candidates a week; needs to stop retyping the same fields into hh.ru. |
| Russian agency recruiter | Billable hours are eaten by data entry; needs volume. |
| Russian small ATS vendor | Wants a CV-ingest API without building the parser themselves. |

## Jobs To Be Done

1. **Functional job** — Get a candidate parsed and posted to a job board in under 5 minutes.
2. **Emotional job** — Stop feeling like a typist instead of a recruiter.
3. **Social job** — Show a hiring manager that 8 candidates were sourced and posted today, not 2.

## Success Metrics

- Parse-to-post latency ≤ 5 minutes for the median candidate.
- Field-extraction accuracy ≥ 90% on the top 5 fields (name, contacts, last role, skills, expected salary).
- Recruiter time saved — measured at ≥ 40 min/candidate via before/after self-report.
- Weekly active recruiter retention ≥ 70% after week 4.

## Pricing & Monetization

Per-recruiter subscription: ₽1,990/month for unlimited candidates posted. Starter: ₽990/month for 30 candidates. Annual discount 20%.

## Competitive Landscape

- hh.ru + SuperJob bulk upload — limited to CSV imports, no parsing of free-form CVs.
- Standalone CV parsers (Sova, DaXtra) — strong parsing but no posting automation.
- Recruiter agency workflow tools (Huntflow, Friendwork) — full ATS, expensive for solo recruiters.

## Risks & Open Questions

- [ ] hh.ru / SuperJob anti-bot enforcement — Mitigation: human-paced Playwright, randomised delays, no parallel sessions per account.
- [ ] CV quality variance — Russian CVs range from formal to handwritten. Mitigation: OCR + LLM with explicit confidence scoring; manual edit step for low-confidence fields.
- [ ] Personal-data law (152-ФЗ) — Mitigation: per-recruiter consent flow; purge-on-delete endpoint; explicit data-retention disclosure.

---

_Source:_ [manual](https://problemhunt.pro/en/career/0s98al0y01-automation-of-resume-filling-for-recruit) · **Category:** career · **Tags:** Career, AI, Other
