---
id: "360"
slug: automating-tilda-landing-page-creation-for-webinars
title: Automating Tilda landing page creation for webinars
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/tp6dgyysf1-automation-of-creating-a-tilda-landing-page-for-webinars"
category: marketing
date: "2025-10-10"
tags: [Marketing]
country: Russia
---
# Automating Tilda landing page creation for webinars

## Tech Stack

Next.js (TypeScript) for the brief form and the dashboard. PostgreSQL via Prisma for the briefs, the speaker library, the live-URL records, and the publish history. The Tilda API for the project creation and publish step. S3-compatible object store for the speaker photos (with a per-speaker retention policy). Resend (or any SMTP) for the publish-confirmation email. The stack is chosen for the *form* of the problem: a small recurring workload, a single Tilda integration, and a Russian-speaking user base.

## Architecture

- **Brief service** — a structured form (title, date/time, speakers, programme, FAQ, registration provider) that stores the brief and validates the inputs.
- **Speaker library** — a per-user store of speaker records (photo, bio, contact, consent timestamp) with a revocation flow.
- **Template mapper** — a Tilda template that maps the brief fields to the Tilda blocks (hero, speaker block, programme, registration form, FAQ, footer).
- **Tilda publisher** — a service that creates the Tilda project, wires the registration form, and returns the live URL.
- **Dashboard** — a per-user dashboard that shows the live URLs, the registration counts, and the briefs in the queue.

## Milestones

1. **Phase 0 — Scaffold**: Next.js + Prisma skeleton, Tilda sandbox, design tokens, brief form route.
2. **Phase 1 — Core**: brief service, speaker library, template mapper, Tilda publisher, dashboard.
3. **Phase 2 — Pilot**: onboard 5 Russian marketers, run 20 webinars end-to-end, measure brief-to-publish turnaround.
4. **Phase 3 — Coverage**: add the next 3 registration-provider integrations based on the most common providers in the pilot.

## Risks

- The Tilda API has rate limits and a fixed set of operations; the publisher must respect the limits and surface a clear error when the API is slow.
- The speaker block is the most personal part of the page; the template mapper must allow per-webinar overrides without breaking the layout.
- The registration provider is the source of truth; the MVP must not store the registrants separately, only wire the form.
- Speaker photos are personal data; the MVP must respect Russian personal-data law (152-ФЗ) and support a clear revocation flow.
- The MVP must not generate the speaker bio or the programme copy; the brief is the source of truth.
