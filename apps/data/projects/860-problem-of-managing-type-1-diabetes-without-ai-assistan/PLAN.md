---
id: "860"
slug: problem-of-managing-type-1-diabetes-without-ai-assistan
title: Problem of managing type 1 diabetes without AI assistance
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/45u31o0b41-problem-of-managing-type-1-diabetes-with"
category: health
date: "2025-10-30"
tags: [Health, Food, AI, Other]
country: Serbia
tech: [React Native (Expo), TypeScript, FastAPI (Python), PostgreSQL, TimescaleDB (optional time-series extension), DuckDB (on-device analytics), Apple HealthKit, Google Health Connect, Coolify, Docker]
---
# Problem of managing type 1 diabetes without AI assistance

## Tech Stack

- **React Native via Expo** for the mobile app, because the user journey is a phone-first personal-data surface with HealthKit and Health Connect integrations and Expo's managed workflow keeps the build pipeline small for a small team.
- **TypeScript** end to end so the import, observation and export data shapes are enforced at compile time across the mobile app and the FastAPI backend.
- **FastAPI (Python)** for the backend service that handles opt-in cloud sync, the shareable summary export and the operator regulatory-watch surface, because the backend is a small typed API over PostgreSQL and FastAPI is the lightest well-typed Python option.
- **PostgreSQL** as the operational store for user accounts, per-source consent records, opt-in cloud-sync data, export history and audit logs.
- **TimescaleDB (optional time-series extension)** as the time-series store for imported CGM and pump data when the user opts into cloud sync, because time-series queries over glucose data are the dominant access pattern.
- **DuckDB (on-device analytics)** as the on-device analytics engine over the user's local data export, so the raw data does not have to leave the device by default.
- **Apple HealthKit** and **Google Health Connect** as the day-one import sources, both behind explicit per-source consent and per-source audit log.
- **Coolify** for hosting, on a single container for the MVP with the operational store kept in a managed PostgreSQL volume for backups.
- **Docker** for local development parity and for the production container image.

## Architecture

The mobile app is a React Native (Expo) application that handles per-source import consent, the on-device DuckDB analytics layer, the personal observations surface and the shareable summary export. The default data path is on-device: imported data lands in a local encrypted store, DuckDB runs the observation queries over the local store and the observations surface renders without any cloud round-trip. Cloud sync is opt-in per user and uses an encrypted-at-rest PostgreSQL + TimescaleDB backend; the user can revoke cloud sync and trigger a per-user data-deletion endpoint at any time.

Observation generation runs on-device by default. Each observation is rendered as a card with the underlying data points the user can tap through to verify, and the card carries the non-medical-device and non-dosing disclaimers inline. The shareable summary export is built server-side from the user's chosen observations when the user opts into cloud sync, or built on-device when the user prefers an offline export; in either case the export carries both disclaimers in its header.

The backend FastAPI service exposes endpoints for opt-in cloud sync, export history, consent management and the operator regulatory-watch surface. The operator regulatory-watch surface is a small admin route behind a single-admin role that tracks the Serbian medical-device framework, the EU MDR Software-as-a-Medical-Device classification for insulin-adjacent software, and any named regulator guidance that affects the product's claims; any change logged there triggers a content-review check before any new observation wording is shipped.

The operator content-review surface is a separate admin route that lists every observation wording in production and flags any wording that drifts toward clinical recommendation; every wording change goes through a review pass before shipping. Audit logs record every import, every observation generation, every export and every consent change, with the data version referenced. Both disclaimers are rendered server-side so they are included in the initial HTML and so a shareable summary export carries the same wording as the on-screen view.

## Milestones

1. **M1 — Import and on-device store** — React Native app with HealthKit and Health Connect import behind per-source consent, on-device encrypted store, DuckDB analytics layer.
2. **M2 — Personal observations surface** — observation generation over the on-device store, every observation traceable to the underlying data points, both disclaimers inline.
3. **M3 — Shareable summary export** — server-side or on-device export with both disclaimers in the header, export history in PostgreSQL when the user opts into cloud sync.
4. **M4 — Opt-in cloud sync** — FastAPI backend over PostgreSQL + TimescaleDB, encrypted-at-rest cloud sync, per-user data-deletion endpoint.
5. **M5 — Operator regulatory-watch surface** — admin route tracking the Serbian medical-device framework, EU MDR SaMD classification and any named regulator guidance, with a content-review trigger on any logged change.
6. **M6 — Content-review surface** — admin route listing every observation wording in production with a drift-toward-clinical-recommendation flag, review-pass required before any wording change ships.

## Risks

- **Regulatory boundary crossing** — wording that drifts from "personal observation" toward "clinical recommendation" is a release blocker; the content-review surface and the regulatory-watch surface exist for exactly this reason.
- **Fabricated observations** — an observation that cannot be traced to the user's own data points is a fabrication and a product failure; the traceable-to-data rule must be enforced in code and in review.
- **Health data exposure** — imported CGM, pump, food and exercise data is sensitive under GDPR, under Serbian personal-data law and under any health-data regulation in the user's jurisdiction; encryption at rest, the on-device default, and the per-user data-deletion endpoint must be in place before the first pilot user.
- **Disclaimer invisibility** — an observation card that does not visibly carry both disclaimers is a card that a user might use as clinical guidance; the disclaimers are a feature, not a footer.
- **Cloud-sync confusion** — an opt-in cloud sync that quietly persists without the user's awareness is a consent failure; the sync path has to be explicit and revocable.
- **Wording drift over time** — a small wording change can move the product across the medical-device boundary without anyone noticing; the content-review surface and the per-wording review-pass are required for every change.
- **Scope creep toward dosing** — a feature request for a bolus calculator or a pump-dosing integration is a separate product decision that requires its own regulatory review; the MVP must resist scope creep toward any feature that crosses the observation boundary.
