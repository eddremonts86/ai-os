---
id: "853"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/lhvgiz7hs1-problem-of-access-to-loans-for-immigrant"
category: other
date: "2025-11-06"
tags: [Immigration, Finance, Legal, Other]
country: Portugal
tech: [Astro, TypeScript, Go (chi), PostgreSQL, Pinecone (vector index), Anthropic Claude API, Plaid EU (sandbox), Coolify, Docker]
---
# Problem of access to loans for immigrants in the EU

## Tech Stack

- **Astro** for the applicant-facing intake and readout pages, because the user journey is a multi-step form with mostly static content and one server-rendered personalised readout, where Astro's islands model avoids shipping a large client-side framework.
- **TypeScript** end to end so the rule library data shape and the readout schema are enforced at compile time across the editor and the runtime.
- **Go with the chi router** for the retrieval and readout-generation service, because rule retrieval over a versioned library is a small number of well-typed operations where Go's standard library and concurrency model are well matched.
- **PostgreSQL** as the primary store for rule records (versioned), intake profiles, generated readouts and audit logs; relational shape fits the versioned rule library better than a document store.
- **Pinecone (vector index)** as the secondary matcher over the rule library, so a free-text profile description can be matched to the right rule records without relying on keyword search alone.
- **Anthropic Claude API** as the LLM that turns the retrieved rule records into a personalised narrative readout, gated by a per-request cost budget and a cache keyed on the profile hash.
- **Plaid EU (sandbox)** for an optional bank-account-link path used only when the applicant explicitly opts in and consents, so the rule library's local-credit-history criterion can be checked honestly rather than guessed.
- **Coolify** for hosting, on a single container for the MVP, with the rule library kept in a managed PostgreSQL volume for backups.
- **Docker** for local development parity and for the production container image.

## Architecture

The applicant-facing intake is an Astro page that accepts residency-permit type and remaining validity, length of stay in Portugal, current income source and amount, language, existing local credit accounts, and the lending category the applicant wants to assess. Submission posts to the Go service, which performs two parallel retrieval steps: a PostgreSQL structured query for the permit-type and income-source combinations the rule library has records for, and a Pinecone vector query for the free-text profile description. The two streams are then reconciled, duplicate rule records collapsed, and the surviving set ordered by how many of the submitted fields each record covers.

Each retrieved rule record carries its version and the source pointer (the Portuguese or EU regulation the rule references). The narrative generator then assembles a personalised readout naming the lending categories the applicant is likely eligible for now, the documents each will require, the typical refusal drivers and a sequenced gap-closure plan. The Anthropic Claude API call is gated by a per-request cost budget and cached against the profile hash, so repeated runs of the same profile do not multiply the bill, and the cached response carries the rule-record versions it was generated against.

The operator-facing rule editor is an Astro route protected by a single-admin role, backed by the Go service with a separate set of endpoints that write to the rule-records table. Edits create new versions rather than overwriting old ones, so a readout generated against version N continues to resolve to version N until it is re-run. Every intake, every retrieval, every generated readout and every rule edit is recorded in an audit log keyed by a request id that ties the four together. The optional Plaid EU sandbox link is invoked only when the applicant explicitly opts in and consents, and the linked account data is held in memory for the duration of the readout rather than persisted.

The disclaimer is rendered server-side so it is included in the initial HTML and so the printable PDF carries the same wording as the on-screen output.

## Milestones

1. **M1 — Intake and storage** — Astro intake form, PostgreSQL schema for rules, intake profiles, readouts and audit logs, and a Go service that records a profile and returns its id.
2. **M2 — Rule library v1** — Pinecone index over the rule library, a seed set of rule records for the most common Portuguese residency-permit types and lending categories, and the operator rule-editor route behind admin auth.
3. **M3 — Retrieval** — structured PostgreSQL query and Pinecone vector query merged and deduplicated, with per-request cost gating and a profile-hash cache.
4. **M4 — Readout output** — personalised eligibility readout, sequenced gap-closure plan, server-rendered non-regulated-advice disclaimer, and PDF export.
5. **M5 — Audit and replay** — request-id-tied audit logs, a re-run endpoint that returns the same readout for the same profile id, and a diff view when the rule library has moved on.
6. **M6 — Optional Plaid link** — opt-in bank-account-link path behind Portuguese-compliant consent, with no persistence of linked-account data beyond the single readout.

## Risks

- **Stale rule library** — the product exists to give an immigrant a readout more reliable than memory or a generic LLM answer, and a rule library that has not been updated is the same problem in a different shape.
- **Over-claiming eligibility** — telling an applicant they are "likely eligible" when the rule library is thin on their combination is the easiest way to mislead; the readout must visibly flag its own coverage.
- **PII exposure** — intake profiles carry residency-permit scans, NIF numbers and income details that fall under GDPR and Portuguese data-protection law, and a clear retention policy must exist before the first pilot user.
- **Disclaimer invisibility** — a readout that does not visibly carry the non-regulated-advice disclaimer is a readout that an applicant might use as regulated advice; the disclaimer is a feature, not a footer.
- **Consent creep on the Plaid link** — an opt-in bank-account link that quietly persists linked-account data is a consent failure; the link must be ephemeral by default.
- **National-origin profiling** — the product must surface the criteria a regulated lender would apply, not make the refusal decision on national-origin or residency-status grounds; the rule schema has to enforce that distinction.
- **Country overstatement** — claiming EU coverage at launch while the rule library only covers Portugal is a coverage claim that will mislead an applicant in another member state; EU expansion must be a stated later milestone.
