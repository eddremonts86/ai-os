---
id: "538"
slug: meta-graph-api-is-easily-one-of-the-most-frustrating-ap
title: Meta Graph API is easily one of the most frustrating APIs I’ve ever integrated
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voaiyf/meta_graph_api_is_easily_one_of_the_most/"
category: saas
date: "2026-08-14"
tags: [saas, developer-tools, meta-api, sdk]
tech: [TypeScript, Python, Next.js, Cloudflare Workers, libsodium, Stripe]
---
# Meta Graph API is easily one of the most frustrating APIs I've worked with

## Phase 0: Scaffold

- [ ] Create `apps/538-meta-graph-api-is-easily-one-of-the-most-frustrating-ap/` (Next.js + TypeScript on Cloudflare Workers)
- [ ] Initialize git with `.gitignore` excluding the encrypted token store
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Provision the TypeScript SDK package (`@meta-token/sdk`) and the Python SDK package
- [ ] Wire the hosted proxy with libsodium-encrypted token storage
- [ ] Set up the Meta App + the test accounts for the silent-reset probe
- [ ] Wire Stripe for the paid tiers

## Phase 1: Core

- [ ] SDK: `metaToken({ accountId, scopes })` returns a valid long-lived token
- [ ] Automatic token rotation (refresh long-lived before expiry)
- [ ] Silent-reset detection (probe on every call, webhook on silent reset)
- [ ] App-Review permission-loop pre-flight helper
- [ ] Dashboard: per-account token health, expiry, last reset, current scopes
- [ ] Signed JSON webhooks for silent-reset and App-Review events

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 10 design-partner SaaS engineers
- [ ] 90-day Meta-release-notes monitoring job to catch API churn
- [ ] Post-mortem at week 9
