---
id: "3743"
slug: huntoso-eliminate-standing-access-with-zero-trust-pam-o
title: Huntoso – Eliminate standing access with zero-trust PAM on Entra ID
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/huntoso?utm_campaign=startup-181548&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [TypeScript (Next.js for console + Entra app), Go (PAM-Pro policy engine), Microsoft Entra ID (PIM/SCIM integration), PostgreSQL (audit ledger), OpenTelemetry (audit export)]
---
# Huntoso – Eliminate standing access with zero-trust PAM on Entra ID

## Tech Stack

The stack is picked for this problem — Entra-native zero-trust PAM with an evidence-grade audit ledger — not from a default.

- **Console + Entra app:** TypeScript on Next.js (the customer's admin surface and the multi-tenant SaaS console). Entra app registration + Graph API client libraries handle PIM, audit log, and SCIM calls.
- **PAM-Pro policy engine:** Go, exposed as a service the console calls. Policy evaluation (role → approver → max elevation window → justification rule) lives in this service; the policy store is the same PostgreSQL cluster the audit ledger uses, with row-level tenant isolation.
- **Identity surface:** Microsoft Entra ID — directly addressed via Graph API + PIM. The product does not replace Entra as the system of record; it issues Entra PIM elevations and writes events to its own ledger.
- **Audit ledger:** PostgreSQL with per-tenant row-level security. Evidence rows are immutable: append-only with a content hash, written once, queryable for export.
- **Export / observability:** OpenTelemetry to a customer-side collector (for SIEM ingest); CSV / JSON evidence exports per framework (HIPAA, SOC 2, NIST SP 800-53).
- **Deployment:** Coolify-managed containers for the console and the PAM-Pro engine; the Entra app registration is the only thing in the customer's tenant.

## Architecture

```
┌──────────────────────┐         ┌─────────────────────────────────────┐
│  Customer's Entra    │         │  Huntoso multi-tenant SaaS console  │
│  ID tenant           │  Graph  │  (Next.js + Go PAM-Pro + Postgres)  │
│                      │◀───────▶│                                     │
│  - PIM elevations    │  API    │  - Admin / approver UI              │
│  - Audit logs        │         │  - Policy engine                    │
│  - SCIM              │         │  - Audit ledger (row-tenant)        │
└──────────────────────┘         └─────────────────────────────────────┘
                                            │
                                            │ OpenTelemetry export
                                            ▼
                                ┌──────────────────────────┐
                                │  Customer SIEM / auditor │
                                │  evidence package        │
                                └──────────────────────────┘
```

- The admin / approver / policy-engine and audit ledger live in the Huntoso tenant. Nothing is deployed in the customer's infrastructure; the Entra app registration is the only customer-side footprint.
- Every privileged role action is implemented as an Entra PIM elevation grant. The product never writes to Entra audit logs directly — it reads them to reconcile against its own ledger.
- The audit ledger is the system of record the auditor queries; it is the only artifact Huntoso exports.
- Cross-tenant isolation is enforced in PostgreSQL row-level security on `tenant_id`; every read path that produces an evidence package filters by tenant.

## Milestones

1. **M0 — App registration and first PIM elevation.** Stand up the Entra app registration with the Graph API scopes for PIM, audit log, and SCIM. Issue one elevation end-to-end (request → approval → grant → ledger row). The customer's IAM admin can complete this in ≤ 30 minutes, matching the source's "minutes" claim.
2. **M1 — Policy engine + multi-tenant console.** Policy surface for which roles require elevation, who approves, max elevation window, justification rules. Multi-tenant isolation enforced in Postgres. Approver experience shipped (request lands, approver clicks, grant issued).
3. **M2 — Evidence export and one external auditor review per framework.** CSV / JSON export per framework (HIPAA, SOC 2, NIST SP 800-53); reviewed by at least one external auditor for each framework before the "satisfies X out of the box" claim is published.
4. **M3 — Pricing calculator and published cost claim.** A landing-page calculator that, given a tenant size and elevation volume, produces an annual price and a comparison baseline against CyberArk / BeyondTrust quotes. The source's "reduce total cost" claim is published only after the calculator has been used by the first five customers.

## Risks

- **Entra API rate limits** under a customer with thousands of JIT requests per day. Mitigate with batched Graph calls and a pre-cache of role-eligible principals; validate under a load test before publishing per-event pricing.
- **Cross-tenant data leakage** if a bug surfaces role membership across tenants. Mitigate with PostgreSQL row-level security on `tenant_id`, threat modelling on the policy-evaluation path, and a per-tenant integration test that asserts no cross-tenant rows in any exported package.
- **Auditor evidence requirements vary inside each framework.** A single export shape per framework does not cover every auditor; the export must support a per-event deep-link and a per-package justification field the auditor can sample independently.
- **Pricing comparison baseline.** The "reduce total cost" claim is comparative; without a published calculator that names the comparison baseline, the wedge is rhetorical and unsellable. The calculator must exist before the claim is published.
- **First-wedge industry.** The source does not name an industry wedge (HIPAA / SOC 2 / NIST span both regulated and lightly regulated businesses); the first five pilots need to define the wedge or the sales motion becomes two motions in one product.
