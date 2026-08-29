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

## Tech Stack

- **Frontend:** SvelteKit SPA + TypeScript, server-side rendered for article pages so search engines see real text (the source site already ranks for article URLs).
- **Backend:** SvelteKit server endpoints + a Node.js worker that polls an eCash (XEC) full node for incoming tip transactions and reconciles them against pending tip records.
- **Data:** PostgreSQL with Drizzle ORM; custodial wallet keys live in a separate `wallet_secrets` table encrypted at rest with libsodium, never written to logs.
- **Token integration:** eCash (XEC) full node via chronik client; one block confirmation is enough for tip UI to flip to "confirmed".
- **Deployment:** Coolify + Docker, single instance, with a managed backup of the wallet secret table every 6 hours.

## Architecture

```
Browser ─▶ SvelteKit (SSR for article + microblog; CSR for feed)
                │
                ├─▶ /api/posts/* ──▶ Drizzle/Postgres (articles, microblogs, threads)
                │
                ├─▶ /api/tips/* ──▶ wallet service ──▶ XEC node (chronik)
                │                       │
                │                       └─▶ webhook on 1-conf ──▶ Drizzle/Postgres
                │
                └─▶ cron (every 10 min) ──▶ leaderboard rollup ──▶ Drizzle/Postgres
```

The wallet service runs in the same Coolify instance as the app but in a separate container with no outbound network beyond the XEC node; that boundary is what makes the "treasury keeps custody" model defensible without buying a managed HSM. The article, microblog, and thread tables share a single `posts` table with a `kind` enum, so a single feed query can render all three shapes.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + XEC integration plan approved. End of week 1.
2. **M1 — Post shapes.** Article, microblog, and thread editor + unified feed render. End of week 3.
3. **M2 — Wallet + tips.** Custodial XEC wallet per account, deposit address, tip flow with 1-conf webhook, treasury fee. End of week 5.
4. **M3 — Posting fee + tipping economics.** Per-post XEC fee charged from wallet balance, treasury fee on tips, balance ledger. End of week 7.
5. **M4 — Leaderboards.** Weekly leaderboard surface for opt-in games, prize pool funded from treasury. End of week 9.
6. **M5 — Pilot.** 50 writers onboarded, 30-day retention check, treasury break-even reviewed. End of week 13.

## Risks

- **Custodial wallet attack surface.** Holding user XEC keys makes the platform a high-value target. The wallet container must run with no internet beyond the XEC node, and the secret table must be encrypted with a key that lives outside the database backup; one breach empties every user wallet.
- **Posting fee too low → spam, too high → no writers.** The source site already iterated on this and the answer is not obvious. v1 should set the fee conservatively and surface an admin knob; pricing is a Phase 2 lever, not an M0 decision.
- **XEC finality UX.** eCash finalises after one Avalanche pre-confirmation plus the next block; if the node is misconfigured or behind, the tip UI will lag. The wallet service needs a watchdog that pages on tip-confirmation latency over 30s.
- **Self-hosting burden.** A single Coolify instance plus an XEC full node is two long-running services for one product. The installer must be one script and the wallet container must auto-recover from node restarts without operator intervention, or self-hosters will abandon the install.
