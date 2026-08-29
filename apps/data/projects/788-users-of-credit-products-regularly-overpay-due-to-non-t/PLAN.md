---
id: "788"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
title: Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly-overp"
category: finance
date: "2026-01-18"
tags: [Finance, Legal, Other]
country: Russia
tech: [Bun, Hono, Postgres, Tinkoff/YooMoney Open Banking sandbox, pdfplumber (Python sidecar), Resend, Fly.io (Frankfurt region)]
---
# Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.

## Tech Stack

- **Bun** as the runtime, because the work is small JSON APIs over a tight request loop and Bun's startup and per-request overhead suit a service that handles bursts of statement uploads.
- **Hono** for the HTTP layer, because the routing surface is small and Hono's middleware pattern handles file uploads, rate limiting and per-user auth without ceremony.
- **Postgres** as the system of record for parsed statements, findings and the tariff reference the engine checks against, deployed in a Russian-jurisdiction cloud so the user's data does not leave the country.
- **A Python pdfplumber sidecar** for parsing Russian bank PDF statements, because the formats are inconsistent and Python's PDF tooling is the most reliable starting point.
- **Tinkoff and YooMoney Open Banking sandboxes** for development, gated behind an explicit, separately-consented flow before any production connection.
- **Resend** for transactional emails such as the dispute-letter draft delivery, because the user reviews and sends from their own mailbox and a transactional email provider with clean deliverability is the simplest path.
- **Fly.io with the Frankfurt region** as the hosting choice, with explicit jurisdiction controls so the database volume stays inside the selected region and is not replicated to other regions.

## Architecture

The user uploads a statement through a Hono endpoint that accepts PDF, CSV or an Open Banking callback. PDFs go to the Python pdfplumber sidecar, which returns a structured line list; CSVs are parsed in-process in Bun; Open Banking callbacks are normalised through a per-bank adapter before they reach the findings engine.

The normaliser turns every parsed line into a row in the parsed_statements table with date, merchant, amount, category, fee flag and a recurring-charge marker derived from previous statements for the same product. The findings engine then runs a series of conservative checks: recurring fees above a small threshold, charges that do not match the tariff reference the user has selected for that product, late-payment patterns, insurance add-ons the user did not opt into and product features that the user has not used in the last 90 days. Each finding carries the source lines, the tariff reference, the reference date and a confidence flag.

The report is rendered server-side from a Markdown template that explicitly disclaims the advocate role and points to a financial adviser for binding advice. The dispute-letter helper takes the user's selected findings and drafts a letter in Russian using a per-finding template library; the user reviews and edits before sending. The Postgres instance lives in a Russian-jurisdiction region with encryption at rest and a deletion path that wipes a user's statements and findings on request. The hard parts are parsing accuracy across the published PDF formats, conservative flagging and the discipline of staying on the advocate side of the line rather than drifting into financial advice.

## Milestones

1. **M1 — Ingest and parse** — Hono upload endpoint, pdfplumber sidecar, CSV in-process parser, and the parsed_statements schema in Postgres.
2. **M2 — Normaliser** — per-bank adapter for CSV and Open Banking formats, recurring-charge marker derived from prior statements for the same product.
3. **M3 — Findings engine** — recurring-fee detection, tariff-mismatch detection, late-payment patterns, unused-feature detection, with confidence flags on every finding.
4. **M4 — Report template** — fixed Markdown report with the advocate-not-adviser banner and the tariff reference date on every finding.
5. **M5 — Dispute-letter helper** — per-finding template library in Russian, user-editable draft, Resend delivery of the draft to the user's own mailbox.
6. **M6 — Jurisdiction guardrail** — Postgres volume pinned to the Russian-jurisdiction region, deletion path enforced, and an audit log of where any data has flowed.

## Risks

- **PDF parsing fragility** — Russian bank PDF statement formats vary; an extractor that works for one issuer may silently fail on another, so per-issuer confidence flags must be visible.
- **Tariff reference drift** — bank tariffs change; a finding checked against an old tariff may be wrong today, and the report has to carry the reference date.
- **False-positive findings** — flagging legitimate fees as hidden erodes trust faster than missing a real one; the engine must be conservative and ask the user to confirm.
- **Drift into financial advice** — the report wording has to stay clearly on the advocate side of the line; a single phrase that reads as advice is a credibility cost.
- **Cross-region data flow** — without explicit jurisdiction controls, cloud providers may replicate the database to a non-Russian region; the architecture has to enforce the boundary.
- **Open Banking consent misuse** — connecting to a live bank on the user's behalf is high-trust; any production connection has to be a separate, explicit consent flow rather than bundled into the upload.
- **Encrypted-storage key management** — statement files are sensitive; losing the encryption key is a data-loss event the user cannot recover from.
