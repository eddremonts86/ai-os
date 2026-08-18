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

## Tech Stack

- Next.js
- Postgres
- RuToken + CryptoPro CSP (digital signature)
- PDF generation (puppeteer + LaTeX templates)
- Integration with Kontur / SBIS / 1C:HRM APIs

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for career runs as a single backend service on the stack (Next.js, Postgres, RuToken + CryptoPro CSP (digital signature)) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-f` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, Postgres, RuToken + CryptoPro CSP (digital signature)) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-f`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`352-automating-hr-and-legal-processes-f`), pin dependencies for Next.js, Postgres, RuToken + CryptoPro CSP (digital signature), and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-f` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Labor Code change lag.** A 2025/2026 amendment is a maintenance burden; a code-version stamp and a quarterly review cycle is mandatory.
- **CryptoPro CSP access.** Customers without a CryptoPro-licensed signature token cannot use the e-sign path; manual signature + scan upload is the fallback, with a flag that the artefact is not yet legally signed.
- **HR vs legal advice boundary.** Saying 'this contract is correct' is legal advice; the wording must be 'this contract follows template version X, which cites articles Y and Z'.
