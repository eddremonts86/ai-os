---
id: "307"
slug: problem-of-marketing-automation-for-saas-products
title: Problem of marketing automation for SaaS products
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/d9kmrt4211-problem-of-marketing-automation-for-saas"
category: marketing
date: "2025-11-12"
tags: [Marketing, SaaS, Other]
country: USA
tech: [Next.js, TypeScript, Postgres, Resend, Customer.io, OpenAI, Plausible Analytics, Vercel]
---
# Problem of marketing automation for SaaS products

## Tech Stack

- **Web app:** Next.js 14 (App Router), TypeScript, deployed on Vercel.
- **Database:** Postgres (Neon) for tenants, flows, events, audience definitions.
- **Email:** Resend for transactional sends, Customer.io for broadcast sends via one internal "Sender" abstraction.
- **Event ingestion:** a thin HTTP endpoint that accepts events from PostHog, Mixpanel, Amplitude, or a customer's own backend.
- **Flow runtime:** an in-house event-driven worker that evaluates triggers, branches, and waits, and emits emails / in-app messages.
- **AI assist:** OpenAI calls to draft flow copy and subject lines from a short prompt, with a human approval step before send.

## Architecture

A Next.js app serves the marketer console (authed RSC). Events arrive via a POST endpoint and are written to an event log. The flow worker subscribes to the log, evaluates the matching flow for each user, and either waits or emits an action (email / in-app). The Sender abstraction writes through to Resend or Customer.io depending on the action type.

```
Browser ─▶ Next.js console ─┐
                            ├─▶ Postgres (tenants, flows, events)
Customer backend ──▶ POST /events ─┘
                                       │
                                       └─▶ Flow worker ─▶ Sender
                                                           │
                                                           ├─▶ Resend
                                                           └─▶ Customer.io
```

## Milestones

1. **M0 — Spec freeze + event ingestion.** One tenant, one event type, manual email send. End of week 1.
2. **M1 — Flow builder + 3 SaaS triggers.** Signed up, activated, went inactive. End of week 4.
3. **M2 — Template library + AI draft assist.** Five pre-built templates, OpenAI draft mode with approval. End of week 6.
4. **M3 — Audience segmentation + plan-based branching.** End of week 8.
5. **M4 — 20-customer private beta.** End of week 10.

## Risks

- **Trigger list drift** — every SaaS has its own activation moment; the pre-built triggers may not match a given product. Mitigation is a "custom event" path that any marketer can wire without engineering.
- **Email deliverability** — sending from a new domain harms inbox placement; mitigation is to send through Customer.io's existing reputation until the brand domain is warmed.
- **No-code regression** — the flow builder can quietly grow engineering requirements (custom JS, branching on payload); mitigation is a strict guardrail that hides code paths behind no-code primitives.
