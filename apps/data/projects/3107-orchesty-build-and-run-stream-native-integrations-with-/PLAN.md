---
id: "3107"
slug: orchesty-build-and-run-stream-native-integrations-with-
title: Orchesty – Build and run stream-native integrations with full developer control
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/orchesty?utm_campaign=startup-184376&utm_medium=atom&utm_source=newsfeed"
  captured: "2026-08-26"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product, Integration, B2B, Developer-Tools]
tech: [TypeScript, Node.js, BullMQ on Redis, OpenTelemetry, MCP SDK, PostgreSQL]
---
# Orchesty – Build and run stream-native integrations with full developer control

## Tech Stack

- **Runtime:** Node.js (TypeScript) for the API + workflow engine; Python SDK in v2.
- **Queue:** BullMQ on Redis with namespaced keys per tenant.
- **Storage:** PostgreSQL with row-level security for per-tenant isolation; S3-compatible object store for run-history payloads.
- **Observability:** OpenTelemetry SDK → OTLP exporter; Prometheus metrics endpoint; structured JSON logs.
- **MCP:** the official MCP TypeScript SDK, with a per-tenant scope object that constrains what each agent can enqueue or query.
- **AI-assisted connector generation:** OpenAI / Anthropic API call gated by the founder's own account; the generated connector manifest is committed to the repo and reviewed by a human before publishing.
- **Distribution:** Docker Compose for self-host; permissive source-available license (BSL-style with a non-compete carve-out for SaaS clones).

## Architecture

```
┌──────────────┐      ┌──────────────┐      ┌──────────────┐
│  Web UI      │─────▶│  Orchesty    │─────▶│  PostgreSQL  │
│  (Designer)  │      │  API (REST)  │      │  + RLS       │
└──────────────┘      │              │      └──────────────┘
                      │              │      ┌──────────────┐
┌──────────────┐      │              │─────▶│  Redis       │
│  TypeScript  │─────▶│  Workflow    │      │  (BullMQ,    │
│  SDK         │      │  Engine      │      │  per-tenant) │
└──────────────┘      │              │      └──────────────┘
                      │              │
┌──────────────┐      │              │      ┌──────────────┐
│  MCP-enabled │─────▶│  MCP Server  │      │  Audit log   │
│  Agent       │      │  (scoped)    │─────▶│  (Postgres)  │
└──────────────┘      └──────────────┘      └──────────────┘
```

The workflow engine reads workflow definitions from Postgres, enqueues events onto the per-tenant Redis namespace, drains the queue with at-least-once delivery semantics, and writes per-run records back to Postgres. The MCP server sits in front of the same API but enforces per-agent scope on every call.

## Milestones

1. **M0:** Workflow YAML DSL ratified; per-tenant queue + retry + dead-letter primitives working in a single-process Node app.
2. **M1:** Multi-tenant isolation via Postgres RLS + Redis namespace; REST API + TypeScript SDK covering register, enqueue, query.
3. **M2:** AI-assisted connector generator: given an OpenAPI spec, produce a typed connector manifest in under 60 seconds with a human-review step.
4. **M3:** MCP server with per-agent scope, audit log, and three reference workflows (HTTP → DB, queue → webhook, MCP → DB) shipping as examples.
5. **M4:** Docker Compose self-host distribution with a one-command bring-up script; observability via OTLP + Prometheus.
6. **M5:** First external self-hosted production user running 100k+ events/day.

## Risks

- **MCP wedge cannibalizes SaaS tier.** If every MCP-enabled agent ends up running on a self-hosted instance, the hosted control plane never reaches the founder's revenue target. Mitigation: the hosted control plane offers features self-hosters cannot run themselves (multi-region failover, audit-log retention beyond a year, FedRAMP-aligned compliance posture).
- **Source-available license forks.** A well-funded team forks the project and ships a closed SaaS clone. Mitigation: BSL-style license with a delayed open-source conversion and a non-compete carve-out for SaaS clones.
- **Per-tenant isolation breaks.** A bug in the Redis namespace layer lets one tenant read another tenant's queue. Mitigation: end-to-end multi-tenant tests in CI that run on every PR.
- **OpenTelemetry export adds latency.** Naive synchronous OTLP exports can add 10–50ms per span. Mitigation: batched span export with a backpressure-aware queue.
