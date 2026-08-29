---
id: "779"
slug: vpn-users-have-nowhere-to-find-out-if-a-service-will-wo
title: VPN users have nowhere to find out if a service will work reliably on their network — there is no up-to-date rating based on real-time quality monitoring.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/a20h8f74z1-vpn-users-have-nowhere-to-find-out-if-a"
category: productivity
date: "2026-01-21"
tags: [Productivity, Other]
country: Russia
tech: [Go, Prometheus, ClickHouse, Grafana, Next.js, TypeScript, WireGuard, OpenVPN, wgctrl-go, Hetzner VPS, Docker]
---
# VPN users have nowhere to find out if a service will work reliably on their network — there is no up-to-date rating based on real-time quality monitoring.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/779-vpn-users-have-nowhere-to-find-out-if-a-service-will-wo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Go probe worker that opens a WireGuard or OpenVPN tunnel and emits a signed result with latency, jitter, packet loss and establishment time.
- [ ] Stand up the central ingestion API with the Ed25519 signature check and the ClickHouse schema for raw probes.
- [ ] Implement the per (provider, country, protocol) rating pipeline with a confidence band, reproducible from the raw probe data.
- [ ] Ship the Next.js public site that lists providers, shows the per-region score and renders a short status timeline per provider.
- [ ] Add the maintainer-facing Prometheus + Grafana stack for probe uptime and region distribution.
- [ ] Document the probe protocol and how to run an independent probe node, with the reproducibility check described end to end.
- [ ] Launch with at least three Hetzner vantage points across regions the post's country would query.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
