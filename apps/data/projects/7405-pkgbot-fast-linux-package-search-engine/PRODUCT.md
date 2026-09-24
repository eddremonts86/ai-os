# PRODUCT.md — Pkgbot – Fast Linux package search engine

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I recently switched to NixOS and in the process of setting it up, found the package search on its repo site very clunky and tedious. No permalink to share, no way to find or sort by recency or version.<p>That got me thinking that most repo websites, including aggregators like pkgs.org and repology.org have the same issue with UX (AUR is nice and simple though).<p>So I made <a href="https:&#x2F;&#x2F;pkg.bot" rel="nofollow">https:&#x2F;&#x2F;pkg.bot</a> on top of the excellent Repology data dump specifically with the following subjective goals:<p>- Good, non-bloated, non-clunky UI and UX (opinionated, the way I would like it)
- Sorting and filtering across many parameters (license, &gt;version &lt;last_updated etc.)
- Speed (results render in single-to-double digit ms)<p>It has ~2.7m packages across 100+ package repos indexed. There are JSON APIs + CSV APIs (for direct terminal display &#x2F; easy LLM querying). I&#x27;m planning to add a DNS server also so that packages can by queried over DNS ala <a href="https:&#x2F;&#x2F;dns.toys" rel="nofollow">https:&#x2F;&#x2F;dns.toys</a><p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;knadh&#x2F;pkg.bot" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;knadh&#x2F;pkg.bot</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49730611) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
