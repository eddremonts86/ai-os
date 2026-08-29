---
id: "3596"
slug: doormouse-a-reverse-proxy-that-wakes-sleeping-servers-v
title: Doormouse – a reverse proxy that wakes sleeping servers via Wake-on-LAN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479254"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Go, Wake-on-LAN, YAML config, Systemd unit]
---
# Doormouse – a reverse proxy that wakes sleeping servers via Wake-on-LAN

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Pick the open-source license and confirm it is visible on the repo's first page
- [ ] Set up a Go module with the four internal packages: `wol`, `config`, `proxy/http`, `proxy/tcp`
- [ ] Write the `wol` package: magic packet builder and UDP broadcast sender, with unit tests on the byte layout
- [ ] Define the YAML schema: `backends[]` with `name`, `protocol`, `listen`, `backend_addr`, `mac`, `broadcast`, `wake_timeout`, `probe`
- [ ] Set up a Systemd unit (`doormouse.service`) and a packaging note for a single static binary
- [ ] Decide the structured-log format (`slog`) with fields: `backend`, `mode`, `wake_from_cold`, `first_ready_ms`

## Phase 1: Core

- [ ] Implement HTTP proxy mode: listener per backend, `httputil.ReverseProxy`, wake-on-dial-failure path
- [ ] Implement TCP relay mode: listener per backend, per-connection goroutine, wake-on-dial-failure path
- [ ] Implement the wake loop: send magic packet, poll probe, succeed or time out with a clear client error
- [ ] Implement pluggable health probes: TCP-connect default, optional HTTP `GET` per backend
- [ ] Multiple-backend support: distinct listeners, distinct wake paths, distinct probe policies
- [ ] Idle-shutdown hook (configurable, off by default): call a configured shutdown command after the idle window
- [ ] Test suite: unit tests for `wol`, integration tests with a fake backend that simulates "cold start then accept", end-to-end tests that drive the request path through wake
- [ ] Manual-test checklist in the README: the kinds of scenarios an operator would actually run, plus how to read the structured logs
- [ ] Coverage and integration-test counts published in the README so the "heavy on the tests" claim is checkable
- [ ] README walkthrough that takes an operator from a fresh Pi to a working doormouse in front of their NAS in five minutes

## Phase 2: Deploy

- [ ] Public GitHub repo with the binary, the Systemd unit, and the README walkthrough
- [ ] First three operators onboarded on real hardware (their NAS, their desktop, their Pi); collect feedback on wake latency and probe accuracy
- [ ] Issue template and a small set of `good first issue` labels so operators can report back cleanly
- [ ] A published comparison of wake-to-ready latency across the operator set, so the headline numbers are real and not aspirational
- [ ] Documentation pass: subnet / VLAN notes for the wake broadcast; an honest note on what doormouse is not (not the security boundary, not a public-internet auth layer)
