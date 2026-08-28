---
id: "804"
slug: immigrants-lack-an-ai-service-for-finding-familiar-and-
title: "Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin"
  captured: "2026-01-03"
category: other
date: "2026-01-03"
tags: [Immigration, AI, Other]
country: Serbia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss

## Tech Stack

- **Frontend:** React with TypeScript, multilingual UI via i18next.
- **Backend API:** Node.js (TanStack Start) handling place ingestion, vouching, and per-category filtering.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Public-registry ingestion:** Scheduled jobs that pull from UK CQC, Apothekenverzeichnis (Germany), and NPI (USA) into a normalised place table.
- **Vouch + tenure model:** A separate user table keyed by country; tenure is days since registration with verified email.
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — places, users, vouches, reviews
              │
              ├─▶ Registry ingestion jobs (UK CQC, DE Apothekenverzeichnis, US NPI)
              │
              └─▶ Sponsored placement scoring — separate ranking weight, never mixed into the verified tab
```

The "verified" tab is a strict SQL filter: 3+ vouches from users with ≥ 30-day tenure. Sponsored placements live in a separate index and are explicitly labelled "Sponsored" — they never mix with the verified set, so the community signal cannot be bought.

## Milestones

1. **M0 — Schema + first country.** Place + user + vouch tables; UK seeded from CQC. End of week 2.
2. **M1 — Three-country directory.** Germany + USA seeded from public registries; multilingual UI live. End of week 5.
3. **M2 — Vouch + review.** Tenure check, vouch flow, review form with verified-tenure gate. End of week 8.
4. **M3 — Sponsored placement.** Separate ranked index with explicit "Sponsored" label. End of week 11.
5. **M4 — Country expansion hook.** Onboarding for community organisations to seed a 4th country. End of week 14.

## Risks

- **Vouch fraud** — bad actors create many accounts to vouch for a paid placement. Mitigation: tenure ≥ 30-day gate on vouching + email verification + a vouch-rate anomaly detector.
- **Stale public-registry data** — UK CQC / DE Apothekenverzeichnis / US NPI change without notice. Mitigation: weekly scheduled re-ingestion with diff reports; manual re-verification every 90 days for verified places.
- **Regulatory risk** — a country interprets the directory as a regulated recommendation service. Mitigation: explicit "this is a community directory, not a recommendation service" disclaimer; no medical or financial advice on any place page.
- **Sponsored vs. verified boundary** — pressure to blur the two. Mitigation: technical separation (separate index, separate ranking), explicit "Sponsored" label, no exception process.
