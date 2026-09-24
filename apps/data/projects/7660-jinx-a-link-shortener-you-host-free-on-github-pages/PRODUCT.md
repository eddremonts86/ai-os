# PRODUCT.md — Jinx – a link shortener you host free on GitHub Pages

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Jinx is just links, a small static website on GitHub to share short links to your stuff. Add your links to one file, turn on GitHub Pages, and point your own domain at it. I built it because the options all seemed wrong for a small team: paid shorteners charge monthly for what&#x27;s essentially a lookup table; free self-hosted ones (YOURLS, Shlink, etc.) still need a server and a database to maintain; and free tiers of hosted services like bitly or tinyurl cap your links or paywall basic features. It’s working well for my team at work.<p>What it does:<p>•  Short links on your own domain (yourname.com&#x2F;thing) that redirect instantly.<p>•  A searchable page listing all your links. Typos are redirected to the search page.<p>•  QR codes for each link, generated in js in the browser, no external API calls.<p>•  Click counts via GoatCounter (free, privacy-preserving, no cookies)<p>• Nested paths if you want them (e.g. contact&#x2F;email, contact&#x2F;whatsapp, etc.)<p>•  Access control for who can edit links is done through github repo access.<p>Why another link shortener?  Paid link shorteners cost money every month for something that&#x27;s really just a lookup table. Free open-source link shorteners require you to host the app somewhere and pay monthly for that instead. Freemium services like bitly paywall you with limits on the number of links, edit ability, sometimes redirect your QR code to an ad . So I built a link shortening tool focused on simplicity as a static website and open-sourced it.<p>Setup: fork the repo, edit the config and the links, turn on GitHub Pages. Takes about five minutes. MIT licensed, free, no ads, no account required beyond GitHub itself.<p>Live example: jinx.fyi
Code: github.com&#x2F;gdmcdonald&#x2F;jinx<p>Would love to hear feedback, what do you like or not like, what would make it more useful for you?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49749716) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
