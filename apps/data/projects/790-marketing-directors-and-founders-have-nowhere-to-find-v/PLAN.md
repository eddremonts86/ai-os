---
id: "790"
slug: marketing-directors-and-founders-have-nowhere-to-find-v
title: "Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/lk4uc1xvl1-marketing-directors-and-founders-have-no"
category: marketing
date: "2026-01-17"
tags: [Marketing, Business, Freelance, Career, Other]
country: Russia
tech: [Next.js, TypeScript, PostgreSQL, Prisma, Meilisearch, S3-compatible object storage, Stripe Connect, Coolify]
---
# Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget

## Tech Stack

- **Next.js with TypeScript** for the public directory, the specialist profile pages, and the buyer shortlist surface — server-rendered for SEO so a search for "targeting specialist Moscow" actually surfaces the directory.
- **PostgreSQL with Prisma** for specialists, buyers, inquiries, shortlists, and the outcome field that drives the calibration signal — relational because every inquiry joins to a buyer, a specialist and an outcome event.
- **Meilisearch** for the specialty-filtered search (niche × city × language × rate band × availability), because the source names wasted search time as the pain and the directory's job is to make the first search produce a real shortlist in minutes.
- **S3-compatible object storage** for portfolio case-study uploads and verification-document retention, so the audit trail a verified profile claims is actually inspectable.
- **Stripe Connect** as the optional escrow path between buyer and specialist, even though the directory is not the employer — escrow is the cleanest way to make the outcome field honest.
- **Coolify** for self-hosted deploy on a single VPS, matching the per-plan deployment shape used across this corpus and keeping the smallest operational footprint for a directory at MVP scale.

## Architecture

The directory has three surfaces — a public browse surface, a specialist onboarding surface, and a buyer dashboard — and one shared data model underneath. Every specialist record carries the niche lane (targeting or SMM), the verification state, the published rubric pass evidence, and a public-vs-private flag the specialist controls. Every inquiry carries the brief, the parties, the message thread, and the eventual outcome field the directory uses to learn whether the match was good.

Search runs through Meilisearch, with the specialist record indexed by niche, city, language, declared rate band, declared availability window, and a verification-eligible boolean. Buyers filter on those facets; the index returns the shortlist. PostgreSQL stays as the source of truth — Meilisearch is rebuilt from it on a short interval and on every specialist update, so the directory never serves a profile whose underlying state has changed.

Verification is a separate workflow from search. An applicant fills in the screening questionnaire, attaches the named portfolio pieces and references, and is queued for the rubric review. The reviewer records the rubric pass evidence against the applicant record — not as a free-text note — so the badge on the public profile is backed by a structured pass that can be re-checked. The published rubric is a single page the directory exposes so buyers and specialists see the same rule. Verification state is time-bound: badges expire on a stated cadence and require re-check, so the directory does not become a permanent stamp on work that has aged.

The inquiry flow is intentionally simple. A buyer messages a specialist from the profile page, the message opens a thread in the buyer dashboard, and the buyer can later mark the outcome (hired, declined, no response). The outcome is the calibration signal: a specialist whose inquiries never convert gets flagged for the reviewer to look at again, and a buyer whose inquiries never convert is the signal the directory's matching is producing the wrong shortlist. The flow does not handle payment — Stripe Connect is offered as an optional escrow lane for buyers who want it, but the directory does not process the contract.

Operational surfaces sit behind the same Next.js app. Specialist onboarding, reviewer console, and admin tooling are gated by role and share the database with the public surface. Logs are written to a single destination so a dispute about a verified profile can be traced from the public badge back to the reviewer's recorded rubric pass.

## Milestones

1. **M1 — Specialist model and onboarding** — schema, onboarding form, the screening questionnaire, and the per-niche rubric definitions written down as published pages.
2. **M2 — Verification workflow** — reviewer console, rubric pass recording, badge state machine (none / pending / verified / expired), and the audit-trail query that explains a badge.
3. **M3 — Public directory and search** — Meilisearch indexing pipeline, faceted search, public profile pages with the case-study and verification-evidence surfaces.
4. **M4 — Buyer shortlist and inquiry flow** — shortlist save, private inquiry thread, the outcome capture field, and the calibration dashboard that reads it.
5. **M5 — Badge expiry and re-check loop** — time-bound badge state, the re-check cadence, and the reviewer queue for expired badges.
6. **M6 — Optional escrow lane** — Stripe Connect integration behind a buyer opt-in, kept separate from the directory's hiring scope.

## Risks

- **Rubric drift** — two reviewers pass the same applicant differently and the badge stops meaning the same thing. Mitigation: rubric scoring is structured, not free-text, and a sample of passes is double-reviewed each week.
- **Outcome capture starvation** — buyers skip the outcome field because it is extra work. Mitigation: outcome is asked at most once per thread, surfaced inline in the thread, and offered as a one-tap choice.
- **Verification theatre** — the badge looks official but the check is shallow, and a buyer later finds the work is not as advertised. Mitigation: every badge is backed by a structured rubric record and at least one named reference or portfolio piece.
- **Niche scope creep** — pressure to add SEO, copywriting, or email marketing to the directory dilutes the two-niche signal. Mitigation: explicit out-of-scope list in the published rubric and a feature flag that blocks new niches.
- **Pool exhaustion in a niche** — if too few targeting specialists or SMM managers apply, the directory is empty in one lane. Mitigation: a minimum-viable-pool gate per niche before public launch of that lane.
- **Personal-data handling** — storing references, ID checks, and portfolio evidence has to follow Russian personal-data rules. Mitigation: data retention policy written down before launch, with a stated deletion path.
