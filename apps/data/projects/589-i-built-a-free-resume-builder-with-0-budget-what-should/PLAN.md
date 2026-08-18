---
id: "589"
slug: i-built-a-free-resume-builder-with-0-budget-what-should
title: I built a free Resume Builder with $0 budget. What should I do next?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voij6e/i_built_a_free_resume_builder_with_0_budget_what/"
category: saas
date: "2026-08-14"
tags: [saas, consumer, free, career]
tech: [Next.js, TypeScript, jsPDF, Supabase]
---
# I built a free resume builder with $0 budget, what should I do next

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **PDF export:** client-side via jsPDF or pdf-lib; no server round-trip.
- **Templates:** 3-5 JSON-defined templates; one is enough to start.
- **Optional account:** Supabase (auth, the saved resumes per user).

## Architecture

Single web app, client-side PDF export, no backend required for the core builder. An account is optional, for users who want to save multiple resumes.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the existing resume builder re-documented. End of week 1.
2. **M1 — $0-budget launch playbook.** r/cscareerquestions, r/resumes, university career-centre partnerships. End of week 3.
3. **M2 — 2 additional templates + ATS-friendly PDF export.** End of week 5.
4. **M3 — Optional account for saved resumes (Supabase).** End of week 7.

## Risks

- **$0 marketing budget** — every channel must be free; the playbook is the real work.
- **No monetisation** — success is measured in traffic and word-of-mouth, not revenue.
