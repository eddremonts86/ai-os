---
id: "237"
slug: vpn-users-have-nowhere-to-find-out-if-a-service-will-wo
title: VPN users have nowhere to find out if a service will work reliably on their network \u2014 there is no up-to-date rating based on real-time quality monitoring
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/a20h8f74z1-vpn-users-have-nowhere-to-find-out-if-a"
category: productivity
date: "2026-01-21"
tags: [Other]
country: Russia
tech: [Go, ClickHouse, Next.js 14, WebSocket, Telegram Bot API, Prometheus + Grafana]
---
# VPN users have nowhere to find out if a service will work reliably on their network — there is no up-to-date rating based on real-time quality monitoring

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/237-vpn-users-have-nowhere-to-find-out-if-a-service-will-wo/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Go probe daemon with concurrent TCP / TLS / HTTP probes
- [ ] ClickHouse schema for probe results (vantage, vpn_config, service, ts, latency, ok)
- [ ] 5 initial Russian residential-IP vantage points
- [ ] Next.js dashboard with per-service and per-VPN rankings
- [ ] Aggregation jobs in ClickHouse for last-1h, last-24h, last-7d
- [ ] Telegram bot with /subscribe and per-service alert flow
- [ ] Prometheus exporter on probe daemons
- [ ] Initial coverage of 50 most-accessed services from Russia

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Go, ClickHouse, Next.js 14) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 237-vpn-users-have-nowhere-to-find-out- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Go, ClickHouse, Next.js 14 errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
