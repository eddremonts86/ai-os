---
id: "3885"
slug: "self-hosted-mobile-friendly-web-ui-for-herdr-agents"
title: "Self-hosted mobile-friendly web UI for Herdr agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497870"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Self-hosted web server, Mobile-friendly UI, Real terminal streaming, Push notifications, File transfer, Agent monitoring API]
---
# Self-hosted mobile-friendly web UI for Herdr agents

## Value Proposition

Your Herdr agents in your pocket. Shepherdr is a self-hosted, phone-friendly web interface that monitors agents, delivers notifications, opens real terminals and sends files — so you can steer agent work from a mobile browser without a hosted dashboard or a laptop.

**One-liner:** A self-hosted, mobile-friendly web UI for Herdr: monitor agents, get notifications, open terminals, send files.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Herdr users on the move | Check and steer agents from a phone instead of returning to a laptop. |
| Self-hosting operators | A web UI they deploy themselves, keeping agent data on their own infrastructure. |
| Terminal-reliant users | Real terminal access to agent sessions from the browser, plus file transfer. |

The repository description names the four interactions; the audience is Herdr users who want them on a phone.

## Jobs To Be Done

1. **Functional job** — Monitor Herdr agents from a mobile browser.

2. **Functional job** — Receive notifications about agent activity.

3. **Functional job** — Open real terminal sessions to agents from the web UI.

4. **Functional job** — Send files to agents without leaving the interface.

## Success Metrics

- **Mobile usability:** all four interactions (monitor, notify, terminal, files) work from a phone screen.
- **Self-hosting ease:** the UI deploys on the user's own infrastructure without external dependencies.
- **Terminal fidelity:** real terminal sessions stream through the browser with usable latency.
- **File transfer:** files reach agents reliably through the interface.

## Pricing & Monetization

None stated. It is a self-hosted open-source interface; no pricing appears in the capture.

## Competitive Landscape

The post names no competitors. The category is agent dashboards and remote terminal UIs — hosted agent monitors, web terminal tools and self-hosted control panels. The stated differentiator is the combination of mobile-first design and self-hosting for the specific Herdr harness, with real terminal access included rather than log viewing only.

## Risks & Open Questions

- [ ] Thin capture: title plus one repository description line; no screenshots, users or feedback are cited.
- [ ] Coupled to Herdr: the UI's usefulness is bounded by Herdr's own adoption and API surface.
- [ ] Real terminals in a mobile browser is a hard interaction; latency and touch keyboards may degrade the experience.
- [ ] Self-hosted means each user runs their own security perimeter; terminal access over the web is a high-stakes surface.
- [ ] No roadmap, releases or maintenance signal in the capture.
