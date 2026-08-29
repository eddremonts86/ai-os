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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A live rating of which VPN providers actually work on a user's network today, derived from a fleet of measurement probes that open real tunnels and report latency, jitter, packet loss and establishment time. The score is per provider per country per protocol, and the trend is visible, so a user can tell whether a provider is degrading or whether the entire category is blocked.

The product is observability for VPN choice, not a review site. The post's complaint is that there is no up-to-date signal; the value is the continuous measurement that turns the absence into a present-tense answer. A provider can claim anything on the marketing page, but the score is what the probe saw on the user's network profile at the timestamp shown.

The site carries no ads, no affiliate links, no sponsored rankings. The independence is the asset; the design protects that asset by keeping the rating reproducible from the raw data and the probe protocol open.

**One-liner:** VpnPulse tells you which VPN providers are actually working on your network right now, scored by a fleet of probes that open real tunnels from inside the regions that matter to you.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Individual VPN user in a blocked region | Needs a present-tense answer rather than a hosted review they cannot trust. |
| Journalist / researcher / remote worker | Cannot afford to discover the tunnel is down at the moment they need to send. |
| Small team / NGO across jurisdictions | Shares one vetted list of providers per region, anchored in measured data. |
| Independent reviewer | Wants a transparent data source to cross-check against their own probes. |
| Provider's own engineer | Treats the public score as a forcing function for their own quality work. |

## Jobs To Be Done

1. **Functional job** — Pick a VPN provider today based on what will actually work on this network.
2. **Functional job** — Watch a provider's score over time so a quiet degradation is visible before a hard failure.
3. **Functional job** — Compare two providers head to head on the user's specific network profile.
4. **Emotional job** — Stop gambling on a renewal that may have stopped working.
5. **Emotional job** — Stop trusting sponsored rankings that read like ads.
6. **Social job** — Share a working provider list with a colleague who is in the same restricted environment.

## Success Metrics

- **Probe uptime** — share of expected probes that landed in the last 24 hours, because a stale score is the failure mode the post names.
- **Probe geographic spread** — number of distinct country vantage points with at least one probe in the last hour, because the user in the post's country needs in-country probes.
- **Provider coverage** — share of providers in the registry that have a fresh, confidence-bounded score.
- **Reproducibility** — share of public scores that an independent reviewer can recompute from the published raw probe data within tolerance.
- **Time to reflect a regression** — minutes from a provider's degradation to the public score reflecting it, because stale data defeats the product.
- **User-side probe contribution** — share of fresh probes that come from opt-in user-side probe clients rather than the maintainer fleet.

## Pricing & Monetization

The post names no price, no tier and no business model. What the architecture does fix is the cost shape: probe traffic is continuous and the fleet scales with the geographic coverage the user wants, while the public site is essentially read-only. Any future monetisation has to come from the consumer of the data — VPN providers, review sites, an API tier for journalists — rather than from the user, because charging the user the rating exists to serve would push the product toward the affiliate model the post is implicitly rejecting.

## Competitive Landscape

- **VPN review sites and affiliate rankings** — produce a verdict, but the post's complaint is precisely that those verdicts are not up to date and not measured from the user's network profile.
- **Network measurement projects** — general-purpose tools that can measure a VPN connection but do not carry a per-provider registry or a present-tense score.
- **Provider-published status pages** — only cover the provider's own infrastructure, not the path from the user's ISP through the regional blocks, which is the layer the post cares about.

The post names no competitor. The shapes above are generic and no specific vendor is claimed here.

## Risks & Open Questions

- [ ] Validate that a probe fleet of a handful of VPS nodes can produce a stable enough score per region without being gamed by providers who recognise the probe traffic.
- [ ] Confirm the public rating pipeline is reproducible end to end by a third party from the raw probe data.
- [ ] Establish the policy when a provider is suspected of optimising specifically for probes rather than for real users; the score must remain honest.
- [ ] Decide whether user-side probe clients ship as a CLI only or also as a small app, because the contribution metric depends on the install path.
- [ ] Measure whether the in-country probe nodes remain reachable during heavy blocking events, and document the failure mode when they do not.
- [ ] Decide how long raw probe data is retained, because reproducibility wants long retention but the probe nodes' own privacy posture wants shorter.
