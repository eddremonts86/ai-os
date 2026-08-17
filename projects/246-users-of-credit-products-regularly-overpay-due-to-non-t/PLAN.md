---
id: "246"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
title: Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly-overp"
category: finance
date: "2026-01-18"
tags: [Finance, Legal, Other]
country: Russia
---
# Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.

## Tech Stack

- Python 3.11 + FastAPI for the backend API; chosen because the work is text-heavy (Russian-language contracts and statements, rule-based fee tagging, PDF parsing) and Python's document-parsing and NLP ecosystem is the strongest fit.
- pdfplumber + pypdf for credit-agreement and statement PDF parsing; openpyxl for CSV/XLS exports from Russian online-banking portals.
- PostgreSQL for stored reports, customer uploads metadata, and the fee-pattern catalogue (no transactional banking data is stored beyond what is needed to render a report).
- A rule engine (pure Python with a JSON-defined catalogue of fee patterns) for tagging transactions; no ML in the MVP because the patterns are explicit and auditability matters more than recall.
- React + Vite for the single-page upload and report viewer; the surface is small (upload, list of findings, PDF export) and the design direction in DESIGN.md fits a Stripe-style fintech UI.
- Self-hosted on a single VPS via Coolify; the MVP is small enough that a single container with PostgreSQL is sufficient.

## Architecture

The service runs as three pieces:

1. **Upload & intake** — the user uploads a statement (PDF/CSV/XLS) and, optionally, a credit-agreement PDF. Files are stored encrypted at rest, with a retention policy surfaced on the upload screen.
2. **Parser & tagger** — for statements, transactions are extracted and each line is matched against the fee-pattern catalogue (cash-advance commissions, SMS-banking fees, insurance add-ons, currency-markup spreads, penalty interest, account-maintenance fees). For credit agreements, headline rate, effective annual rate, tariff items, and additional-fee clauses are extracted by section.
3. **Report generator** — findings are grouped into an Advocate Report: each item carries a line citation from the source document, a plain-language explanation in Russian, and the trailing-12-month ruble total the customer paid for that item. The report is rendered to PDF.

The customer never sees an interactive dashboard in the MVP; the deliverable is a single PDF per upload, which keeps the architecture read-only and avoids building a multi-tenant account system before the value is validated.

## Milestones

- **M1 — Intake & storage.** Encrypted upload of statement + contract, retention policy on the upload screen, deletion-on-request endpoint.
- **M2 — Statement parsing.** Extract transactions from at least the three most common Russian online-banking export formats (Sberbank, Tinkoff, Alfa-Bank). Tag each line against the fee catalogue.
- **M3 — Contract parsing.** Extract headline rate, effective rate, tariff items, and additional-fee clauses from Russian retail credit agreements.
- **M4 — Advocate Report.** Render the findings into a Russian-language PDF with line citations and trailing-12-month ruble totals.
- **M5 — Validation.** Five Russian credit-product users run the service on a real statement and confirm the report names charges they did not previously recognize.

## Risks

- Document-format drift: Russian banks update their PDF statement templates without notice. The parser needs a per-bank test fixture set and a fallback to manual review when extraction confidence is low.
- Personal-data exposure: bank statements contain full account numbers and transaction history. Any breach is severe. The MVP must use encryption at rest, short retention (30 days default, configurable), and a documented deletion path.
- Regulatory boundary: the service must not cross into legal advice or formal dispute representation. Findings are descriptive, not prescriptive, and the report must not include language that could be read as a recommendation to sue.
- Pattern coverage: the fee-pattern catalogue is a curated list, not learned. It will miss fees it has not seen. The MVP must surface confidence ("this charge was tagged because it matches pattern X") rather than imply exhaustive coverage.
- Customer trust: Russians have a structural distrust of intermediaries in financial matters (see plan 249 in this corpus). The service must position itself as the customer's advocate, not a partner of any bank; copy and visuals must reinforce that.
