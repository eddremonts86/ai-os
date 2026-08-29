---
id: "857"
slug: lack-of-a-unified-hub-for-tasks-from-different-services
title: Lack of a unified hub for tasks from different services
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/7pukf4c5a1-lack-of-a-unified-hub-for-tasks-from-dif"
category: productivity
date: "2025-11-04"
tags: [Productivity, Other]
country: Serbia
tech: [SvelteKit, TypeScript, Go (chi), PostgreSQL, NATS (JetStream), OAuth 2.0 (provider integrations), Bun (worker runtime), Coolify, Docker]
---
# Lack of a unified hub for tasks from different services

## Tech Stack

- **SvelteKit** for the inbox UI and the triage surface, because the user journey is a high-frequency interaction list with mostly static content and SvelteKit's small client bundle keeps the inbox fast on lower-bandwidth connections.
- **TypeScript** end to end so the provider data shape and the triage schema are enforced at compile time across the inbox, the worker and the operator catalogue.
- **Go with the chi router** for the OAuth and write-back service, because provider-API calls and OAuth refresh-token handling are small, well-typed operations where Go's standard library and concurrency model are well matched.
- **PostgreSQL** as the primary store for OAuth tokens (encrypted at rest), inbox indexes, per-user preferences, daily-digest schedules and audit logs.
- **NATS (JetStream)** as the message bus for provider poll events, triage write-back actions and the offline-tolerant replay queue, because JetStream gives durable at-least-once delivery without an external queue service.
- **OAuth 2.0** as the integration protocol for every supported provider, with the minimum scopes per action and re-consent on scope expansion.
- **Bun** as the worker runtime for the provider-polling workers and the daily-digest sender, because Bun's TypeScript ergonomics and built-in HTTP client let the worker code share types with the front-end.
- **Coolify** for hosting, on a single container for the MVP with the OAuth tokens kept in a managed PostgreSQL volume for backups.
- **Docker** for local development parity and for the production container images.

## Architecture

The inbox UI is a SvelteKit page that lists the user's open tasks across connected services, with per-service badges, due dates where the source supplies them, a unified search and a per-service filter. Each inbox row carries the underlying provider task id and the source-service link, so a click-through opens the source rather than a hub-owned detail page.

Provider polling is done by Bun workers that run on a per-provider schedule and push inbox-row updates onto NATS JetStream. The Go service consumes those events, persists inbox indexes in PostgreSQL and renders the inbox from the indexes rather than calling provider APIs on every page load. Triage actions are submitted to the Go service, which enqueues them onto NATS as write-back events; the workers consume the events and call each provider's official API to complete, snooze, comment on or defer the item. The offline-tolerant queue lets the user stage triage actions while disconnected and replays them on reconnect with per-action status surfaced in the inbox.

OAuth tokens are stored encrypted at rest in PostgreSQL, with refresh-token rotation handled per provider. The consent screen names each scope and the data it grants, and re-consent is required on any scope expansion. The daily digest is built by a Bun worker that reads the user's inbox indexes, ranks by priority and sends via the user's chosen email provider.

The operator-facing integration catalogue is a SvelteKit route protected by a single-admin role, backed by the Go service with a separate set of endpoints that add, scope and retire providers without code change to the inbox or triage surface. Audit logs record every read, every write-back and every consent change, with the OAuth scopes used. The non-replacement disclaimer is rendered server-side so it is included in the initial HTML and so the daily-digest emails carry the same wording as the on-screen view.

## Milestones

1. **M1 — OAuth and inbox** — OAuth connections for the day-one providers, encrypted token storage, provider polling workers and a SvelteKit inbox listing open tasks with per-service badges.
2. **M2 — Triage surface** — complete, snooze, comment-on and defer actions, with each action enqueued onto NATS and written back to the source API.
3. **M3 — Offline-tolerant queue** — staged triage actions while disconnected, replay on reconnect with per-action status.
4. **M4 — Daily digest** — Bun worker that ranks inbox items by priority and sends a configurable daily digest via the user's email provider.
5. **M5 — Per-service view and unified search** — filter the inbox to one provider, and a unified search across the inbox indexes.
6. **M6 — Operator catalogue** — SvelteKit route behind admin auth to add, scope and retire providers without code change to the inbox or triage surface.

## Risks

- **Write-back failure silent drop** — a triage action that the user thinks they completed but that the source API rejected is a product failure; per-action status surfacing is required from day one.
- **OAuth scope creep** — over-broad scopes are a consent failure and a security incident waiting to happen; the minimum-scope policy and re-consent-on-expansion must be enforced.
- **Provider-API rate limits** — polling each provider on a per-user schedule without coordinating across users can quickly exhaust provider rate limits; the polling workers must be designed against the published limits.
- **PII exposure** — aggregated inbox data carries email subjects, support ticket content and CRM tasks that fall under GDPR and Serbian data-protection law; a clear retention policy must exist before the first pilot user.
- **Disclaimer invisibility** — a hub view that does not visibly carry the non-replacement disclaimer is a hub view that a user might treat as a system of record; the disclaimer is a feature, not a footer.
- **Offline-replay conflicts** — a triage action staged offline and replayed on reconnect can conflict with a change at the source; the queue has to surface the conflict rather than silently overwrite.
- **Provider-deprecation drift** — provider APIs change; the operator catalogue has to make scope and retirement a first-class operation or the integration list rots.
