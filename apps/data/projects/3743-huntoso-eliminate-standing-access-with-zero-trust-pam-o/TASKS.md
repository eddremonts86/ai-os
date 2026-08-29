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

## Phase 0: Scaffold

- [ ] Define the multi-tenant Postgres schema: `tenants`, `users`, `policies` (role → approver → max window → justification rule), `elevations` (start, end, justification, approver, ledger-row hash).
- [ ] Stand up the Entra app registration with Graph API scopes for `RoleManagement.ReadWrite.Directory`, `AuditLog.Read.All`, `Application.Read.All`, and SCIM provisioning scopes.
- [ ] Provision the Huntoso console (Next.js) and the PAM-Pro policy engine (Go), deployed on Coolify.
- [ ] Wire OpenTelemetry export to a per-tenant collector so a customer can ingest into their SIEM.
- [ ] Build the connector that turns one Entra elevation request into one audit-ledger row, with tenant_id enforced at row level.
- [ ] Threat-model the cross-tenant path before any pilot; add a per-tenant integration test asserting no cross-tenant rows in any export.

## Phase 1: Core

- [ ] Implement the JIT elevation flow end-to-end: request → approver → Entra PIM grant → ledger row on grant start, ledger row on grant end.
- [ ] Build the approver surface (Slack / email / in-console approval) with bidirectional state to Entra PIM; an approved request must terminate in an Entra PIM API call, not in the policy engine.
- [ ] Build the policy surface: which roles require elevation, who is the approver for each, the maximum elevation window, the justification-tagging rules.
- [ ] Build the self-serve onboarding path: tenant ID in, first elevation out in ≤ 30 minutes from consent — matching the source's "minutes" claim.
- [ ] Build the evidence-export surface: a CSV / JSON package per framework (HIPAA, SOC 2, NIST), with per-event justification, approver, start, end, and a per-package content hash for tamper-evidence.
- [ ] Per-tenant integration test on every evidence-export path: assert no cross-tenant rows in any row of the package.

## Phase 2: Deploy

- [ ] Pilot with one external auditor per framework (HIPAA, SOC 2, NIST SP 800-53) — review the evidence package before publishing the "satisfies X out of the box" claim on the landing page.
- [ ] Build and publish the pricing calculator on the landing page: given a tenant size and an expected elevation volume, produce the annual price and a comparison to a CyberArk / BeyondTrust quote at the same volume.
- [ ] Define the first-wedge industry from the first five pilots — update the landing-page persona selector and the sales motion once the wedge is named.
- [ ] Run a load test simulating a customer with thousands of JIT requests per day, against Entra Graph API rate limits; bake mitigations (batched Graph calls, pre-cache) into the production console before the high-volume customer is signed.
- [ ] Create the GitHub repo, deploy the console and PAM-Pro engine to Coolify, and verify the deployment with the first paying tenant.

---

_Enriched 2026-08-29 from BetaList capture._
