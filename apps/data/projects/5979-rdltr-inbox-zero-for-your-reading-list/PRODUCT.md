# PRODUCT.md — Rdltr – Inbox zero for your reading list

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, for the past few months I’ve been working on a read later app called RDLTR (<a href="https:&#x2F;&#x2F;rdltr.app" rel="nofollow">https:&#x2F;&#x2F;rdltr.app</a>). The whole thing started because I had so many tabs open with stuff I wanted to read, across browsers, Mac, Linux, and iPhone. They cluttered everything and got in the way of other things I had to do.<p>Pocket had just shut down when this idea came up, I looked around, tried Instapaper, Raindrop, Matter, and a few others I forget. They were fine, but they all give you a list that only grows, which is another thing to maintain, and not the model I had in mind. Safari has this Reading List feature where you read something and it drops off the unread list. But it’s Apple only and half worked. What I wanted was inbox zero for reading. Open something, read it, come back, and it’s gone from the queue but still in the archive. You keep going until there is nothing left.<p>Links come in from anywhere. Paste a URL on the page, drag one in, or use the bookmarklet, the Chrome and Firefox extensions, or the Apple Shortcut for the iOS share sheet, plus Vim keys, TL;DR summaries on each link, search across everything you have read or saved, RSS for every list, and it works just as well on the phone.<p>The extensions have a couple of tricks that I use all the time. Shift+DD pulls the article text, cleans it up, and sends it to ChatGPT, Claude, or Gemini in a new tab, so you can ask it anything about what you just read. Shift+AA opens it in the Internet Archive, handy for paywalled sites when you don’t have a subscription.<p>The stack is Bun, TypeScript, HTMX, and SQLite, with SSE so the list updates the moment you save or read something, deployed on a Hetzner VPS.<p>Full disclosure, Claude Code wrote most of it. I still spent a ton of time dogfooding, testing, and polishing the UI until things felt right.<p>Anyway, curious to know what your current setup is for this.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49629747) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
