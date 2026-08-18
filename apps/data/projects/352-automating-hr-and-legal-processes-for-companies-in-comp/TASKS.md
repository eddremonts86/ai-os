---
id: "352"
slug: automating-hr-and-legal-processes-for-companies-in-comp
title: "Automating HR and legal processes for companies, in compliance with the Russian Labor Code"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-for-co"
category: career
date: "2025-10-29"
tags: [Career, Finance, Legal]
country: Russia
tech: [Next.js, Postgres, RuToken + CryptoPro CSP (digital signature), PDF generation (puppeteer + LaTeX templates), "Integration with Kontur / SBIS / 1C:HRM APIs"]
---
# Automating HR and legal processes for companies, in compliance with the Russian Labor Code

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-for-co` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/352-automating-hr-and-legal-processes-for-co/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, Postgres, RuToken + CryptoPro CSP (digital signature), and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Employee record with hire date, role, salary, contract type
- [ ] TKD contract generator with role + salary + location inputs
- [ ] B2 (hire order), vacation, sick-leave, termination act generators
- [ ] CryptoPro CSP + RuToken e-signature attachment per document
- [ ] 75-year archive aligned to 419a-FZ retention
- [ ] Optional export to Kontur / SBIS / 1C:HRM via API
- [ ] Pilot with 20 Russian SMEs, 12 months, Labour Inspectorate-readiness review

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, Postgres, RuToken + CryptoPro CSP (digital signature)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 352-automating-hr-and-legal-processes-f MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, Postgres, RuToken + CryptoPro CSP (digital signature) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
