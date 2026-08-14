---
id: "338"
slug: live-threat-monitoring-for-soc-teams-with-incident-visu
title: Live threat monitoring for SOC teams with incident visualization and prioritization
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-wit"
category: dev
date: "2025-10-29"
tags: [Dev, Other]
country: India
tech: [Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana, Kafka, WebSocket fanout (Centrifugo)]
---
# Live threat monitoring for SOC teams with incident visualization and prioritization

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-wit` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/338-live-threat-monitoring-for-soc-teams-wit/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: India`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for India.
- [ ] Implement the smallest slice from MVP Scope that proves the Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana integration in production.
## Phase 1: Core

- [ ] Wazuh-class alert ingest via Kafka (preferred) or REST webhook, with parser producing normalized events
- [ ] Incident grouping: 30-min temporal window + same asset + same signature collapses to one incident
- [ ] Severity scoring: signature x asset x prior-incident, with weights tunable from the console
- [ ] Live console: incident feed sorted by severity, asset + customer filter, drill-down to raw events
- [ ] WebSocket (Centrifugo) live updates so the analyst view is push, not poll
- [ ] Tenant isolation enforced at the query layer, not in application code
- [ ] Pilot with one Indian MSSP, 5 customers, 4-week analyst-feedback window

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 338-live-threat-monitoring-for-soc-team MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
