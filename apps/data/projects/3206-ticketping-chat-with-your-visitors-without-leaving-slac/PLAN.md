---
id: "3206"
slug: ticketping-chat-with-your-visitors-without-leaving-slac
title: Ticketping – Chat with your visitors without leaving Slack
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/ticketping?utm_campaign=startup-184497&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ticketping – Chat with your visitors without leaving Slack

## Tech Stack

- **Slack app:** Slack app using the Events API for inbound messages and the Web API for outbound replies, slash commands, and reactions.
- **Backend:** Node.js API on TanStack Start handling the three inbound channels (chat widget, support email, form submissions) and the routing logic.
- **DB:** SQLite with Drizzle ORM for tickets, threads, role assignments, and the audit trail of status changes made via Slack.
- **Admin dashboard:** React + TypeScript front-end on the same TanStack Start stack, scoped to management and reporting (tickets, roles, performance).
- **AI layer:** an optional LLM call that drafts or suggests a reply; the source does not name the model. The layer must default to "suggest" rather than auto-send, so humans stay in the loop on nuanced issues.
- **Deployment:** Coolify + Docker.

## Architecture

```
Inbound channels
   ├─ Chat widget ─┐
   ├─ Email (IMAP) ─┼──▶ Routing service ──▶ Slack thread (one per ticket)
   └─ Form post ────┘            │
                                 ▼
                         Ticket store (SQLite)
                                 │
                                 ▼
                       Admin dashboard (React)

Slack events ──▶ Status / mentions / slash commands ──▶ Ticket store
LLM service ──▶ Suggested reply ──▶ Posted into the thread as a draft
```

- The routing service is the only writer of new tickets; Slack events update existing tickets.
- The AI layer is a thin wrapper that returns a draft; the team sees the draft in Slack and chooses to send, edit, or discard.

## Milestones

1. **M0 — Spec + design tokens + Slack app registered.** Existing SPEC.md and DESIGN.md approved; Slack app credentials set up.
2. **M1 — Inbound channels wired.** Chat widget, support email, and form submissions all create a Slack thread and a ticket record.
3. **M2 — Reply / mention / status from Slack.** Agents can reply in the thread, @-mention teammates, and change status via Slack commands or reactions; ticket store stays in sync.
4. **M3 — Admin dashboard.** Tickets, roles, and performance numbers render in a React dashboard backed by SQLite.
5. **M4 — Optional AI layer.** The AI drafts a suggested reply into the thread; humans choose to send, edit, or discard.

## Risks

- Slack rate limits: high-volume inboxes can blow past the per-channel message rate; the MVP needs a buffer / batch path.
- AI auto-send risk: if the AI is wired to post without a human confirmation step, nuanced replies go out unedited. The MVP must keep "suggest" as the default and gate any auto-send behind an explicit user opt-in.
- Audit-trail gaps: Slack reactions and slash commands can update status in ways the dashboard does not capture if the event subscription is incomplete. The integration test should cover every documented status change.
- Channel-spam risk: routing every form submission into Slack threads will overwhelm small teams; the MVP needs per-channel rules or quiet hours.
