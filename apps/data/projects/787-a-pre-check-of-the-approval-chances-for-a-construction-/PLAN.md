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

## Tech Stack

- **SvelteKit with TypeScript** for the report UI and the address-entry flow, because the pages are short, the data is structured and SvelteKit's server routes map cleanly to the report-generation endpoint.
- **Postgres** for the indexed planning controls, the per-address cache and the audit log of which controls were checked for which report.
- **A Playwright sidecar** in Node for state portals that require a browser session, isolated in its own process so a portal change does not crash the report endpoint.
- **NSW Planning Portal, Victorian Planning Schemes and data.gov.au APIs** as the structured-data sources for the councils the MVP honestly covers, with a clear extension path to other states.
- **pdf-parse** for extracting searchable text from the published planning scheme PDFs that do not expose a clean API.
- **A single VPS** for hosting, deployed without Coolify, because the deployment shape is a small internal tool with a clear boundary and a known data pipeline.
- **Plain Markdown reports** with a fixed template so the pre-check wording stays consistent across addresses and councils.

## Architecture

An address entered into the SvelteKit form is resolved to a council and a state via a public geocoder; the report endpoint then composes the data needed for that council. Where the state exposes a structured API, the endpoint queries it directly; where the data lives in PDFs or behind a portal that requires a session, the endpoint dispatches the request to the Playwright sidecar and returns the extracted text.

The Postgres schema has three top-level tables: a `controls` table that holds the indexed planning controls per council, an `addresses` table that caches the resolved council and overlays per address and a `reports` table that records which controls were checked for each report along with the confidence flags. Every report row carries the wording template and the controls it considered, so an auditor can replay the report later and see exactly what the tool did and did not check.

The report itself is a Markdown document rendered from a fixed template. The template names each control, states the apparent compliance, indicates the confidence level and lists the items the tool could not verify. The template also embeds the explicit "this is a pre-check, not a DA assessment" banner so the wording is consistent on every report. The hard parts are honest coverage, the Playwright sidecar's robustness when a portal changes, and the discipline of flagging "could not verify" rather than guessing.

## Milestones

1. **M1 — Address resolution and council selection** — address lookup, geocoder integration, and the Postgres table of councils the MVP honestly supports.
2. **M2 — Structured-data path** — direct queries to the NSW and Victorian APIs for the controls they expose, and the per-council control normaliser that turns their formats into one shape.
3. **M3 — PDF extraction path** — pdf-parse pipeline for planning scheme PDFs, with a per-PDF text-confidence flag.
4. **M4 — Playwright sidecar** — isolated worker for portal queries that require a browser session, with health checks so a portal failure is visible.
5. **M5 — Report template and confidence flags** — fixed Markdown report, the pre-check-not-assessment banner, and the "could not verify" flagging on items the tool could not read.
6. **M6 — Honest-coverage guardrail** — the tool refuses an address outside its supported set and surfaces the list of supported councils on the entry page.

## Risks

- **Coverage overclaim** — pretending to cover councils whose data the tool cannot read would destroy trust faster than no coverage at all; the honest-coverage guardrail has to be enforced, not optional.
- **Portal breakage** — a state planning portal changing its layout can silently degrade the sidecar's queries; health checks need to detect a drop in extraction quality, not just a connection error.
- **PDF text quality** — published planning scheme PDFs are sometimes scanned images; pdf-parse will return empty strings without warning, and the tool must surface that.
- **Confidence inflation** — a confidence level that is always high is a lying confidence level; the template must be willing to flag "could not verify" rather than guess.
- **Reading like a planning opinion** — the report wording has to stay clearly on the pre-check side of the line; a single phrase that reads as legal advice is a credibility cost the tool cannot afford.
- **Stale public data** — public planning data can lag a council resolution by weeks; the tool has to surface a "last verified" date on every report.
- **Single-VPS single-point-of-failure** — without Coolify, the running deployment has to be monitored and the database has to be backed up off-host on a schedule.
