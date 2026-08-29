---
id: "894"
slug: automating-hr-and-legal-processes-for-companies-in-comp
title: "Automating HR and legal processes for companies, in compliance with the Russian Labor Code"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-for-co"
  captured: "2025-10-16"
category: career
date: "2025-10-16"
tags: [Career, Finance, Legal]
country: Russia
wtp:
  raw: "documentation portion alone valued at 900,000 RUB (~$9,800) per 100-employee company"
  currency: RUB
  min: 900000
  max: 900000
  period: one-shot
  mrrMid: 0
tech: [Next.js, TypeScript, Go (API), PostgreSQL, "1C:Enterprise integration", Garant / ConsultantPlus legal-data feed]
---
# Automating HR and legal processes for companies, in compliance with the Russian Labor Code

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An HR director or compliance officer at a Russian company of 50–500 employees gets a single platform that automates the Russian Labor Code compliance surface end-to-end: staffing tables, payroll-fund math, contracts and orders generation, education and professional-standards tracking, labor-protection logs, inspection reporting, and bidirectional 1C integration. The documentation module alone is worth 900,000 RUB (~$9,800) per 100-person company per Sergey's tender reference; the full platform layers the other modules on top. Compared with breaking the task across several smaller services (Sergey's current workaround) or paying consultants on each update cycle, the value is a single system of record that tracks the current law.

## Target Users

| Stakeholder | Why they care |
|---|---|
| HR director at a 50–500 person Russian company | Owns the documentation cycle, currently pays consultants or absorbs compliance risk; the platform consolidates the surface. |
| Legal / compliance officer | Needs contracts, orders, and policies to reflect the current Russian Labor Code; the legal-data feed is the trust mechanism. |
| CFO / finance director | Needs the tariff grid + payroll-fund modeling and clean 1C sync; the FOT modeling is the immediate value for them. |
| BPO / outsourcing provider | Manages HR compliance for multiple Russian SMB clients; consolidates per-client work onto a single platform. |
| Labor inspector (indirect) | Benefits from a clean, inspection-ready export; not a customer but the trust asset the platform is built around. |
| Industry association | Could use the platform to publish reference templates for an industry agreement, accelerating adoption. |

## Jobs To Be Done

1. **Functional job — HR director** — Generate the documentation package an inspector would request in one click, not as a stitched PDF.
2. **Functional job — HR director** — Model a tariff-grid or staffing-table change and see the payroll-fund impact before committing.
3. **Functional job — HR director** — Track per-role education and professional-standards requirements and get an alert before they lapse.
4. **Functional job — CFO** — Sync staffing and payroll data to 1C without double entry.
5. **Emotional job — HR director** — Stop dreading the next legislative update and the documentation churn it triggers.
6. **Risk-management job — compliance officer** — Be able to prove that every contract and order on file reflects the current Russian Labor Code.

## Success Metrics

- **Activation:** median time from signup to first staffing table imported from 1C is under 2 hours.
- **Documentation cycle time:** median time from staffing-table update to inspection-ready export drops from days to under 1 hour.
- **Legal-data freshness:** ≥ 95% of generated contracts and orders reference the current Russian Labor Code text as of the legal-data feed's last sync.
- **Tariff-grid modeling:** ≥ 60% of tariff-grid changes are modeled in the platform before being committed to 1C.
- **Education tracking coverage:** ≥ 80% of required professional-standard credentials are tracked with expiry alerts in the first 90 days.
- **Inspection-readiness score:** a self-audit metric (every required document exists, every required signature is on file, every required log is current) ≥ 95% at any point in time for an active company.
- **1C reconciliation:** zero reconciliation breaks on staffing-table or payroll sync between the platform and 1C across the first 100 syncs.

## Pricing & Monetization

Per-company pricing, sized to the documentation module's market value. A reasonable band: 30,000–60,000 RUB/month for a 50–500 person company, with the upper end for companies in heavily-regulated industries (construction, manufacturing, mining) where the inspection surface is broader. Annual contract at 20% off. The documentation module alone is the wedge — Sergey named 900,000 RUB (~$9,800) as the documentation-only tender value, which sets the ceiling the platform has to justify before the other modules are evaluated.

## Competitive Landscape

- **1C:Enterprise HR modules (1C:ЗУП, 1C:ЗУП КОРП)** — the system of record for payroll at most Russian companies; covers some of the surface but the contract / policy generation and the inspection-reporting layer are thin.
- **Kontur, SBIS, Tinkoff HR** — Russian SaaS for SMB compliance and reporting; each covers a slice (electronic document flow, reporting) but none has the integrated staffing-table-to-policy pipeline.
- **Garant, ConsultantPlus** — the legal-data reference products; they are inputs to the platform, not competitors.
- **HR consultancies and BPO providers** — the human-services alternative Sergey explicitly rejects as "not a systemic solution."
- **SAP SuccessFactors, Workday, BambooHR** — global HR suites; out of reach on price and out of scope on Russian-Labor-Code specifics for a Russian SMB.

## Risks & Open Questions

- [ ] Whether the legal-data feed (Garant or ConsultantPlus) can be integrated under terms that allow template generation without exposing raw feed content. The fee structure and the redistribution terms are the most material commercial decisions in v1.
- [ ] Whether the 1C integration can be maintained across 1C:Enterprise version upgrades. 1C is the system of record and a broken sync during a version upgrade is a critical failure for the customer.
- [ ] Whether the per-month pricing (30,000–60,000 RUB) is the right shape, or whether the documentation-only module should be sold separately as an annual subscription (closer to the 900,000 RUB tender reference Sergey names) and the broader platform layered on later.
- [ ] Whether the inspection-readiness score is a credible signal to a labor inspector, or whether the inspector will always want to see the underlying documents and treat the score as marketing. The platform must hold up under scrutiny, not just under self-audit.
- [ ] Whether the post's author (Sergey) is reachable for design-partner feedback; the post exposes a Telegram contact.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-for-co) · **Category:** career · **Tags:** Career, Finance, Legal
