---
id: "3457"
slug: watches-user-sessions-finds-bugs-that-matter-and-fixes-
title: "Watches user sessions, finds bugs that matter, and fixes them"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466704"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Observability, Agent, Open Source]
tech: [TypeScript, PostgreSQL, ClickHouse, OpenTelemetry, Docker Compose]
---
# Watches user sessions, finds bugs that matter, and fixes them

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Pick the OSS license (permissive but defensive against cloud resellers)
- [ ] Single `docker-compose.yml` with: web UI, ingestion API, Postgres, ClickHouse, recording storage
- [ ] Issue-view schema in Postgres with a "ranked by distinct users affected" index strategy
- [ ] Decide the verification-gate protocol for PR opening (what "verified" means, what is out of scope)
- [ ] Pick the OSS-license and write the CONTRIBUTING + SECURITY policy stubs

## Phase 1: Core

- [ ] Browser SDK: install snippet captures errors, console logs, network requests, session recordings
- [ ] Ingestion API: write fan-out into ClickHouse for events, object storage for recordings
- [ ] Issue view: per-project list, ranked by distinct users affected (not raw event count)
- [ ] Frustration-signal detection: rage-click, dead-click, abandoned-form detector on session recordings
- [ ] Project-aware context: agent ingests the host repo, builds a low-cost context index, uses it during triage
- [ ] PR-creation flow: agent proposes, runs the verification gate, opens a PR only on green; record PR outcomes against the gate decision
- [ ] MCP server exposing `issues_affecting_users` and a per-issue `next_action` tool, both reachable from Claude Code
- [ ] Self-host quick-start: a single `docker compose up` brings the stack to a state where `curl localhost/api/health` returns 200
- [ ] Redaction defaults for session recordings: form values, URL params, console payloads scrubbed before storage
- [ ] Docs: install + SDK snippet + a documented example of the agent opening a verified PR

## Phase 2: Deploy

- [ ] Public GitHub repo with the Docker Compose stack, the SDK, and the MCP server in one tree
- [ ] Demo video (`youtu.be/ccuOTYQMeYg`) linked from the README; transcript inlined for crawlers
- [ ] First three design partners onboarded, each running the self-host stack on their own infra
- [ ] Dashboard-noise-reduction number published as a self-host benchmark the team can re-run
- [ ] Post-mortem at week 12: verifier precision, false-positive bug catch rate, and MCP-loop usage as the headline metrics
