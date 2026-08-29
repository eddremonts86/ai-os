---
id: "880"
slug: live-threat-monitoring-for-soc-teams-with-incident-visu
title: Live threat monitoring for SOC teams with incident visualization and prioritization
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-wit"
  captured: "2025-10-26"
category: dev
date: "2025-10-26"
tags: [Dev, Other]
country: India
wtp:
  raw: from $20/month
  currency: USD
  min: 20
  max: 20
  period: month
  mrrMid: 20
tech: [React + TypeScript dashboard, Node.js API (real-time WebSocket gateway), ClickHouse or TimescaleDB for time-series events, SQLite with Drizzle ORM for control plane, Coolify + Docker]
---
# Live threat monitoring for SOC teams with incident visualization and prioritization

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Co-founder alignment with the original author; equity and roles documented
- [ ] Choose first upstream ingest adapter (syslog / SIEM webhook / generic HTTP) and stand up the IngestAdapter interface
- [ ] Choose time-series store (ClickHouse vs. TimescaleDB) based on per-seat cost envelope at $20/seat
- [ ] Provision Coolify project + Docker image + SQLite volume + time-series container
- [ ] Wire Resend email-link auth (single org in v1, multi-tenant scaffolding ready)

## Phase 1: Core

- [ ] First IngestAdapter wired end-to-end (upstream → severity → event store)
- [ ] Severity classification engine: events tagged critical / high / medium / low via a configurable rule set
- [ ] Rule-set editor in the dashboard (severity rules, field conditions, action targets)
- [ ] WebSocket gateway: events fan out from the event store to subscribed dashboards per tenant in real time
- [ ] Live timeline + per-severity queue + incident detail view (raw events, contributing events, severity history)
- [ ] Alert router with email (Resend), Slack, and generic-webhook destinations; per-rule routing
- [ ] Alert log per incident and per rule
- [ ] Per-incident response-time metrics surfaced for the team lead
- [ ] Per-tenant retention policy knob (default vs. extended) so the cost envelope is observable
- [ ] End-to-end test: connect the author's SOC pipeline, push a synthetic critical event, see it on the dashboard within a second, route it to Slack, see the response-time metric update

## Phase 2: Deploy

- [ ] Onboard the author's SOC team as the pilot cohort; weekly per-incident response-time review for the first month
- [ ] Move billing to live mode ($20/month per seat)
- [ ] Status page + alert-router health monitoring
- [ ] Add a second IngestAdapter once the first is stable on the pilot cohort's pipeline
- [ ] Decide the MSSP multi-tenant pilot timeline based on what the single-team pilot actually validated
