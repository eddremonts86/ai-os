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

## Tech Stack

- **Go** for the probe worker and the ingestion API, because a long-running measurement daemon that opens and closes real VPN tunnels wants the resource profile of Go and a single static binary that ships cleanly to a VPS.
- **WireGuard and OpenVPN via wgctrl-go and the openvpn management interface** as the supported protocols, so the probe opens a tunnel the same way the user's client would rather than talking to a provider monitoring port.
- **Prometheus** for the maintainers' internal metrics on probe health, with **Grafana** as the panel surface; the public site reads the rating API, not Prometheus, so Grafana never appears to a visitor.
- **ClickHouse** as the time-series store for raw probe results, sized for the retention horizon the reproducibility constraint sets, and queried by the rating pipeline.
- **Next.js + TypeScript** for the public site and the API consumer, because the site is read-heavy and benefits from incremental rendering with the score table server-rendered.
- **Hetzner VPS** for the probe fleet, because small dedicated nodes in multiple regions are the cheapest way to grow the vantage-point count without a multi-cloud contract.
- **Docker** for packaging the probe worker, the ingestion API and the rating pipeline into separate containers that the maintainer can redeploy independently.

## Architecture

Each probe node runs the Go worker as a single container. The worker reads a per-node configuration that names the providers to test (downloaded from the central registry), the protocol to use, and the schedule. For each (provider, protocol, server) tuple the worker opens a tunnel using the same client libraries the user's VPN client would, runs a short scripted workload (DNS resolution through the tunnel, a small HTTP fetch, an ICMP probe), records latency, jitter, packet loss and tunnel-establishment time, then tears the tunnel down. The result is signed with the probe node's Ed25519 key and posted to the central ingestion API.

The ingestion API authenticates the probe signature, normalises the result into the ClickHouse schema, and stores it alongside the probe node's region tag. The rating pipeline runs every few minutes: it reads the last 24 hours of probes per (provider, country, protocol), aggregates them into a numeric score with a confidence band, and writes the result to a small summary table. The public Next.js site reads from the summary table, never from raw probes, so the read path stays cheap and the score is reproducible from the same raw data the rating pipeline consumed.

The maintainer-facing Grafana stack reads Prometheus directly. It is used for probe uptime, for spotting probe nodes that have dropped out, and for tracking how the probe fleet is distributed across regions. The user-facing site never exposes Grafana, because the post is explicit that the user wants a verdict, not a monitoring dashboard. The reproducibility constraint is enforced by publishing the rating pipeline's code and the raw probe data schema, so an independent reviewer can replay any score and either reproduce it or call the maintainers out.

## Milestones

1. **M1 — Probe worker** — Go daemon that opens a WireGuard tunnel, runs the scripted workload and emits a signed result; tested against one provider in two regions.
2. **M2 — Ingestion and store** — central API plus the ClickHouse schema, with the signature check in front so a compromised probe node cannot poison the data.
3. **M3 — Rating pipeline** — per (provider, country, protocol) score with a confidence band, reproducible from the raw probe data.
4. **M4 — Public site** — Next.js site listing providers, showing the per-region score and a short status timeline; read path goes through the summary table only.
5. **M5 — Maintainer Grafana** — Prometheus + Grafana panel for probe uptime and region distribution, separate from the public site.
6. **M6 — Probe protocol publication** — published spec and a how-to-run-a-probe document so an independent reviewer can join the fleet.

## Risks

- **Probe detection** — a provider who sees a fixed-pattern workload from a known VPS range can route it specially; the workload has to look like a real user session, not a synthetic check.
- **Score gaming** — a provider who runs their own probes to inflate their score is a worse outcome than no score; the reproducibility check and the in-country probe requirement are the defences.
- **In-country node loss** — the probes inside the user's country are the ones that matter, and they are the ones most likely to go dark during a blocking event; the score has to remain honest about their absence rather than silently reweighting.
- **ClickHouse operational cost** — the raw probe data grows with the fleet and the retention horizon; the budget has to be tracked or the bill quietly grows past what the maintainers can afford.
- **Reproducibility drift** — a rating pipeline that is not versioned alongside the raw data will not be reproducible a year later; the dataset and the model version have to be paired in storage.
- **Probe fleet trust** — an invited fleet is a small, motivated one, which is good for honesty but bad for coverage; the public site has to be honest about how many regions are covered today.
