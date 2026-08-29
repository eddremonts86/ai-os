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

## Value Proposition

Doormouse is an open-source Wake-on-LAN reverse proxy that fronts HTTP and TCP services (the SSH case) on machines the operator keeps powered down to save energy. When a request arrives, doormouse sends the magic packet, waits for the backend to come back, and forwards the request through. The author's stated motivation — "I had an old NAS that was using up a lot of energy so I kept it mostly offline. But then I'd have to go turn it on when I actually need to use it" — disappears.

The codebase is heavy on tests, both automated and manual, even though the author is candid that much of the code is AI-generated. The proxy ships as a single binary on the always-on host, configured by one YAML file.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Home users / homelab operators with an old NAS | Want the NAS offline by default and yet reachable when needed. |
| Owners of low-power always-on hosts (Pi / thin client) | Use the low-power host as the doormouse, wake a more capable machine on demand. |
| Small teams / households needing on-demand SSH | Want SSH to a desktop or NAS without paying for 24/7 power. |
| Operators who match the author's exact situation | "I kept it mostly offline, but then I'd have to go turn it on when I actually need to use it." |

## Jobs To Be Done

1. **Functional job** — Front an offline machine's HTTP or TCP service so requests are fulfilled after Wake-on-LAN wakes it, with no manual intervention.
2. **Emotional job** — Stop feeling the energy guilt of an always-on NAS and the friction of having to physically power it on.
3. **Social job** — Stand up a small, well-tested open-source tool that proves AI-generated code can carry its weight under a heavy test suite.

## Success Metrics

- **Backend wake success** — share of incoming requests that result in a fulfilled response, separated into "wake from cold" and "already awake".
- **Wake-to-ready latency** — median and tail latency between magic-packet send and the backend's first successful probe response.
- **Test coverage depth** — coverage percent and integration-test count, both visible in the README; the author's stated posture is that the codebase is "heavy on the tests," so the number is the signal.
- **Single-binary install** — operators can install doormouse with a single binary and a YAML file; no runtime, no database.
- **Operator feedback** — issue and PR activity from operators who wired doormouse in front of their own NAS or desktop.

## Pricing & Monetization

The post is silent on pricing. It states only that doormouse is open source; absent beats invented. There is no mention of paid tiers, hosted offerings, or marketplace fees in the source capture.

## Competitive Landscape

- **Wake-on-LAN tools (`wakeonlan`, vendor utilities)** — the wake half of the loop, but without the proxy that accepts and forwards the request.
- **Reverse proxies (nginx, Caddy, Traefik)** — the proxy half of the loop, but they assume the backend is already up. They have no Wake-on-LAN capability built in.
- **Tailscale / SSH-only remote-access tools** — solve the SSH-from-anywhere problem but assume the SSH host is already powered and reachable. They do not bring a sleeping machine online.
- **Home-server remote power (smart plugs, IPMI)** — bring power back to a sleeping machine but require a separate wake path and do not sit on the request path the way doormouse does.

## Risks & Open Questions

- [ ] The author says much of the code is AI-generated; verify the heavy test posture actually catches regressions in the proxy data path before promising stability.
- [ ] Decide on the idle-shutdown story — is doormouse responsible for putting the backend back to sleep, or only for waking it? The MVP can ship wake-only and decide on sleep later.
- [ ] Network-segment correctness — Wake-on-LAN broadcast must reach the target's NIC; the README needs a clear note on subnet / VLAN setup, since the author's framing assumes a single home network.
- [ ] Health-probe accuracy — TCP-connect is enough for SSH but a poor check for an HTTP service that has accepted a port before its app is ready. Pick the probe per backend.
- [ ] Public-internet exposure — if operators put doormouse on the open internet, the proxy becomes a target; document the assumption that auth and TLS remain on the backend.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49479254) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
