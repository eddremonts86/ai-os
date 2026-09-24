# SPEC.md — Nexus-Arc – pay-per-call and job escrow for AI agents on Arc

## Problem

Hi HN — I built Nexus-Arc.<p>AI agents can call APIs and run multi-step work, but they still cannot open a Stripe account or hold a corporate card. Prepaid credits lock capital; L1 fees make $0.001 calls uneconomic; L2 batch latency breaks tight loops.<p>Nexus-Arc is a dual-rail gateway live on Arc mainnet (chain 5042), where USDC is native gas:<p>1. Synchronous rail — HTTP 402 &#x2F; x402. Agent hits an endpoint unsigned, gets a 402 + challenge, signs a Permit2 &#x2F; EIP-712 voucher, retries with PAYMENT-SIGNATURE. Settlement is in-process, sub-second, pay-per-call. No API keys.<p>2. Asynchronous rail — ERC-8183 escrow (NexusJobs). Client locks a USDC budget, provider submits a deliverable hash (IPFS&#x2F;Arweave), evaluator releases payout. State machine: Open → Funded → Submitted → Terminal. Expiry refunds the client.<p>Live screener (expect HTTP 402 on an unpaid GET):
<a href="https:&#x2F;&#x2F;nexus-arc.pryx.dev&#x2F;v1&#x2F;screener" rel="nofollow">https:&#x2F;&#x2F;nexus-arc.pryx.dev&#x2F;v1&#x2F;screener</a><p>Explorer: <a href="https:&#x2F;&#x2F;explorer.arc.io" rel="nofollow">https:&#x2F;&#x2F;explorer.arc.io</a><p>Stack is Bun + Effect TS on Arc. Fees are small (x402 ~0.1% + $0.0005; escrow 75 bps on completion).<p>Happy to answer questions on the 402 self-facilitation path, Permit2 vouchers, or the escrow evaluator. What should I wire next — MCP tools, more paid APIs, or agent identity (ERC-8004)?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49737113)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T06:28:52Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
