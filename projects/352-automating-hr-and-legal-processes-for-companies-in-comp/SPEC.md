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

## Problem

A Russian SME without an in-house HR or legal team is repeating the same paperwork every time they hire, terminate, change terms, send on leave or run payroll: a Russian-Labor-Code-compliant contract template, a signed B2 order, a vacation schedule, a sick-leave flow. Today this is either a spreadsheet + a freelance HR consultant, or an expensive HRMS that does more than the SME needs. The poster wants an opinionated, Labor-Code-aware automation for the 80% case.

## Objective

Ship a Russian-Labor-Code-aware HR and legal automation for SMEs that drafts contracts, B2 orders, vacation and sick-leave flows and termination acts from a single employee record, signs them with a Russian e-signature, and stores them in a compliant archive.

## Target Users

- Russian SMEs with 10-200 employees and no in-house HR or legal lead.
- Russian tax-accounting firms serving 5-30 SMEs who want a defensible HR pipeline for clients.
- Russian HR freelancers who want a tool that produces Labor-Code-correct artefacts without re-checking the law on every job.

## MVP Scope

- Employee record: hire date, role, salary, contract type (TKD / GPD with strict caveats).
- Contract generator: Labor-Code-compliant TKD draft from role + salary + location.
- B2 (hire order), vacation schedule, sick-leave flow, termination act generators.
- Russian e-signature: CryptoPro CSP + RuToken issued signatures attached to the document hash.
- Document archive with 75-year retention aligned to Labor Code 419a-FZ requirements.
- Optional export pipeline for Kontur / SBIS / 1C:HRM integrations.
- No payroll engine in v1 (integration with the customer's existing payroll).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-f` follows the constraints in `352-.../SPEC.md` and the chosen stack (Next.js, Postgres, RuToken + CryptoPro CSP (digital signature)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- All generated artefacts carry a code-version stamp and a citation to the specific Labor Code article(s) invoked.
- No legal advice layer: the tool produces artefacts and cites the Code; a Russian labour-lawyer review is recommended in the onboarding flow.
- Per-employee archive retained for 75 years per 419a-FZ; storage backup tested quarterly.
