---
id: "3684"
slug: substack-and-x-and-reddit-and-crypto-pow
title: Substack and X and Reddit and Crypto = POW
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485378"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [SvelteKit, TypeScript, PostgreSQL, Drizzle ORM, Nostr relays, eCash (XEC) node integration, Coolify, Docker]
---
# Substack and X and Reddit and Crypto = POW

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3684-substack-and-x-and-reddit-and-crypto-pow/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Post table with `kind` enum: `article`, `microblog`, `thread`; shared Drizzle schema, per-kind body columns
- [ ] Editor that switches modes by post kind; article uses a long-form rich-text body, microblog caps at 280 chars, thread requires a parent post id
- [ ] Unified feed query joining all three kinds, sort by Latest / Top (tip-weighted score) / Following
- [ ] Account model: single user, email + password auth, profile with display name and avatar
- [ ] XEC wallet table: per-account deposit address (derived from a platform xpub), encrypted private key in `wallet_secrets`, balance as Postgres BIGINT in satoshis
- [ ] Wallet service container: subscribes to chronik for any address in the wallet table, writes incoming tx rows, marks tips as confirmed after one block
- [ ] Tip button on every post: modal picks an amount in XEC, broadcasts via the wallet service, optimistic UI flips to "confirming" then "confirmed" on webhook
- [ ] Per-post XEC fee charged at publish time from wallet balance; reject publish if balance is too low
- [ ] Treasury fee on tips: flat bps taken on settlement, recorded in a `treasury_ledger` table
- [ ] Weekly leaderboard: cron rolls up any opt-in game results (eFlappy Bird, fantasy football) into a `leaderboards` table, surfaces top 10 per game, prizes paid out automatically from the treasury
- [ ] End-to-end test: signup → deposit XEC → publish article → receive tip → leaderboard rollup visible

## Phase 2: Deploy

- [ ] Move wallet service to dedicated container with no internet beyond XEC node
- [ ] Schedule encrypted Postgres backups including `wallet_secrets`
- [ ] Onboard 50 pilot writers
- [ ] Set up status page + XEC node latency alerts
- [ ] Post-mortem after week 13 with pilot cohort
