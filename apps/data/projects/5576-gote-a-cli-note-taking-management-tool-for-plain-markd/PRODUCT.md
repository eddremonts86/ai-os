# PRODUCT.md — Gote – a CLI note-taking management tool for plain Markdown

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;banorton&#x2F;gote" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;banorton&#x2F;gote</a><p>I built a note taking management tool to use at work for quick note taking and searching. It is intended to be quite minimal. Another focus was to have lots of shortcuts and to keep things close to the homerow for ergonomics and speed.<p>Notes are just markdown files in whatever directory you point it at. The only thing it keeps elsewhere is an index in ~&#x2F;.gote. If you stop using it you still have all your notes.<p>Tags go on the first line of the note, separated by periods, like .project.urgent.work. No frontmatter.<p>Search is built into the binary, BM25 with stemming, so there&#x27;s no ripgrep or fzf to set up. gote s meeting searches titles and content, gote s -t .work filters by tag, gote s -w 2412 pulls up notes from December 2024.<p>Most commands have a two letter version that combines a list with an action. ro is recent + open, sv is search + view, tp is tag + pin. When results come up you pick one with a home row key instead of arrows or numbers.<p>Binaries for mac&#x2F;linux&#x2F;windows are on the releases page, or go install github.com&#x2F;banorton&#x2F;gote@latest if you have Go.<p>The goal of this project was not to learn something new or build something impressive. I simply had a need and filled it with a vibe-coded solution. I have been using it for about a year now and it does more or less exactly what I wanted. So I thought I&#x27;d share in case others are interested in using it, contributing to it, or want to use it as a reference for their own solution.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49600397) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
