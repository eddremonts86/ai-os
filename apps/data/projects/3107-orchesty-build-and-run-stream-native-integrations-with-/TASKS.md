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

## Phase 0: Scaffold

- [ ] Decide on the source-available license text and the conversion-to-OSS delay.
- [ ] Stand up the monorepo with `apps/api`, `apps/web`, `packages/sdk-ts`, `packages/dsl`, `docker-compose.yml`.
- [ ] Write SPEC.md (this document).
- [ ] Write DESIGN.md with the dark-surface mono-driven dashboard tokens.
- [ ] Set up CI: typecheck, lint, unit tests, multi-tenant-isolation e2e tests.

## Phase 1: Core

- [ ] Implement the workflow YAML DSL parser and validator.
- [ ] Implement the BullMQ-backed queue runtime with per-tenant namespaces, exponential backoff, and a dead-letter queue.
- [ ] Implement the REST API: register workflow, enqueue event, query run history.
- [ ] Implement the TypeScript SDK: typed client for the REST API with retry and idempotency-key helpers.
- [ ] Implement Postgres row-level security for per-tenant isolation.
- [ ] Implement OpenTelemetry tracing + Prometheus metrics + structured logging.
- [ ] Implement the AI-assisted connector generator (OpenAPI → typed manifest) with a human-review step.
- [ ] Implement the MCP server: per-agent scope, audit log, and three reference workflows.
- [ ] Write tests: unit tests for the DSL parser, integration tests for the queue runtime, end-to-end multi-tenant isolation tests, contract tests for the MCP server.

## Phase 2: Deploy

- [ ] Write the Docker Compose self-host bring-up script and the 30-minute-from-zero operator runbook.
- [ ] Deploy a hosted control plane to a Hetzner VPS via Coolify for the founder's own use.
- [ ] Verify production telemetry on a 100k-event/day workload.
- [ ] Document the pricing tiers and the migration path from self-host to hosted control plane.
