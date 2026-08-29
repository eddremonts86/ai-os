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

## Tech Stack

- **Binary:** Go, single static binary. Go's net and net/http give a clean foundation for both the HTTP proxy mode and the raw TCP relay the SSH case needs.
- **Wake-on-LAN:** a small Go package that builds and sends the magic packet to the configured broadcast address. No third-party daemon; doormouse owns the wake path.
- **HTTP proxy mode:** `httputil.ReverseProxy` from the standard library, with the wake step injected between dial failure and request forwarding.
- **TCP relay:** `net.Listener` + per-connection goroutine copying bytes between client and the (woken) backend, the simplest correct shape for SSH-style traffic.
- **Health probe:** pluggable per backend — TCP connect by default, optional HTTP `GET` against a configurable path for HTTP backends.
- **Config:** YAML, parsed once at start. One `doormouse.yaml`, one list of backends, each carrying protocol, MAC, broadcast, wake timeout, idle policy.
- **Service packaging:** a Systemd unit file installed alongside the binary so operators run `systemctl enable --now doormouse`.
- **Logging:** structured logs (slog) with one line per request, including wake-from-cold vs. already-awake, and the backend's first-ready timestamp.
- **Tests:** a test suite the author describes as heavy, covering unit tests for the wake packet builder, integration tests that bring a fake backend up on demand, and end-to-end tests that drive a real Wake-on-LAN flow against a virtual NIC where possible.

## Architecture

Doormouse runs on an always-on host — a Raspberry Pi or any low-power Linux box. The operator writes a YAML config listing each backend they want to expose: a hostname, a protocol (HTTP or TCP), a port, the backend's MAC address, the broadcast address, and a wake timeout. Doormouse opens one listener per backend.

When a request arrives, doormouse first checks whether the backend is already reachable. If yes, the request is forwarded immediately. If not, doormouse sends the magic packet to the configured broadcast address and polls the health probe until the backend answers or the wake timeout expires. On success, doormouse forwards the original request through to the now-awake backend; on timeout, it returns a clear error to the client so the user knows the wake did not land.

For TCP mode, the relay holds the client connection open through the wake window and starts forwarding the moment the backend accepts a connection. For HTTP mode, the wake happens on the first dial attempt that fails; subsequent requests reuse the same connection pool for the now-awake backend.

## Milestones

1. **M0 — Single-backend HTTP wake.** A `doormouse.yaml` with one HTTP backend, magic packet send, health probe, and a request forwarded end-to-end through the wake.
2. **M1 — TCP mode.** The same wake loop, but for a raw TCP stream (the SSH case the author named).
3. **M2 — Multiple backends.** A single doormouse instance fronts several backends with distinct listeners, MACs, and probe policies.
4. **M3 — Idle-shutdown hook.** A configurable idle window after which doormouse tells the backend to power off again (e.g. via a configurable shutdown command); wake-only remains the default.
5. **M4 — Operator packaging + test posture.** Systemd unit, README walkthrough, and a test suite that the author is happy to defend as heavy, with coverage and integration-test numbers visible in the README.

## Risks

- **AI-generated code under a test-only credibility claim** — the author is candid that much of the code is AI-generated; the test suite is the load-bearing trust signal. If the tests are shallow, the README claim collapses; if they are deep, this is a positive differentiator.
- **Wake-on-LAN reach** — magic packets are layer-2 broadcasts; routers and VLANs can silently drop them. Operators need a clear note on subnet setup, otherwise "doormouse doesn't work" is the only failure mode they will see.
- **Health-probe accuracy** — TCP connect works for SSH but a service that accepts a port before its app is ready will pass the probe and still return 502. Per-backend probe configuration is required from day one.
- **Long wake windows** — first request after a cold start can take many seconds; the client experience (timeouts, retries) is part of the product. A 502 vs. a clear "waking, retry" matters.
- **Single-binary, single-host** — fine for the author's framing (one NAS, one Pi), but operators with multiple sites will outgrow the architecture quickly; call that out in the README before they assume it scales.
