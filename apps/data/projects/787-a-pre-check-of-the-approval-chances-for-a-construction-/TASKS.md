---
id: "787"
slug: a-pre-check-of-the-approval-chances-for-a-construction-
title: A pre-check of the approval chances for a construction project with the Australian council before making significant investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/realty/38t2m50py1-a-pre-check-of-the-approval-chances-for"
category: realty
date: "2026-01-18"
tags: [Realty, Legal, AI, Other]
country: Australia
tech: [SvelteKit, TypeScript, Postgres, Playwright sidecar (Node), NSW Planning Portal + Victorian Planning Schemes + data.gov.au APIs, PDF text extraction (pdf-parse), Self-hosted on a single VPS, no Coolify]
---
# A pre-check of the approval chances for a construction project with the Australian council before making significant investments

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/787-a-pre-check-of-the-approval-chances-for-a-construction-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the SvelteKit address-entry flow and the report endpoint that resolves an address to a council and a state
- [ ] Define the Postgres schema for controls, addresses and reports with the audit log of which controls were checked per report
- [ ] Implement the structured-data path against the NSW Planning Portal and Victorian Planning Schemes APIs for the controls they expose
- [ ] Add the pdf-parse pipeline for planning scheme PDFs with a per-PDF text-confidence flag surfaced on the report
- [ ] Stand up the Playwright sidecar in its own process with health checks so a portal change does not crash the report endpoint
- [ ] Write the fixed Markdown report template with the pre-check-not-assessment banner and the confidence-level wording
- [ ] Add the "could not verify" flagging on items the tool could not read from public data, instead of guessing
- [ ] Implement the honest-coverage guardrail so the tool refuses an address outside its supported councils and surfaces the supported list on the entry page
- [ ] Add a "last verified" date on every report so the user knows the age of the underlying public data
- [ ] Schedule an off-host Postgres backup so the single-VPS deployment is not a single point of failure

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
