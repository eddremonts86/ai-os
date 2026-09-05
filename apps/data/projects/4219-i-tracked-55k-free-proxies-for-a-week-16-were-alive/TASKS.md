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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4219-i-tracked-55k-free-proxies-for-a-week-16-were-alive/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the re-validation scheduler: the 30-minute cron, the per-candidate HTTP request to the project's echo endpoint, the live/dead decision per candidate, the dropped-entry handling.
- [ ] Build the proxy database: the live rate, the per-format counts, the per-country top list, the upstream attribution per entry.
- [ ] Build the per-format file generator: `proxies/all.txt`, `proxies/http.txt`, `proxies/https.txt`, `proxies/socks4.txt`, `proxies/socks5.txt`, `proxies/elite.txt`, `proxies/all.json`.
- [ ] Wire the GitHub auto-commit on every re-validation: the seven files committed automatically to the repo.
- [ ] Build the API at `proxmint.com/api/free-proxies`: the country / protocol filters, the sorting, the no-key no-signup access, the 60 req/min rate limit, the 429 response on a breach.
- [ ] Wire the upstream-list pullers: monosans/proxy-list, proxylist.geonode.com, TheSpeedX/PROXY-List, proxifly/free-proxy-list; the merge, the attribution per entry.
- [ ] Add the CC BY 4.0 LICENSE file on the repo.
- [ ] Publish the landing page at `proxmint.com/free-proxies#api` linking the API and the per-format files.
- [ ] Run an end-to-end test: a developer pulls a fresh `proxies/all.txt` and gets entries that were re-validated through a real HTTP request within the last 30 minutes; a developer filters the API at `proxmint.com/api/free-proxies` by country and protocol without a key; the live rate matches the per-snapshot count; every entry the list surfaces carries an upstream attribution; the 60 req/min rate limit returns 429 on a breach.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the API at `proxmint.com/api/free-proxies` with the country / protocol filters, the sorting, and the 60 req/min rate limit
- [ ] Document the re-validation guarantee, the per-format files, the upstream-source attribution, and the CC BY 4.0 license in the README
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
