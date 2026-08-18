---
id: "3019"
slug: adkit-run-research-launch-and-optimize-ads-with-your-ai
title: "AdKit – Run research, launch, and optimize ads with your AI agent"
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/adkit?utm_campaign=startup-182664&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-18"
tags: [BetaList, Beta, Product]
---
# AdKit – Run research, launch, and optimize ads with your AI agent

## Tech Stack

- **Backend service:** Node.js with Fastify, which gives low-overhead HTTP and good support for the OAuth and webhook flows each ad platform expects; TypeScript on top for the typed contracts that six platform APIs demand.
- **Ad-platform adapters:** A per-platform adapter module behind a common `AdPlatformAdapter` interface, so Meta, Google, TikTok, Reddit, LinkedIn, and X each live behind the same call surface and the agent only has to know one shape.
- **Frontend:** React with TanStack Query for the dashboard and a thin chat surface (Vercel AI SDK for streaming) so the same orchestration engine powers both UIs.
- **Database:** PostgreSQL with Prisma — relational data fits campaigns, ads, audit log, and approval queue; Prisma gives typed access without hand-writing SQL for six integration tables.
- **AI orchestration:** A model-agnostic agent layer that talks to Anthropic, OpenAI, or the operator's own agent endpoint, so the chat surface is not locked to one provider.
- **Deployment:** Docker images on a single VPS via Coolify, matching the rest of the AI-OS deploy model, with a sidecar worker for the approval-queue scheduler.

## Architecture

```
                  +-----------------------+
                  |  React dashboard /    |
                  |  chat surface (Vercel |
                  |  AI SDK)              |
                  +-----------+-----------+
                              |
                  +-----------v-----------+
                  |  Fastify API gateway  |
                  +-----------+-----------+
                              |
        +---------------------+---------------------+
        |                     |                     |
+-------+-------+    +--------+-------+    +--------+-------+
| AdPlatform    |    |  Agent core    |    |  Approval      |
| adapters      |    |  (model-       |    |  queue +       |
| (Meta, Google,|    |   agnostic)    |    |  audit log     |
| TikTok, ...)  |    |                |    |                |
+-------+-------+    +--------+-------+    +--------+-------+
        |                     |                     |
        +---------------------+---------------------+
                              |
                  +-----------v-----------+
                  |  PostgreSQL (Prisma)  |
                  +-----------------------+
```

The chat and dashboard both hit the same Fastify gateway. The agent core is a thin orchestrator that calls the ad-platform adapters and writes draft changes to the approval queue; the queue worker is the only path that ever submits a real change to a live ad platform, which is what makes the approve-before-ship contract enforceable.

## Milestones

1. **M0 — Adapter interface:** Define `AdPlatformAdapter` (auth, list campaigns, fetch creative, draft change, submit approved change) and ship a Meta adapter as the reference implementation against Meta's Marketing API.
2. **M1 — Approval queue and audit log:** Postgres schema for campaigns, ads, draft changes, approvals, and audit events; the queue worker reads approved drafts and submits them to the live platform via the adapter.
3. **M2 — Dashboard and chat surface:** React dashboard with TanStack Query for the operator's primary workflow, plus a Vercel-AI-SDK chat surface that calls the same Fastify endpoints as the dashboard.
4. **M3 — Google adapter and creative library seed:** Google Ads adapter to validate the interface on a second platform, plus a creative library seed pipeline that ingests the 500,000+ ads the brief mentions and exposes a clone workflow.
5. **M4 — External agent connector:** A documented adapter so a Claude, GPT, or operator-owned agent can call the same orchestration endpoints the dashboard uses, with the approval gate enforced in front of every mutating call.
6. **M5 — Remaining networks and hardening:** TikTok, Reddit, LinkedIn, and X adapters, rate-limit handling, and a deployment pass on Coolify with the sidecar worker.

## Risks

- **Six network integrations is a heavy v1 commitment** — Meta and Google alone are six months of work. Mitigation: ship Meta + Google as the v1 cut, label TikTok, Reddit, LinkedIn, and X as "in beta" in the UI.
- **API and policy drift on each platform** — every network ships breaking changes on its own cadence. Mitigation: pin adapter versions per platform and surface a "platform SDK version" column in the audit log.
- **Agent drafts that operators never approve** — if the model output is bad, the queue becomes a graveyard and the time-saved claim collapses. Mitigation: track an approval-rate per workspace and alert when it drops below a threshold.
- **OAuth and credential storage** — six platforms means six sets of long-lived tokens; a single credential leak is catastrophic. Mitigation: encrypt tokens at rest, scope each token to the minimum the adapter needs, and offer a one-click revoke flow.
