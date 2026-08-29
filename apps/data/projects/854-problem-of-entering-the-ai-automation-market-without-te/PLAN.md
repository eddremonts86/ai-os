---
id: "854"
slug: problem-of-entering-the-ai-automation-market-without-te
title: Problem of entering the AI automation market without technical experience
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/gtd8o0taz1-problem-of-entering-the-ai-automation-ma"
category: ai
date: "2025-11-06"
tags: [AI, Business, Education, Other]
country: India
tech: [SvelteKit, TypeScript, Express (Node.js, TypeScript), PostgreSQL, Redis, OpenAI text-embedding-3-small, Cloudflare R2, Razorpay, Coolify, Docker]
---
# Problem of entering the AI automation market without technical experience

## Tech Stack

- **SvelteKit** for the learner-facing intake, plan-viewer and role-explorer pages, because the user journey is form-driven with server-rendered plans and SvelteKit's small client bundle is well suited to learners on lower-bandwidth Indian connections.
- **TypeScript** end to end so the role library data shape and the plan schema are enforced at compile time across the editor and the runtime.
- **Express (Node.js, TypeScript)** for the retrieval and plan-generation service, because role retrieval and plan assembly are small, well-typed operations where Node's ecosystem and TypeScript ergonomics are well matched.
- **PostgreSQL** as the primary store for role records (versioned), intake profiles, generated plans and audit logs; relational shape fits the versioned role library better than a document store.
- **Redis** as a cache for repeated plan generations and for rate-limiting LLM calls per learner.
- **OpenAI text-embedding-3-small** as the secondary matcher over the role library, so a free-text profile description can be matched to the right role records without relying on keyword search alone.
- **Cloudflare R2** as the storage layer for practice-project artefacts and any learner-uploaded portfolio pieces, on a per-learner prefix with lifecycle rules for retention.
- **Razorpay** as the Indian payments processor for any paid tier, because it is the de facto Indian standard for subscription billing in INR.
- **Coolify** for hosting, on a single container for the MVP, with the role library kept in a managed PostgreSQL volume for backups.
- **Docker** for local development parity and for the production container image.

## Architecture

The learner-facing intake is a SvelteKit page that accepts current role, years of experience, weekly time available, target AI-adjacent role, budget band for paid tools or courses, and English-versus-Hindi language preference. Submission posts to the Express service, which performs two parallel retrieval steps: a PostgreSQL structured query for the role records matching the target role, and an OpenAI text-embedding-3-small vector query for the free-text profile description. The two result sets are merged, deduplicated by role-record id, and ranked by coverage of the submitted fields.

Each retrieved role record carries its version and the source pointer (the practitioner interviews or publicly available role descriptions the record is built from). The plan generator then assembles a week-by-week 90-day plan with practice projects and a milestone checklist, plus the honesty layer that contrasts the role-record's day-to-day demands with the market's commonly made claims. The LLM call is gated by a per-request cost budget and cached against the profile hash, so repeated runs of the same profile do not multiply the bill, and the cached response carries the role-record versions it was generated against.

The operator-facing role editor is a SvelteKit route protected by a single-admin role, backed by the Express service with a separate set of endpoints that write to the role-records table. Edits create new versions rather than overwriting old ones, so a plan generated against version N continues to resolve to version N until it is re-run. Audit logs record every intake, every retrieval, every output and every role edit, with a request id that ties them together. The non-certification disclaimer is rendered server-side so it is included in the initial HTML and so the printable PDF carries the same wording as the on-screen output. Cloudflare R2 holds practice-project artefacts under a per-learner prefix with lifecycle rules aligned to the documented retention policy.

Razorpay is integrated only on the paid tier; the free tier requires no payment instrument. The Indian payment context is handled by settling in INR and using UPI and card flows supported by Razorpay, with a single subscription product rather than a tiered mess at launch.

## Milestones

1. **M1 — Intake and storage** — SvelteKit intake form, PostgreSQL schema for role records, intake profiles, generated plans and audit logs, and an Express service that records a profile and returns its id.
2. **M2 — Role library v1** — OpenAI text-embedding-3-small index over the role library, a seed set of role records for the most common Indian AI-adjacent roles, and the operator role-editor route behind admin auth.
3. **M3 — Retrieval** — structured PostgreSQL query and text-embedding vector query merged and deduplicated, with per-request cost gating and a profile-hash cache.
4. **M4 — Plan output** — sequenced 90-day plan with practice projects and milestone checklist, the honesty-layer section, server-rendered non-certification disclaimer, and PDF export.
5. **M5 — Audit and replay** — request-id-tied audit logs, a re-run endpoint that returns the same plan for the same profile id, and a diff view when the role library has moved on.
6. **M6 — Payments and retention** — Razorpay integration for the paid tier in INR, and the documented retention policy enforced on Cloudflare R2 prefixes.

## Risks

- **Stale role library** — the product exists to give an Indian learner a path more honest than a bootcamp ad, and a role library that has not been updated is the same problem in a different shape.
- **Honesty-layer drift** — a role library that drifts toward market claims loses the product's edge; the honesty layer has to be maintained as actively as the role records themselves.
- **PII exposure** — intake profiles carry current employer and salary band that are sensitive in the Indian employment context, and a clear retention policy must exist before the first pilot learner.
- **Disclaimer invisibility** — a plan that does not visibly carry the non-certification disclaimer is a plan that a learner might use as a credential promise; the disclaimer is a feature, not a footer.
- **Bootcamp conflict** — a paid product that explicitly contrasts itself with paid bootcamps may attract pushback from bootcamps and from learners who have already paid; the honesty layer has to be factual and source-cited rather than polemical.
- **Tier-2/Tier-3 blind spots** — a role library built only from Bengaluru and Hyderabad practitioner interviews will misrepresent the Tier-2 and Tier-3 city reality, and the operator sourcing plan must include non-metro voices from day one.
- **Language policy gap** — an English-only MVP that quietly excludes Hindi-preferring learners is a coverage gap the moment the first Hindi-preferring learner arrives; the language policy has to be a stated milestone, not a silent deferral.
