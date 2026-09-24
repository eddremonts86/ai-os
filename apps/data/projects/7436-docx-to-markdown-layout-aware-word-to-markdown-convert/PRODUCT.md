# PRODUCT.md — Docx-to-Markdown – layout-aware Word to Markdown converter

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN, I’m the author of the <a href="https:&#x2F;&#x2F;github.com&#x2F;eigenpal&#x2F;docx-editor" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;eigenpal&#x2F;docx-editor</a>, it’s an SDK that implements Word-compatible layout engine in Typescript.<p>Today, we are releasing Word to markdown converter library. It’s open source and published under Apache 2.0 license. It uses our layout engine, so it can return accurate, per-page markdown blocks (with headers, footers, and image references). We also handle fonts (Google fonts as fallback) or let you pass your font files upfront for accurate content measurement.<p>To our surprise, Word to per-page Markdown conversion is not a solved problem even in 2026! We initially faced this friction when preprocessing Word documents for agentic workflows. For our use case, it was important to represent per-page content in markdown. Initially, we ended up using LibreOffice sidecar to convert to PDF and then using .pdf -&gt; .md library. This was not ideal given that LibreOffice sidecar that was sitting idle most of the time.<p>This issue is addressed with docx-to-markdown library. it can be used directly in your Typescript ingestion pipeline. Try with your docs at <a href="https:&#x2F;&#x2F;www.docx-editor.dev&#x2F;solutions&#x2F;word-to-markdown" rel="nofollow">https:&#x2F;&#x2F;www.docx-editor.dev&#x2F;solutions&#x2F;word-to-markdown</a>.<p>(if you catch any bugs please let us know in the comments &#x2F; or file gh issues)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49728477) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
