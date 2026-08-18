---
id: "285"
slug: the-problem-of-multi-platform-kyckyb-processes-in-finte
title: The problem of multi-platform KYC/KYB processes in fintech leading to specialist
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/bqzh0d2au1-the-problem-of-multi-platform-kyckyb-processes-i"
category: ai
date: "2025-10-29"
tags: [AI, Finance, Business, Legal]
country: France
tech: [NestJS API, TypeScript, Postgres, MinIO (S3-compatible), Onfido SDK, Stripe Connect, FranceConnect (OAuth), Docker on Scaleway]
---
# The problem of multi-platform KYC/KYB processes in fintech leading to specialist

## Tech Stack

- NestJS API in TypeScript for the master KYB graph and partner adapters.
- Postgres on Scaleway for entity records, UBO graph, partner-connector metadata.
- MinIO on Scaleway for encrypted document storage (KMS-managed bucket keys).
- Onfido SDK + API for UBO identity verification.
- FranceConnect OAuth for legal-representative sign-in.
- Stripe Connect, Powens, Treezor (and 1–2 others) as partner adapters in v1.
- Docker on Scaleway Kubernetes, deployed behind a Coolify-managed reverse proxy.

## Architecture

Single NestJS app: a core KYB module holds the master entity graph; per-partner adapters live as NestJS modules that consume the same core types and emit partner-shaped payloads. Document storage flows through a single uploader service that writes to MinIO and writes a pointer in Postgres. Webhooks from partners (e.g. Stripe Connect `account.updated`) flow back to update the entity status. GDPR right-to-erasure runs as a nightly job across every adapter.

## Milestones

1. **M0** — Spec freeze, master KYB schema, partner field-map doc for Stripe Connect. End of week 1.
2. **M1** — Entity onboarding UI, document upload, UBO capture. End of week 4.
3. **M2** — Onfido integration + Stripe Connect adapter (1 partner live). End of week 7.
4. **M3** — Two more partner adapters (Powens + Treezor). End of week 10.
5. **M4** — FranceConnect OAuth + status webhooks back to partners. End of week 13.
6. **M5** — GDPR erasure job + third-party pen test. End of week 16.

## Risks

- **Partner API instability** — Mitigation: contract tests in CI against partner sandbox; nightly canary ping to production partner APIs.
- **Document retention disputes** — a partner asks 'where is the KBIS for entity X'. Mitigation: audit log of every document access, accessible to the entity owner.
- **Sales cycle** — French fintechs are slow to adopt new compliance vendors. Mitigation: 60-day pilot with two reference customers before opening the platform.
