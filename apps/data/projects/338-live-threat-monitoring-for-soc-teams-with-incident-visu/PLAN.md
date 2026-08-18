---
id: "338"
slug: live-threat-monitoring-for-soc-teams-with-incident-visu
title: Live threat monitoring for SOC teams with incident visualization and prioritization
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-wit"
category: dev
date: "2025-10-29"
tags: [Dev, Other]
country: India
tech: [Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana, Kafka, WebSocket fanout (Centrifugo)]
---
# Live threat monitoring for SOC teams with incident visualization and prioritization

## Tech Stack

- Go (Wazuh-compatible ingest)
- Elasticsearch / OpenSearch
- Grafana
- Kafka
- WebSocket fanout (Centrifugo)

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for dev runs as a single backend service on the stack (Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-w` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in India, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For India, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-w`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`338-live-threat-monitoring-for-soc-team`), pin dependencies for Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana, and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-w` with no feature creep. A single user from India can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for India, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from India test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Alert pipeline backpressure.** A misbehaving customer can flood the ingest; per-customer rate limits and a backpressure-aware console are required.
- **Severity calibration.** Initial severity scoring is rarely right; the first 30 days of analyst overrides train the weights.
- **Tenant leakage risk.** A single missing tenant_id predicate is a confidentiality incident; all queries must go through a query layer that injects it.
