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

## Problem

The capture is a category-level problem statement from ProblemHunt: the `## Problem` body carries only the country name Serbia, and the title — "Lack of a unified hub for tasks from different services" — is the entire problem statement. Nothing else in the capture adds detail: no description, no quoted persona, no specific service named, no API protocol, no task type or volume. The honest ground truth is therefore the title plus the `Productivity, Other` tags plus the country.

The problem the title names is real and recurring across knowledge workers everywhere, and Serbia is a plausible location for a knowledge-worker-heavy product: a single user has tasks living in half-a-dozen services at once — emails that need a reply, GitHub issues that need a triage, Jira tickets, Linear items, calendar holds, Slack mentions, Notion pages with task lists, a personal to-do app, a customer-support inbox — and no single surface shows them all. The user context-switches between services to triage, and the result is that low-priority items in some services are quietly lost while the user dwells on whatever is loudest in the service currently open. The friction is not that any individual service is bad, it is that no shared task abstraction sits over them.

The product implication, without inventing specifics, is that a knowledge worker needs a single inbox that aggregates tasks across the services they already use, lets them triage in one place, and writes back to the source service when they complete, snooze or comment on an item. The MVP is an aggregation and triage hub; it is not a replacement task manager, it is not a project management tool, and it does not require the user to migrate away from any of their existing services. Country-specific facts the capture does not state — which OAuth providers are most common among Serbian users, Serbian-language versus English-language UI expectations, the Serbian data-residency rules that may apply to aggregated task data, or specific integration partners — are flagged as open questions rather than asserted.

## Objective

Ship a unified task-hub product that connects to the services a knowledge worker already uses (email, GitHub, Linear, Jira, Slack, Notion, calendar and a personal to-do app), aggregates their open tasks into a single inbox, lets the user triage, complete, snooze and comment on items in one place, and writes those actions back to the source service through each provider's official API. The MVP must work without requiring the user to migrate from any existing service, must keep each provider's data inside that provider unless the user explicitly syncs it, and must remain usable on a single small machine.

## Target Users

- Individual knowledge workers who currently context-switch between half-a-dozen services to triage their open work and lose low-priority items in the process.
- Engineering and product managers who live in GitHub, Linear, Jira, Slack and email at once and want a single inbox across all four.
- Freelancers and consultants who manage client work in a personal to-do app alongside client-service tasks (email, support inbox) and need a single surface to triage.
- Founders and small-team operators who wear many hats and have tasks spread across calendar, email, support inbox and one or two task apps.
- Customer-success and account managers who need to triage support tickets, CRM tasks and personal follow-ups in one place.
- Researchers and writers who track reading, writing and follow-up tasks across Notion, email and a personal to-do app.

## MVP Scope

- OAuth 2.0 connections to a curated set of source services (email, GitHub, Linear, Jira, Slack, Notion, calendar and one personal to-do app), each connection granting the minimum scopes needed to read and update tasks.
- A single inbox that lists the user's open tasks across connected services, with per-service badges, due dates where the source supplies them, and a unified search.
- A triage surface that lets the user complete, snooze, comment on, or defer an item, with each action written back to the source service through its official API.
- A snooze-and-defer model that supports a snooze until a date and a defer to a specific day, with the item reappearing in the inbox on that date.
- A daily digest email that lists the user's open tasks in priority order, configurable by the user.
- An offline-tolerant triage queue that lets the user stage actions while disconnected and replays them on reconnect.
- A per-service view that filters the inbox to one provider, for users who want to focus on a single source.
- An explicit non-replacement disclaimer on every connected service, naming that the source service remains the system of record.
- An operator-facing integration catalogue where new providers can be added, scoped and retired without code change to the triage surface.
- Audit logging of every read, write and triage action, with the OAuth scopes used.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The hub is an aggregation and triage surface only; it is not a replacement task manager, it is not a project management tool, and it does not migrate the user away from any existing service, and the disclaimer must be visible on every connected-service view.
- All provider data is read from each provider's official API and the source service remains the system of record; the hub does not duplicate provider state into its own store beyond the indexes needed for unified search and the audit log.
- OAuth scopes are the minimum needed for each action; the consent screen must name each scope and the data it grants, and re-consent is required on any scope expansion.
- Triage actions are write-backs to the source service through the official API; the hub must surface write failures clearly rather than silently dropping them, and an offline-tolerant queue must replay on reconnect with explicit per-action status.
- Personal data in the aggregated inbox (email subjects, support ticket content, CRM tasks) is sensitive under GDPR and Serbian data-protection law; a documented retention policy must exist before any pilot user is onboarded.
- The MVP must remain usable on a single small machine; the architecture must not require a hosted multi-tenant grid.
- The MVP does not include a hosted team tier; the day-one product is individual-use, with team features explicitly deferred.
