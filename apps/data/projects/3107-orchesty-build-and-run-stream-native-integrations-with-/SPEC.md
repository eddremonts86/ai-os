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

## Problem

Integration engines that handle mission-critical workflows tend to trap teams in one of two ways: either the platform is closed-source SaaS with opaque internal state, vendor lock-in, and no path to on-premise (MuleSoft, Workato, n8n Cloud), or it is open source but missing the operational primitives that mission-critical work demands (durable retries, dead-letter handling, tenant isolation, observability). The post states the gap directly: existing platforms either lock teams in, fail to scale beyond a single event, or do not give developers control over the runtime.

Orchesty is the founder's answer: a source-available integration engine that scales from a single event to millions via asynchronous queues, exposes SDKs + REST APIs + AI-assisted connector generation, supports private cloud and on-premise deployment with multi-tenancy, and surfaces the same integration infrastructure to AI agents through an MCP layer that handles authorization, auditability, and safe processing of large data volumes.

## Objective

Ship a source-available stream-native workflow engine whose first production user runs a 100k-event/day integration on it without operator intervention, where the same workflow is reachable from both a TypeScript SDK call and an MCP-enabled AI agent, and where the operator can self-host the entire stack on their own infrastructure.

## Target Users

- Primary: platform / SRE / integration engineers at B2B SaaS companies who own a mission-critical integration between internal systems (CRM ↔ billing ↔ warehouse, ERP ↔ fulfillment, support ↔ product) and are tired of paying per-event SaaS fees while having no visibility into queue depth, dead letters, or replay state.
- Secondary: AI-agent builders who need durable, authorized, auditable execution of multi-step workflows from inside an MCP-enabled agent loop, without bolting their own queue layer onto each integration.

## MVP Scope

- Workflow authoring: visual designer + YAML DSL for defining nodes (HTTP webhook, queue trigger, transformer, HTTP call, database write, MCP call).
- Async queue runtime: durable retry, exponential backoff, dead-letter queue, per-tenant isolation, idempotency keys.
- SDKs (TypeScript, Python) and a REST API to register workflows, enqueue events, query run history.
- AI-assisted connector generation: an LLM call that produces a typed connector manifest given a target API's OpenAPI spec.
- MCP server: exposes workflow registration, event enqueue, and run-history queries to any MCP-enabled agent.
- Source-available distribution: full source on a permissive license with a one-command Docker Compose deployment.
- Multi-tenancy: per-tenant namespace, secret store, audit log.
- Observability: OpenTelemetry traces, Prometheus metrics, structured logs.
- Out of scope for MVP: a hosted SaaS control plane, a marketplace of pre-built connectors beyond the AI-generated baseline, a visual debugger for replaying past runs.

## Design Direction

Design direction for the MVP at `https://betalist.com/startups/orchesty` follows the constraints in this SPEC and the chosen stack (TypeScript, Node.js, BullMQ on Redis, PostgreSQL, OpenTelemetry). The visual language targets the platform engineer who lives in a terminal most of the day and wants a UI that gets out of the way.

**Color** — dark surface by default (the operator audience is rarely in a sunny room), one accent for active runs, one muted accent for queued/dead-letter state. No gradients in v1.

**Type** — one mono family throughout (workflow YAML and run history are best read in mono), one text family for prose in the docs panel. No display family; the dashboard does not need one.

**Density** — table-driven, compact, scrollable. Every workflow, every run, every dead-letter gets a row. No card stack.

**Motion** — minimal: status changes animate (queued → running → succeeded) so the operator can see queue drain without reading numbers. No autoplay, no parallax.

## Constraints

- The MVP runs as a single Docker Compose stack with no external SaaS dependency; operators must be able to bring up the whole platform on a fresh VM in under 30 minutes.
- Per-tenant isolation must be enforced at the queue level (namespaced Redis keys + per-tenant Postgres row-level security), not just at the API layer.
- Every MCP-exposed action must be authorized against the calling agent's scope and logged to the per-tenant audit log before execution.
- Source-available license must allow commercial self-hosting without per-seat fees; the founder monetizes via support, hosted control plane, and connector authoring services.
- OpenTelemetry traces must be exportable to any OTLP-compatible backend without code changes.
