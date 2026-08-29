---
id: "3695"
slug: passively-earn-btcsolanthropic-for-using-claude-code
title: Passively Earn BTC/Sol/Anthropic for Using Claude Code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484082"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js, Next.js (marketing), shell installer, Base + Solana wallet integration, Anthropic PreStocks (via Solana), Stripe prepaid credits]
---
# Passively Earn BTC/Sol/Anthropic for Using Claude Code

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Publish prmpt.cash landing page (Next.js)
- [ ] Ship one-line installer (`curl -fsSL prmpt.cash/install.sh | sh`) that creates a wallet, signs in, wires Claude Code, Codex, Gemini CLI and Amp
- [ ] Define the plugin → server payload contract: agent final message + session id + install id (no prompts, no files, no repo names, no full IP)

## Phase 1: Core

- [ ] Match pipeline: keyword leg AND vector leg (both must agree), score floor, single model-call usefulness gate
- [ ] Creative rewriting for matched ads (≈200 ms) so the same campaign reads differently per reply
- [ ] One labelled "Sponsored" line printed under matched replies (or in the agent status line)
- [ ] Dollar books + settlement-time conversion to the user's chosen token at fetched price
- [ ] Payouts to user wallets on Base (BTC, ETH, USDC) and Solana (SOL, TINY, ANT) including Anthropic PreStocks on Solana
- [ ] First-deposit handling for new Solana wallets above the rent minimum so SOL payouts are not lost
- [ ] Advertiser onboarding + Stripe prepaid credit + CPM bid + per-matched-impression charging
- [ ] Public /analytics page: impressions, clicks, match rate, every payout linked to its on-chain settlement transaction (no account required)
- [ ] Privacy receipts: publish server-side records of what each plugin transmission contained, to make the privacy posture verifiable rather than claimed
- [ ] End-to-end test: install on Claude Code, run a session that triggers a match, observe the labelled line, settle a payout, see it on /analytics linked to the on-chain transaction

## Phase 2: Deploy

- [ ] Open the repo to outside contributors (CONTRIBUTING, issue templates, CI on the installer and the match pipeline)
- [ ] Add Cursor and Windsurf support once their hook surfaces stabilize
- [ ] Tag a 1.0 release once Claude Code, Codex, Gemini CLI and Amp are all wired and every advertised token can be settled end-to-end
- [ ] Publish a transparency post: what prmpt sends, what it doesn't, and how the public analytics page is computed
