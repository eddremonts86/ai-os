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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A unified task-hub product that connects to the services a knowledge worker already uses (email, GitHub, Linear, Jira, Slack, Notion, calendar and a personal to-do app), aggregates their open tasks into a single inbox, lets the user triage, complete, snooze and comment on items in one place, and writes those actions back to the source service through each provider's official API. The source service remains the system of record; the hub is a triage surface that sits over it.

The product is deliberately scoped. It does not replace any existing service, it does not duplicate provider state into its own store beyond what unified search needs, and it does not require a team plan to be useful. What it does is give a knowledge worker a single surface to triage across the services they already use, with write-backs that close the loop instead of leaving notes in the hub.

**One-liner:** A unified task-hub product that connects to the services a knowledge worker already uses and aggregates their open tasks into a single inbox, with triage actions that write back to the source service through each provider's official API.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Individual knowledge workers | Context-switch between half-a-dozen services and lose low-priority items; want a single inbox. |
| Engineering and product managers | Live in GitHub, Linear, Jira, Slack and email at once and want one inbox across all four. |
| Freelancers and consultants | Manage client work in a personal to-do app alongside client-service tasks and want one surface. |
| Founders and small-team operators | Have tasks across calendar, email, support inbox and task apps and want a single triage surface. |
| Customer-success and account managers | Need to triage support tickets, CRM tasks and personal follow-ups in one place. |
| Researchers and writers | Track reading, writing and follow-up tasks across Notion, email and a personal to-do app. |

## Jobs To Be Done

1. **Functional job** — Show me every open task across the services I use, in one inbox, with per-service badges.
2. **Functional job** — Let me complete, snooze, comment on, or defer an item, with the action written back to the source service.
3. **Functional job** — Send me a daily digest that lists my open tasks in priority order.
4. **Functional job** — Let me stage triage actions while disconnected and replay them when I reconnect.
5. **Emotional job** — Stop losing low-priority items because they were in a service I was not currently looking at.
6. **Social job** — Be able to say to a colleague "it's in my hub" rather than describing which of six apps it's in.

## Success Metrics

- **Connection activation** — share of new users who complete at least two OAuth connections within the first week, which is the proxy for whether the inbox is populated.
- **Triage completion** — share of inbox items that receive a triage action (complete, snooze, comment, defer) rather than just a view.
- **Write-back success rate** — share of triage actions that succeed at the source API, separate from inbox view rate.
- **Offline-replay success** — share of staged triage actions that replay successfully on reconnect, since silent write failures are the failure mode of any queue.
- **Daily-digest engagement** — share of users who open the daily digest and click into at least one item.
- **Disclaimer acknowledgement** — share of connected-service views for which the non-replacement disclaimer was visibly rendered.

## Pricing & Monetization

The capture names no price, no tier and no business model; the only ground truth available is the title, the country and the category tags. What the architecture does fix is a cost shape: every active user consumes one or more OAuth refresh tokens, periodic API polls per connected service and a daily digest send, so the marginal cost scales with the number of connected services per user rather than with raw user count. A plausible paid shape is therefore per-user subscription with a free tier for two connected services and a paid tier for unlimited connections; the actual price is left as an open question because the source gives no number to quote.

## Competitive Landscape

- **Spreadsheets and personal to-do apps as a manual aggregation** — the incumbent for power users, with no write-back and high maintenance. The product competes on automation and on the closed loop.
- **Native cross-service dashboards inside larger productivity suites** — exist, but tied to a single vendor's suite and not write-back to third-party APIs.
- **Generic automation tools (Zapier, Make, n8n)** — powerful, but require the user to build flows per integration and do not provide a unified inbox. The product competes on the inbox surface.
- **Vendor-specific task inboxes (Linear, Jira, GitHub)** — deep, but single-vendor. The product competes on cross-service aggregation.

The capture names no competitor by name, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the consent-screen language is sufficient for an OAuth-aggregator product under GDPR and Serbian data-protection law; the capture gives no legal sign-off.
- [ ] Establish which providers the day-one integration catalogue must cover, given the capture names no specific provider.
- [ ] Decide the OAuth scope policy for write actions, since over-broad scopes are a consent failure and over-narrow scopes break write-back.
- [ ] Set the retention policy for aggregated task data, including email subjects and support ticket content; the capture gives no data-retention rule.
- [ ] Determine the offline-tolerant queue's conflict-resolution policy when a source item has changed while a triage action was staged; the capture gives no conflict model.
- [ ] Confirm whether a hosted team tier is in scope at MVP or remains an explicitly deferred milestone.
