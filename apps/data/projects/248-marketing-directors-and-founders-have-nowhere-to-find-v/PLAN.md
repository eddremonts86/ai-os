---
id: "248"
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
---
# Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget

## Tech Stack

- Next.js (App Router) + TypeScript for the public directory and the contractor profile pages; the surface is SEO-sensitive (buyers search by specialization and city) and Next.js's SSG output fits that.
- PostgreSQL with Prisma for contractor profiles, references, verification status, and inquiry records.
- Auth.js (NextAuth) for contractor sign-in, with two roles: contractor (manages own profile) and operator (runs verification).
- A small Node.js worker for the verification queue: an operator dashboard lists pending applications, marks each step (identity, references, evidence), and triggers an email to the contractor.
- Resend (or Postmark) for transactional email — application received, reference needed, profile published, inquiry arrived.
- Self-hosted on Coolify; the directory traffic pattern is steady and predictable.

## Architecture

Three pieces:

1. **Public directory** — server-rendered listing and profile pages, indexed by city and specialization. Profiles show verification status prominently.
2. **Contractor console** — a logged-in area where a contractor edits their profile, uploads case-study evidence, and nominates references. Verification status is reflected in real time as the operator moves through the queue.
3. **Operator console** — a separate logged-in area for verification staff. Each application is a checklist (identity, references, evidence review) with the result stored against the profile.

Inquiries from buyers land in PostgreSQL and trigger an email to the contractor. There is no chat, no escrow, no in-app messaging in the MVP — the inquiry is a structured handoff that returns control to the buyer and contractor's own channels.

## Milestones

- **M1 — Directory shell.** Listing page, profile page, and city/specialization filters with seeded data.
- **M2 — Contractor console.** Sign-up, profile editor, evidence upload, reference nomination.
- **M3 — Verification queue.** Operator dashboard with a checklist for each application; verified status surfaces on the public profile.
- **M4 — Inquiry flow.** Buyer-side inquiry form tagged by specialization and city; email handoff to contractor.
- **M5 — Reference re-check.** Periodic re-contact of references for already-verified contractors (e.g., every 12 months) so the badge does not stale.

## Risks

- Reference check cost: each verification involves a human calling one to three references. If the call cost per profile is high, the model breaks. The MVP must price around the cost of the call.
- Profile fabrication: contractors will still overstate outcomes. The verification step must include evidence review (screenshots with timestamps, ad-account anonymized exports), not only reference confirmation.
- Cold-start chicken-and-egg: buyers won't come until there are verified profiles, contractors won't apply until there are buyers. The MVP needs a paid or partner-acquired seed set of 20–30 verified profiles in one specialization to break in.
- Regulatory scope: collecting contractor identity and references for verification is personal data under Russian Federal Law 152-FZ. The MVP must document retention and deletion, and stay narrow on what is stored.
- Specialization drift: broadening from targeting + SMM into general marketing dilutes the verification signal. The MVP must resist the temptation to add new categories before the first two are healthy.
