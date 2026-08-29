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

## Problem

Developers running coding agents like Claude Code, Codex, Gemini CLI and Amp spend hours every day inside a terminal where no advertising channel has ever reached them, while at the same time the developers themselves produce valuable "intent" signal — the text of the final reply that just finished — that no conventional ad-targeting system can read. prmpt.cash (Show HN by user enamakel, 6 points) is the author's answer: a one-line installer (`curl -fsSL prmpt.cash/install.sh | sh`) that wires up every coding agent it finds, creates a wallet, signs the user in, and from then on prints a single labelled "Sponsored" line under the reply (or in the agent status line) when an advertiser's offer is a match for what was just written. The user keeps 70% of whatever the advertiser paid, regardless of clicks, accruing while they work and settling to a Base or Solana wallet. The engine keeps its books in dollars and only converts at settlement, so advertiser dollars turn into buy pressure for whatever token the user chose to be paid in — including Anthropic pre-IPO "PreStocks" on Solana (the ANT token), Coinbase Wrapped BTC on Base, native ETH on Base, native SOL, USDC, or TINY. The targeting is intent-based: prmpt reads the reply the agent just finished, runs keyword + vector legs that both have to agree and clear a score floor, and asks one cheap model call whether a user would actually find the matched creative useful. Nearly every reply fails one of those gates, which is exactly why the survivors are worth buying. Crucially the plugin sends only the agent's final message, a session id and an install id — never prompts, files, repository names, or full IP (resolved only to a coarse country, then discarded). Every impression, click, match rate and payout is published on a public analytics page with each payout linked to the transaction that settled it.

## Objective

Build a non-intrusive, intent-matched ad layer that pays coding-agent users 70% of advertiser spend in the crypto token of their choice (including Anthropic PreStocks on Solana), settles to their Base or Solana wallet while they keep working, and sells that inventory to advertisers as "the two seconds after a reply where the problem is still on screen" — at a CPM that funds both the user's share and a real clearing business.

## Target Users

- Primary: working developers who already run Claude Code, Codex, Gemini CLI or Amp daily, and who want a passive side-channel that pays them in BTC / ETH / SOL / USDC / ANT (Anthropic PreStocks) for the attention the terminal already absorbs.
- Secondary: advertisers — primarily dev-tools and infra companies — who need a channel that reaches high-intent developers at the exact moment the agent has just surfaced a problem the advertiser's product solves, and who want CPM-priced intent inventory with a public analytics page.
- Tertiary: AI-agent ecosystem builders who want a reference implementation of an "ad layer over agent output" that respects privacy (no prompts, no files, no repo names, no full IP) and is auditable on-chain.

## MVP Scope

- A one-line installer (`curl -fsSL prmpt.cash/install.sh | sh`) that wires up Claude Code, Codex, Gemini CLI and Amp, creates a wallet, signs the user in, and starts accruing payouts.
- A plugin layer that hooks the agent's final reply, a session id and an install id (no prompts, no files, no repo names, no IP beyond coarse country), and emits one labelled "Sponsored" line per matched impression.
- An intent-matching pipeline (keyword + vector legs, score floor, single model-call usefulness gate) so nearly every reply fails and only the genuine matches print.
- Per-impression creative rewriting (~200 ms model call) so the same campaign reads differently to someone debugging a race than to someone sizing a database.
- Token-settlement engine that keeps books in dollars and converts at settlement, paying out 70% to the user's wallet on Base or Solana, with support for BTC, ETH, SOL, USDC, TINY and ANT (Anthropic PreStocks on Solana).
- A public analytics page with impressions, clicks, match rate and every payout linked to its on-chain settlement transaction; no account required to read it.
- Advertiser-side: prepaid credit through Stripe, per-impression CPM bidding, billing only for impressions that actually matched (no volume-buying, no contract, no seat fee).
- Cursor and Windsurf support marked as coming-soon and out of MVP.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Per-impression, not per-click settlement on the user side: 70% of what the advertiser paid accrues regardless of clicks, which sets the floor on advertiser-side matching strictness.
- The user-side privacy bar is non-negotiable: no prompts, no repository names, no files, and IP resolved only to coarse country and then discarded — any regression here is a product-killing incident, not a bug.
- Books are kept in dollars and only converted at settlement, so advertiser-side revenue and user-side token choice are decoupled and the engine does not need a continuous price feed.
- Match rate is intentionally throttled by design (keyword + vector + floor + usefulness gate) — loosening it to spend a budget is explicitly off-limits and is documented as a constraint, not a knob.
- Cursor and Windsurf are deferred; only Claude Code, Codex, Gemini CLI and Amp ship in MVP.
- No paid ad spend or paid impression is "bought in bulk"; advertisers are billed only for impressions that actually matched.
