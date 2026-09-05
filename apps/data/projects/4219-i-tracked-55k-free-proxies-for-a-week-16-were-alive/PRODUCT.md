---
id: "4219"
slug: i-tracked-55k-free-proxies-for-a-week-16-were-alive
title: "I tracked 55k free proxies for a week – 1.6% were alive"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507513"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I tracked 55k free proxies for a week – 1.6% were alive

## Value Proposition

A free proxy list at `proxmint/free-proxy-list` that is re-tested every 30 minutes by a real HTTP request through each proxy to the project's own echo endpoint, not pinged, not assumed. Dead entries are dropped, not left to rot. Per-format files (`all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`) and an API at `proxmint.com/api/free-proxies` with filters (country, protocol) and sorting, no key, no signup, 60 req/min.

The project's source-of-truth claim is the live rate. At the source's snapshot, 618 of the upstream's roughly 55,000 candidates are live (about 1.1%), and the project's re-validation drops the rest. Upstream sources are attributed (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list).

**One-liner:** A free proxy list re-validated every 30 minutes through a real HTTP request, with per-format files, a no-key no-signup API, and the dead entries dropped.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers scraping the web | Want a reliable proxy list with a high live rate. |
| API integrators | Want country / protocol filters at `proxmint.com/api/free-proxies`. |
| Researchers studying proxy uptime | Want per-format files (`all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`). |
| Upstream-list maintainers | Want their lists attributed when their entries survive the project's re-validation. |

## Jobs To Be Done

1. **Functional job** — Pull a fresh proxy list from `proxies/all.txt` (or per-format) and get entries that were re-validated through a real HTTP request within the last 5.5 hours.
2. **Functional job** — Filter the API at `proxmint.com/api/free-proxies` by country or protocol, sort, and get a result with no key and no signup.
3. **Functional job** — Track the live rate over time as a researcher studying proxy uptime.
4. **Functional job** — Verify the upstream-source attribution for the entries the list surfaces.
5. **Emotional job** — Stop the feeling that the proxy list the developer just downloaded is mostly dead when the developer tries to use it.
6. **Social job** — Be the developer whose scraping pipeline runs against a re-validated proxy list, not an unvalidated scrape.

## Success Metrics

- **Re-validation rate** — share of entries the list surfaces that passed the real HTTP request to the project's echo endpoint within the last 30 minutes. An entry that did not pass is a freshness breach.
- **Live rate** — share of candidates the project's re-validation marks as live. The source's snapshot is 618 of ~55,000; the metric is the per-snapshot live rate.
- **Per-format file count accuracy** — share of per-format files (`all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`) that match the live rate. A file count that drifts is a per-format-fidelity failure.
- **API rate-limit compliance** — share of API requests that stay within 60 req/min. A request that exceeds the limit is a rate-limit breach.
- **No-key no-signup verification** — share of API requests that succeed without a key. A request that requires a key is a no-key guarantee breach.
- **Upstream-attribution accuracy** — share of entries the list surfaces that have an upstream attribution (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list). An entry without attribution is a license-drift failure.
- **Median latency accuracy** — share of entries the `all.json` exposes whose latency matches the live re-validation. A latency that drifts is a metrics-fidelity failure.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The list and the API are free to use under CC BY 4.0. The plan does not invent a subscription, a per-API-call fee, or a paid tier. Any future monetization has to be measured against the re-validation rate and the live rate, because those are the metrics the source ties to the list's value proposition.

## Competitive Landscape

- **Unvalidated public proxy lists (the names the source does not provide)** — publish a list without re-validation; the source's pitch is the real HTTP request every 30 minutes.
- **Paid proxy services (the names the source does not provide)** — charge per proxy or per GB; the source's pitch is the free + CC BY 4.0 list.
- **Self-hosted proxy checkers (the names the source does not provide)** — require the user to operate the checker; the source's pitch is the hosted list + API.
- **Upstream lists (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list)** — the candidates the project pulls from; the source's pitch is the independent re-validation.

The post names the four upstream sources explicitly.

## Risks & Open Questions

- [ ] Confirm the real HTTP request to the project's echo endpoint is robust against rate limits at the upstream proxies. The source is explicit about the re-validation; the open question is whether an upstream proxy that rate-limits the project's echo request is treated as dead or as flaky.
- [ ] Validate the upstream-attribution accuracy for every entry. The source attributes entries to the four named upstreams; the open question is whether every entry the list surfaces carries the attribution or whether some entries are unattributed.
- [ ] Define the policy on a proxy the project's re-validation marks as live but the developer's use case cannot reach. The list passes the echo request; the developer's target may still reject the proxy. The open question is whether the API exposes a per-proxy success rate per target, or whether the developer has to test the proxy against their target.
- [ ] Confirm the API rate limit (60 req/min) is the right balance. The source names 60 req/min; the open question is whether the rate limit is per IP, per token, or per session, and how the developer is expected to back off.
- [ ] Decide the policy on a future per-format file. The source ships seven files; the open question is whether a future launch adds an eighth file (e.g. `all.csv`) and how the seven-file launch set is preserved.
- [ ] Establish a documented escalation path when an upstream list goes offline. The source pulls from four upstreams; the open question is whether the project surfaces a "upstream down" warning when one of the four is unavailable, or whether the project's re-validation continues with the remaining three.
- [ ] Define the policy on a proxy that is live but slow (median 2,684 ms). The source publishes the median latency; the open question is whether the API exposes a latency filter or whether the developer has to filter the JSON manually.
