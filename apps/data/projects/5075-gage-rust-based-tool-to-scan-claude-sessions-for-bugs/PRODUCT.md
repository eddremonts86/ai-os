# PRODUCT.md — Gage – Rust based tool to scan Claude sessions for bugs, other issues

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Gage is an open source (Apache 2) CLI + TUI that scans Claude Code session
transcripts and files issues with evidence.<p>Yesterday it found a bug that I had approved. In the original session Claude
flagged the risk. I didn&#x27;t read carefully, said &quot;go ahead&quot;, and it broke a
feature. Nothing in the commit shows this. It&#x27;s obvious in the session.<p>Sessions contain the code and the reasoning behind it. That makes them a
better source for review than the diff alone.<p>Every issue must cite lines in the session record, so any claim traces to its
source. You can review, fix, or close issues as skipped. Gage integrates with
Claude Code to review and resolve issues from the transcript.<p>Cost: scans run under your Claude login. On a subscription they count against
your plan limits. On usage-based billing they cost about $0.50 to $1.00 per
session. Running it daily, I&#x27;m paying roughly $2 per issue resolved. Some are
minor. Some are not.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49566640) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
