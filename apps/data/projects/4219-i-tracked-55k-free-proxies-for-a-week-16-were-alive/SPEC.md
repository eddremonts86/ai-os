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

## Problem

Most public proxy lists are unvalidated scrapes where the majority of entries are already dead when you download them. Free Proxy List (`proxmint/free-proxy-list`) is different: every entry is re-tested every 30 minutes by a real HTTP request through it to the project's own echo endpoint, not pinged, not assumed. Entries that stop answering are dropped, not left to rot. At the source's snapshot, 618 live proxies from 67 countries, median latency 2,684 ms, every entry last passed the test within 5.5 hours (median 1.5 hours).

The source is the GitHub repository for `proxmint/free-proxy-list`, published under CC BY 4.0. The README publishes a per-format file breakdown: `proxies/all.txt` (618 entries), `proxies/http.txt` (348), `proxies/https.txt` (24), `proxies/socks4.txt` (128), `proxies/socks5.txt` (118), `proxies/elite.txt` (313, no leak found), `proxies/all.json` (618 with country, anonymity, latency, uptime, score). The top countries are US (75), Russia (50), Indonesia (45), China (38), Germany (24), India (23), Singapore (22), France (21), Brazil (19), Colombia (18). The repo's candidates are pulled from upstream lists (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list) and then independently validated.

The API at `proxmint.com/api/free-proxies` serves the same data with filters (country, protocol) and sorting, no key, no signup, 60 req/min. The source is explicit that the project is not the origin of these proxies.

The source names the actor (a developer scraping the web who needs a reliable proxy list), the pain (unvalidated public lists are mostly dead when the developer downloads them), and the missing thing (a proxy list that is re-tested every 30 minutes through a real HTTP request, with dead entries dropped). It does not name a specific scraping tool, a specific country preference, or a specific commercial offering.

## Objective

Build the proxmint free proxy list: a re-validated-every-30-minutes proxy list at `proxmint/free-proxy-list` and the API at `proxmint.com/api/free-proxies`, with per-format files (`all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`), 60 req/min no-key no-signup access, and the upstream-source attribution the source names (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list).

## Target Users

- Developers scraping the web who need a reliable proxy list with a high live rate.
- Developers integrating the API at `proxmint.com/api/free-proxies` for filtering by country or protocol.
- Researchers studying proxy uptime who need a per-format breakdown (`all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`).
- Upstream-list maintainers (monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list) whose lists the project pulls from.

## MVP Scope

- A re-validated-every-30-minutes proxy list at `proxmint/free-proxy-list` with the per-format files the source names (`all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`).
- A real HTTP request through each proxy to the project's own echo endpoint, every 30 minutes, with dead entries dropped.
- The API at `proxmint.com/api/free-proxies` with filters (country, protocol) and sorting, 60 req/min, no key, no signup.
- The per-format file count and the per-country top list the source publishes.
- Upstream-source attribution for monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list.
- CC BY 4.0 license.
- A landing page at `proxmint.com/free-proxies#api` linking the API and the per-format files.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The proxy list is re-validated every 30 minutes by a real HTTP request through each proxy to the project's own echo endpoint, not pinged, not assumed. A re-validation that pings is a coverage gap.
- Dead entries are dropped, not left to rot. A dead entry the list surfaces is a freshness breach.
- The supported per-format files are `all.txt`, `http.txt`, `https.txt`, `socks4.txt`, `socks5.txt`, `elite.txt`, `all.json`. The plan does not invent a different file.
- The API at `proxmint.com/api/free-proxies` is no key, no signup, 60 req/min. The plan does not invent a key, a signup, or a different rate.
- The upstream sources are monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list. An upstream the list pulls from without attribution is a license-drift failure.
- The license is CC BY 4.0. The plan does not invent a different license.
- The project is not the origin of these proxies. The plan does not invent an origin claim.
- The live-rate metric (the source's 1.6% alive finding) is the unit of trust the developer reads.
