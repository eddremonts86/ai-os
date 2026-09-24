# PRODUCT.md — Tech Event Bingo – Track Events in Tech on a Bingo Card

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ With shopify buying TailwindCSS, I thought, &quot;hey, I definetly had this on my tech bingo card.&quot;<p>So then I thought it&#x27;d be fun to build an app to generate these.<p>Put in your X handle (optional), get a card with a permanent URL, download it as a PNG. No signup, no cookies beyond the admin one nobody but me uses.<p>How it&#x27;s built, since that&#x27;s the part HN actually cares about: one Cloudflare Worker with Hono, D1 for storage, Tailwind v4, and workers-og (Satori + resvg) for the PNGs. The PNG rendering was the only hard part. Satori only speaks a subset of flexbox, so the HTML card and the image card are two separate renderers reading from one theme file so they can&#x27;t drift. Cold renders take a few seconds, longer than social crawlers wait, so PNGs are pre-rendered at card creation, stored as blobs in D1, and cached at the edge.<p>The 120ish squares are hand-written. There&#x27;s an admin page where Claude drafts new ones and I approve or reject them one at a time. Roughly a third of its drafts survive.<p>Happy to hear which squares you&#x27;d add. &quot;Cloudflare outage breaks the web&quot; is already on there, in case you&#x27;re wondering whether this site is exempt.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49629447) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
