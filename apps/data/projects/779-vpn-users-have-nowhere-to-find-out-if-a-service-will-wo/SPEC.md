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

## Problem

The capture is a one-line problem statement: VPN users have nowhere to find out if a service will work reliably on their network, and there is no up-to-date rating based on real-time quality monitoring. The title is the entire ground truth; the only other metadata is `country: Russia`, which is consistent with the post's VPN framing and the censorship environment that drives VPN adoption in the first place but is not explicitly referenced in the body.

The actor in the title is a VPN user, not a VPN provider. The pain is the absence of an observability surface that covers the actual path the user cares about — their network, their ISP, the egress the VPN lands on — rather than the marketing-grade claims on a provider's landing page. The missing thing is an up-to-date rating, which implies continuous measurement rather than a one-shot review.

The capture names no specific VPN protocol, no measurement metric (latency, jitter, packet loss, blocking events), no business model and no country list. The honest reading of the source is that a user in the post's `country: Russia` context, and any other country with active blocking, needs a community-driven feed of "this provider works on my network today" that the user can act on before signing up or renewing.

## Objective

Ship a real-time VPN quality rating service that aggregates passive and active probes from a distributed set of measurement agents, produces an up-to-date score per VPN provider per network profile, and surfaces that score to a user who is deciding which provider will actually work on their connection today. The unit of success is a user can look up a provider on the site and see a recent, network-specific verdict rather than a vendor-supplied boast.

## Target Users

- Individual VPN users in countries with active blocking who need to know which providers currently route traffic for them today.
- Journalists, researchers and remote workers whose jobs depend on a working tunnel and who cannot afford to discover the failure at the moment they need to send.
- Small teams and NGOs operating across multiple jurisdictions who share a vetted list of providers per region.
- Independent VPN reviewers who need a transparent data source rather than a sponsored comparison.
- VPN providers themselves, who would use the public score as a forcing function on their own quality.

## MVP Scope

- A Go-based probe worker that runs on a fleet of small VPS nodes in multiple countries, each opening a tunnel to a target provider over WireGuard or OpenVPN and recording latency, jitter, packet loss and tunnel-establishment time.
- A central ingestion API that accepts probe results, signed by the probe node's own key, and writes them to a ClickHouse store sized for time-series.
- A provider registry maintained by editors and the community, with each provider carrying a profile (protocols, supported ports, advertised servers) that the probes can target.
- A rating pipeline that aggregates the last 24 hours of probes per (provider, country, protocol) into a numeric score and a confidence band, exposed as a small JSON API.
- A Next.js public site that lists providers, shows the score per region, and renders a small status timeline per provider so the trend is visible.
- A privacy-preserving submission endpoint where a user running a local probe client can opt in to contribute their measurements, with no personal data required.
- A Grafana panel that the maintainers use to spot probe outages and provider regressions, served alongside the public site.
- A documented probe protocol so an independent reviewer can run a probe node and verify the public scores against their own.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Probe traffic must use the same protocols and ports the provider advertises; the system measures what a real user would see, not a synthetic connection to the provider's monitoring endpoint.
- The public score must reflect probes from many vantage points, not a single VPS — a single-region measurement can be wrong about the user the post is asking about.
- The submitter of a probe must not be personally identifiable from the measurement itself; if a probe node is compromised, the leak is the network profile, not the operator.
- The site must stay usable when the regional blocks intensify: probes from inside the affected country matter more than probes from outside, and the system has to keep that distinction honest in the score.
- The rating pipeline must be reproducible from the raw probe data — anyone with the data should be able to recompute the public score, so a single bad model cannot poison the signal.
- The probe fleet must be small enough to run on a handful of Hetzner nodes and grow by invitation rather than a paid probe marketplace, which is the failure mode the post's framing points at.
