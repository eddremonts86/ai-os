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

## Tech Stack

- **A re-validation scheduler** that runs every 30 minutes and re-tests every candidate proxy with a real HTTP request to the project's echo endpoint.
- **A proxy database** that tracks the live rate, the per-format file counts, the per-country top list, and the upstream attribution per entry.
- **The per-format file generator** that writes `proxies/all.txt`, `proxies/http.txt`, `proxies/https.txt`, `proxies/socks4.txt`, `proxies/socks5.txt`, `proxies/elite.txt`, and `proxies/all.json` from the proxy database.
- **The API at `proxmint.com/api/free-proxies`** with filters (country, protocol) and sorting, no key, no signup, 60 req/min.
- **The upstream-list pullers** for monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list.
- **The CC BY 4.0 license** matching the source.
- **GitHub auto-commits** as the source's publish surface (`proxies/all.txt`, etc. committed automatically).

## Architecture

The architecture has three surfaces: the re-validation scheduler, the per-format file generator, and the API. The scheduler is the source of truth; the file generator is the publish surface; the API is the developer-facing query surface.

The re-validation scheduler runs every 30 minutes. It pulls candidates from the four named upstreams (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list), merges them, and runs a real HTTP request through each candidate to the project's echo endpoint. Candidates that pass are marked live; candidates that fail are dropped. The proxy database tracks the live rate, the per-format counts, the per-country top list, and the upstream attribution per entry.

The per-format file generator reads the proxy database and writes the seven files the source names. `proxies/all.txt` lists every live proxy as `protocol://ip:port`. `proxies/http.txt` and `proxies/https.txt` list the HTTP and HTTPS proxies. `proxies/socks4.txt` and `proxies/socks5.txt` list the SOCKS proxies. `proxies/elite.txt` lists the proxies with no leak found. `proxies/all.json` lists every entry with country, anonymity, latency, uptime, and score. The files are committed to the repo automatically on every re-validation.

The API at `proxmint.com/api/free-proxies` serves the same data with filters (country, protocol) and sorting, no key, no signup, 60 req/min. The API is the developer-facing query surface; the files are the developer-facing data surface.

## Milestones

1. **M1 — Re-validation scheduler** — the 30-minute cron, the per-candidate HTTP request to the project's echo endpoint, the live/dead decision per candidate.
2. **M2 — Proxy database** — the live rate, the per-format counts, the per-country top list, the upstream attribution per entry.
3. **M3 — Per-format file generator** — `proxies/all.txt`, `proxies/http.txt`, `proxies/https.txt`, `proxies/socks4.txt`, `proxies/socks5.txt`, `proxies/elite.txt`, `proxies/all.json`.
4. **M4 — GitHub auto-commit** — the seven files committed automatically on every re-validation.
5. **M5 — API at `proxmint.com/api/free-proxies`** — the country / protocol filters, the sorting, the no-key no-signup access, the 60 req/min rate limit.
6. **M6 — Upstream-list pullers** — monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list; the merge, the attribution per entry.
7. **M7 — CC BY 4.0 license** — the LICENSE file on the repo.
8. **M8 — Landing page** — `proxmint.com/free-proxies#api` linking the API and the per-format files.

## Risks

- **Re-validation drift** — a candidate the scheduler marks live but the developer's use case cannot reach. Mitigation: the re-validation rate is a metric; the API surfaces a per-proxy success rate per target when the developer reports one; the developer can filter the JSON manually.
- **Upstream-list offline** — one of the four upstreams goes offline. Mitigation: the upstream-attribution accuracy is a metric; the project surfaces a "upstream down" warning when one of the four is unavailable; the re-validation continues with the remaining three.
- **API rate-limit breach** — a developer exceeds 60 req/min. Mitigation: the API surfaces a 429 response; the developer is expected to back off; the rate-limit compliance is a metric.
- **Per-format file drift** — a per-format file count that does not match the live rate. Mitigation: the per-format file count accuracy is a metric; the file generator is rebuilt from the proxy database on every re-validation.
- **Latency drift** — a latency the `all.json` exposes that does not match the live re-validation. Mitigation: the median latency accuracy is a metric; the JSON is rebuilt on every re-validation.
- **CC BY 4.0 attribution gap** — an entry the list surfaces without upstream attribution. Mitigation: the upstream-attribution accuracy is a metric; the merge step refuses an entry without upstream attribution.
- **Future per-format file** — a future launch adds an eighth file (e.g. `all.csv`). Mitigation: the seven-file launch set is documented; the eighth file is a follow-up that does not displace the seven-file surface.
