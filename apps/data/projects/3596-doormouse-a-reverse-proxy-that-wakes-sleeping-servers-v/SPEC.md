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

## Problem

The author opens with a personal situation: they had an old NAS that used a lot of energy, so they kept it mostly offline. The friction was the predictable one — when they actually needed to use it, they had to go physically turn it on. The fix is doormouse, which the author describes as a Wake-on-LAN reverse proxy.

The proxy covers both protocol shapes the author names: web apps over HTTP and TCP services like SSH. When a request arrives at a service hosted on the offline NAS, doormouse sends the Wake-on-LAN packet, waits for the machine to come back, and then fulfils the request. The energy-saving posture and the "go turn it on manually" friction disappear together.

The project is open source. The author is candid that much of the code is AI-generated, but the same author says the codebase is heavy on tests — both automated and manual — and explicitly invites feedback.

## Objective

Ship doormouse as a small, well-tested Wake-on-LAN reverse proxy that fronts HTTP and TCP services on machines the operator keeps powered down to save energy. The first deployment must accept incoming requests for a configured backend, send the Wake-on-LAN packet to bring the backend online, wait for the machine to come back, and then forward the request through. It must ship with a test suite the author can stand behind despite the AI-generated origin of much of the code.

## Target Users

- Home users / homelab operators with an old NAS or low-use home server they want to keep offline by default and only spin up on demand.
- People running always-on low-power devices (a Raspberry Pi, a thin client) as the doormouse host, with a more capable machine they want to wake only when needed.
- Small teams or households that want SSH access to a desktop or NAS without leaving it powered 24/7.
- Anyone whose motivation matches the author's stated one: "I had an old NAS that was using up a lot of energy so I kept it mostly offline."

## MVP Scope

- A doormouse binary that runs on an always-on host and fronts one or more backends.
- HTTP proxy mode: accept inbound HTTP(S) for a configured backend, wake it on demand, then forward the request.
- TCP proxy mode: the SSH-shaped case — accept inbound TCP for a configured backend port, wake it on demand, then forward the TCP stream.
- Wake-on-LAN packet sender using the standard magic packet format, configurable per backend with the target's MAC address and broadcast address.
- Health probe so doormouse knows when the backend has actually come back (TCP connect, optional HTTP probe).
- Idle-shutdown hook (optional in v1) so the backend can be powered down again after a configured idle period.
- YAML config file with the list of backends, each carrying its protocol shape, MAC, wake timeout, and idle policy.
- Systemd unit so the binary runs cleanly on a Linux host.
- A test suite — both unit and integration — that the author describes as heavy, covering the proxy data path, the wake timing, and the request-fulfilment loop.
- Out of scope for MVP: Windows / macOS as the always-on host (Linux only), built-in authentication / TLS termination beyond what the underlying proxy already does, GUI configuration.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49479254` follows the constraints in `3596-.../SPEC.md` and the chosen stack (Go, Wake-on-LAN, YAML config, Systemd unit). The author frames doormouse as a small personal tool they wrote for their own problem; the visual surface is therefore a CLI binary, a single config file, and a short README. There is no dashboard or UI in the MVP.

For show-hn category, the defaults lean toward a documentation-first surface: the README is the front door, the YAML config is the user-facing artifact, and the test output is the credibility signal — the author is explicit that the codebase is heavy on tests, so the test runner output is part of the demo.

**Color** — terminal defaults; one accent for the "backend awake" indicator, one muted accent for "wake pending". No gradients, no UI.

**Type** — one mono family, used everywhere (CLI, config samples, log lines). The product is a CLI; the type system serves the terminal.

**Density** — tight, table-shaped output for the status command; generous spacing in the README so a new operator can wire a backend in five minutes.

**Motion** — none. The product is a daemon; motion lives in logs and timing.

## Constraints

- Open source (the author's stated posture); the license must be visible on the repo's first page.
- Single binary on the always-on host. Operators should not need to install a runtime, a database, or a web server to run doormouse.
- Heavy test coverage — the author's stated stance. Treat the test suite as a load-bearing deliverable, not a CI decoration.
- Linux is the supported always-on host for the MVP. Wake-on-LAN support on the target machine is assumed to be enabled in firmware.
- The proxy must not silently drop requests during the wake window; the user has to know whether they are waiting for the backend to wake or whether something is actually wrong.
- The proxy is not the security boundary — the author positions doormouse as a forwarding layer; auth and TLS remain the backend's responsibility in the MVP.
