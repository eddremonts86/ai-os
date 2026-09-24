# PRODUCT.md — Nexus-Arc – pay-per-call and job escrow for AI agents on Arc

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN — I built Nexus-Arc.<p>AI agents can call APIs and run multi-step work, but they still cannot open a Stripe account or hold a corporate card. Prepaid credits lock capital; L1 fees make $0.001 calls uneconomic; L2 batch latency breaks tight loops.<p>Nexus-Arc is a dual-rail gateway live on Arc mainnet (chain 5042), where USDC is native gas:<p>1. Synchronous rail — HTTP 402 &#x2F; x402. Agent hits an endpoint unsigned, gets a 402 + challenge, signs a Permit2 &#x2F; EIP-712 voucher, retries with PAYMENT-SIGNATURE. Settlement is in-process, sub-second, pay-per-call. No API keys.<p>2. Asynchronous rail — ERC-8183 escrow (NexusJobs). Client locks a USDC budget, provider submits a deliverable hash (IPFS&#x2F;Arweave), evaluator releases payout. State machine: Open → Funded → Submitted → Terminal. Expiry refunds the client.<p>Live screener (expect HTTP 402 on an unpaid GET):
<a href="https:&#x2F;&#x2F;nexus-arc.pryx.dev&#x2F;v1&#x2F;screener" rel="nofollow">https:&#x2F;&#x2F;nexus-arc.pryx.dev&#x2F;v1&#x2F;screener</a><p>Explorer: <a href="https:&#x2F;&#x2F;explorer.arc.io" rel="nofollow">https:&#x2F;&#x2F;explorer.arc.io</a><p>Stack is Bun + Effect TS on Arc. Fees are small (x402 ~0.1% + $0.0005; escrow 75 bps on completion).<p>Happy to answer questions on the 402 self-facilitation path, Permit2 vouchers, or the escrow evaluator. What should I wire next — MCP tools, more paid APIs, or agent identity (ERC-8004)?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49737113) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
