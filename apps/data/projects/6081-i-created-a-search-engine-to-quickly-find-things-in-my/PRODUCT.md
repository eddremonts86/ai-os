# PRODUCT.md — I created a search engine to quickly find things in my source code

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I like to reuse code I&#x27;ve already written.  But with so many projects over the many years, it&#x27;s sometimes hard to remember which project I did a given thing in or even what the parameters of a rarely used Win32 API function are.  I needed something that could easily find what I needed without the slowness of a recursive grep (especially since my projects can span many different locations in the filesystems and even many different computers&#x2F;OSes) or the increasing difficulty in getting what you want from search engines on the internet.<p>This search engine implements TF-IDF and BM25 algorithms.  It has both C TUI programs and a web interface via a node.js server which accesses the daemons.  It&#x27;s written for Windows and Linux.  The user can use whatever flow they want - one-shot query vs. daemon (client&#x2F;server), commandline tools vs web interface, secure vs. non-secure, etc.  This project also serves as (IMHO) a rather good example of all sorts of things such as socket programming, OpenSSL programming, node.js programming, JSON processing, etc.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49631258) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
