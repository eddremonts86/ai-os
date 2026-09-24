# PRODUCT.md — Free GitHub Action that scans PR diffs for malicious code, not quality

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I watched a video recently on malicious code injection into OSS repo PRs and how they can go undetected because of how well they&#x27;re hidden and decided to do a project for this. This tool is essentially used in unison with ai code review bots like greptile. While tools like greptile reason because they run with LLMs, this is a deterministic step before greptile that scans for malicious code (command execution, credential access, exfil, auto-run hooks, obfuscation, and prompt injection; regex + semgrep, no LLM), then can trigger the ai code reviewer like greptile or coderabbit, pointing it to its findings.<p>It&#x27;s free&#x2F;MIT and runs in your CI.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49749862) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
