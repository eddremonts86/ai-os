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

## Tech Stack

- **Installer / agent plugin:** a single shell script (`curl -fsSL prmpt.cash/install.sh | sh`) that creates a wallet, signs the user in, and wires up Claude Code, Codex, Gemini CLI and Amp via their native hook surface.
- **Marketing site:** Next.js (consistent with the live prmpt.cash site, which uses Next.js image components and the App Router conventions).
- **Plugin → server transport:** the plugin sends only the agent's final message, a session id and an install id; coarse country is derived server-side from a stripped IP that is then discarded.
- **Match pipeline:** keyword leg + vector leg (both must agree), score floor, single cheap model call that answers "would a user actually find this useful". Creative rewriting for matched ads is the same model call (≈200 ms).
- **Settlement engine:** books kept in dollars; conversion to the user's chosen token happens only at settlement, fetching price right then, settling to a Base or Solana wallet they control.
- **Token support:** Coinbase Wrapped BTC (Base), native ETH (Base), native SOL (Solana), USDC (Base), TINY (Solana), and ANT (Anthropic PreStocks on Solana).
- **Advertiser-side:** prepaid credit via Stripe, per-impression CPM billing, public analytics page with impressions / clicks / match rate and each payout linked to its on-chain transaction.
- **No backend database required for the user-side plugin** beyond session/install id and the wallet handle; settlement transactions are public on Base / Solana, which doubles as the audit trail.

## Architecture

```
                          ┌────────────────────────────┐
                          │  prmpt plugin (in agent)   │
                          │  - hook final reply        │
                          │  - send msg + session id   │
                          │      + install id          │
                          │      (no prompts/files/IP) │
                          └─────────────┬──────────────┘
                                        ▼
                          ┌────────────────────────────┐
                          │  prmpt match pipeline      │
                          │  keyword AND vector → floor│
                          │  → usefulness model call   │
                          └──────┬───────────────┬─────┘
                                 │ (no match)    │ (match)
                                 │               ▼
                                 │   ┌──────────────────────────┐
                                 │   │  Rewrite creative for    │
                                 │   │  this reply (~200 ms)    │
                                 │   └─────────┬────────────────┘
                                 │             ▼
                                 │   one labelled Sponsored line
                                 │   printed under the reply
                                 ▼
   ┌────────────────────────────────────────────────────────────────┐
   │  prmpt clearing (books in USD)                                 │
   │  advertiser CPM bucket  ─▶  user share 70% / prmpt 30%         │
   │  settled at withdrawal: convert at fetched price → user token  │
   └─────────────────────┬──────────────────────────────────────────┘
                         ▼
            Base or Solana wallet (BTC / ETH / SOL /
            USDC / TINY / ANT)

  Advertiser side (parallel):
   Stripe prepaid credit → CPM bid → matched impression charged →
   public /analytics page (impressions, clicks, match rate, payouts)
```

## Milestones

1. **M0 — Repo and one-line installer.** Public repository with the shell installer, wallet creation, sign-in, and agent wiring for Claude Code, Codex, Gemini CLI and Amp. End of week 2.
2. **M1 — Match pipeline + usefulness gate.** Keyword + vector legs, score floor, single model-call usefulness gate, and creative rewriting on match. End of week 5.
3. **M2 — Settlement engine.** Dollar books, settlement-time conversion, payouts to Base / Solana wallets for BTC, ETH, SOL, USDC, TINY and ANT. End of week 7.
4. **M3 — Advertiser side + Stripe prepaid.** Advertiser onboarding, prepaid credit, CPM bid, per-matched-impression charging. End of week 9.
5. **M4 — Public analytics page.** Public impressions / clicks / match rate / payouts view, each payout linked to its on-chain transaction, no login required. End of week 11.
6. **M5 — Privacy receipts.** Publish server-side receipts of what each plugin transmission actually contained; promote the privacy posture from claim to verifiable. End of week 13.

## Risks

- **Agent-platform hook stability.** The product depends on a stable, read-only hook into Claude Code, Codex, Gemini CLI and Amp. Any change to those platforms that restricts third-party plugins observing the agent's final output would block the entire pipeline.
- **Privacy regression severity.** Sending prompts, files, repository names, or full IPs would be a product-killing incident, not a recoverable bug. The plugin payload must be locked down at the protocol level, not just by convention.
- **Token-settlement reliability.** Payouts that fail on Base or Solana because of chain congestion, fee spikes, or new-wallet rent requirements (SOL needs a first deposit above the rent minimum) directly reduce user retention and trust.
- **ANT / Anthropic PreStocks dependence.** The marquee token is a pre-IPO vehicle with terms that can change; if Anthropic's IPO or PreStocks' mechanics shift, the ANT payout path must degrade to the next on-chain pre-IPO option without breaking the install.
- **Strictness of the usefulness gate.** Loosening it would let advertisers spend budgets but destroy the only thing users are tolerating the product for. The floor and the gate must be policy-locked, not tunable per campaign.
- **Public-analytics page as a single point of credibility.** Once impressions, clicks, match rate and payouts are public and linked to on-chain transactions, any discrepancy becomes a trust event; the data pipeline behind the page has to be tamper-evident by construction.
