# PRODUCT.md — Eulix - Code navigation for large codebases

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey I&#x27;ve been working on Eulix, a tool for navigating large codebases.<p>It parses a repository into symbols, call graphs and other structural information, then combines that with keyword and semantic retrieval to find relevant code.<p>I tested it on OpenStack (~6.9M LOC &#x2F; 29k files). One query about Nova&#x27;s PCI passthrough scheduling pulled back the relevant filters, helpers and related call paths in well under a second once indexed.<p>Some queries don&#x27;t need an LLM at all, since Eulix can answer directly from the structured codebase data.<p>It&#x27;s open source and runs locally:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;Nurysso&#x2F;eulix" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;Nurysso&#x2F;eulix</a><p>I&#x27;d especially like feedback from people who&#x27;ve worked on code search, static analysis, or large monorepos.<p>on a side note it may be able to handle 30M+ loc codebase too, I haven&#x27;t been able to test such huge repos cause I don&#x27;t have a good enough gpu to embed parsers output! :)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49714268) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
