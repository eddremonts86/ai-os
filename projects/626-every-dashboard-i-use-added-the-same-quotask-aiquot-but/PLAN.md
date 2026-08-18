---
id: "626"
slug: every-dashboard-i-use-added-the-same-quotask-aiquot-but
title: "Every dashboard I use added the same \"Ask AI\" button this year"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozdqc/every_dashboard_i_use_added_the_same_ask_ai/"
category: saas
date: "2026-08-15"
---
# Every dashboard I use added the same "Ask AI" button this year

## Tech Stack

- **Embeddable widget:** A small JavaScript bundle (no framework runtime, just vanilla TS compiled to ES modules) distributed as a single script tag that injects a button into the host dashboard and opens an iframe-based chat.
- **Backend agent:** Node.js with Fastify and a function-calling LLM (Anthropic or OpenAI); the agent reads the host's action registry and returns a typed action candidate the operator must approve.
- **Action registry:** A JSON manifest per host SaaS that declares allowed endpoints, parameters, scopes, and human-readable descriptions, so the LLM can never invent a write against an unregistered route.
- **Host integration SDK:** A thin TypeScript SDK the design partner installs in their backend, exposing the host's existing API surface as typed actions rather than free-form REST calls.
- **Database:** PostgreSQL for per-host action proposals, approval events, rejection reasons, and design-partner feedback so the poster can tune prompts per host from real signal.
- **Hosting:** Single VPS via Coolify, matching the rest of the AI-OS deploy model, with the widget served from the same origin so the host's CSP does not block the script.

## Architecture

```
+------------------+       +-----------------+       +-----------------+
|  Host SaaS       |       |  Embeddable     |       |  Fastify        |
|  dashboard       |  -->  |  widget (ESM    |  -->  |  backend        |
|  (operator UI)   |       |  + iframe)      |       |  (LLM agent)    |
+------------------+       +-----------------+       +--------+--------+
                                                              |
                                                     +--------v--------+
                                                     |  Host action    |
                                                     |  registry + SDK |
                                                     +--------+--------+
                                                              |
                                                     +--------v--------+
                                                     |  PostgreSQL     |
                                                     |  (proposals,    |
                                                     |   approvals,    |
                                                     |   feedback)     |
                                                     +-----------------+
```

The widget sends the operator's natural-language request to the Fastify backend, which reads the host's registered actions, asks the LLM for a typed action candidate, and returns it to the widget. The widget renders the approval dialog showing exactly what is about to change; on confirm, the backend calls the host SDK to execute the action and records the event.

## Milestones

1. **M0 — Design-partner recruitment:** Lock in the first 15 to 20 founders the poster will integrate with, document each host's API surface, and pick the first host to ship against.
2. **M1 — Widget and approval dialog:** A vanilla-TS widget that injects an "Ask AI" button, opens an iframe, and shows the typed action candidate in a confirm-or-reject dialog before any backend call fires.
3. **M2 — Action registry and host SDK:** A JSON action manifest plus a thin SDK that exposes the host's existing API as typed actions, so the LLM cannot propose writes against unregistered routes.
4. **M3 — Backend agent and proposal pipeline:** Fastify endpoint that takes the operator's request, reads the host registry, asks the LLM for a typed action candidate, persists the proposal, and returns it to the widget.
5. **M4 — Feedback capture and per-host tuning:** A rejection-reason dropdown the design partner uses to flag bad proposals, plus a per-host prompt-tuning loop that consumes the feedback.
6. **M5 — Second and third host:** Repeat the integration on the second and third design partners to validate the pattern generalises, then decide whether to graduate to self-serve onboarding.

## Risks

- **Concierge integration does not scale** — if each host requires bespoke work, the product is a service business. Mitigation: build the SDK so the second host costs significantly less than the first.
- **Bad auto-execution burns trust instantly** — one botched write against a production account ends the design-partner loop. Mitigation: the widget's confirm dialog shows the exact diff, and the host SDK enforces a dry-run mode by default.
- **Action registry drift** — hosts ship breaking API changes; a stale registry will produce failures. Mitigation: a registry-version pin per integration plus a dashboard alert when the host's API drifts.
- **The poster's "I don't know if it's useful to anyone else" honesty is also the validation risk** — the gap may not be large enough to sustain a company. Mitigation: design-partner feedback is the explicit validation gate before any monetization or self-serve motion.
