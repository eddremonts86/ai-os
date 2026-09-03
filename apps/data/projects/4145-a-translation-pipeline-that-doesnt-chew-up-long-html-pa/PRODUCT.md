# PRODUCT.md — A translation pipeline that doesn't chew up long HTML pages

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ My site has 1000+ HTML pages. Most of the content is AI-drafted and
poured into templates, so pages tend to be long and full of repeated
structural markup instead of hand-written one-offs.<p>Feed a long HTML page straight to an LLM for translation and it doesn&#x27;t
just mistranslate. It silently drops content. Whole sections vanish,
paragraphs get summarized instead of translated, and the longer the page,
the worse it gets. You get back something that looks like a translation
but is missing half the page, with no warning that anything was lost.<p>Naively splitting the page into smaller chunks, by line or by character
count, doesn&#x27;t fix this. It just cuts through the middle of tags and
sentences, breaking the structure and handing the model fragments that
don&#x27;t mean anything on their own.<p>What actually works is parsing the page into its real structure with
tree-sitter, then chunking along structural boundaries so each chunk is a
complete, meaningful unit and nothing gets silently cut or dropped.
Anything non-translatable, like template logic or layout attributes,
stays out of the model&#x27;s hands entirely. A structural check after
translation catches anything that still slips through, mostly as a
safety net at this point.<p>Ran it for real on 1000+ pages, six languages, output checked by hand.<p>Not pitching anything. Just want to know if this content-loss problem
bites other people translating long pages with LLMs, or if it&#x27;s specific
to how my site is built.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49509437) · **Category:** ask-hn · **Tags:** Ask HN,Problem
