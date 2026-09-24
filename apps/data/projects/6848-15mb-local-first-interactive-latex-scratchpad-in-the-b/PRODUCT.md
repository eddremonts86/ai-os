# PRODUCT.md — <15MB Local-first Interactive LaTeX Scratchpad in the Browser

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I am working on a very modular typesetting engine called TeLoX, intended as a superset of the capabilities (of at least) XeTeX and pdfLaTeX, written in Rust. The main goals are modularity and speed (which we know sometimes fight each other unless we try to be principled about it). Today I wanted to demonstrate these diegetic interactive sliders that control values within in LaTeX from the browser (kinda like marimo).<p>This isn&#x27;t meant to be a complete editor like quicklatex and texlyre -- just a tiny playground that loads quickly enough and responds interactively to see how good I can get the typing experience to be. Package support is the weakest link right now so lots of reasonable LaTeX you type up will fail. Increasing coverage fights against fast load times, and so I&#x27;ll add some &#x27;code splitting&#x27; -- I can make the editor dynamically fetch cached blobs for the most common $k$ packages and see how much time that buys me. After I add support for Lua or some other simple expression language, seems like you could make some really beautiful receipts&#x2F;calculators fairly easily.<p>The other interesting thing you&#x27;ll notice is that clicking and dragging on text selects the associated input text really accurately, down to the word. I have an art project that I was working on that was blocked by this exact issue -- being unable to correctly attribute a click back to the exact word that generated it (essentially an interactive storybook, WYSIWYG computational notebook with diegetic inputs). That&#x27;s now unblocked. I wanted to make a choose-your-own adventure game that takes place _in_ a book on the web.<p>This whole thing is quite difficult, but I think it&#x27;s worth it. I know it&#x27;s an ambitious notion to bring arbitrary support for arbitrary LaTeX to arbitrary devices, but it feels like it&#x27;s leading somewhere interesting.<p>Desktop gives the best experience for now, and even still it loads slower than I&#x27;d like at ~2.5 sec on cold boot. I should probably default mobile to view mode. A PWA version, bookmarklet support for typesetting the current page, etc, all possible, not started yet. I&#x27;m most interested in optimizing my in-memory representation first, and if that&#x27;s not enough, I&#x27;d make a lexical dependency tracker for the TeX interpreter under the hood and deal with mutations&#x2F;overwriting in a sensible way, possibly svelte style. Like I said, a lot of work. Sharing now before my semester kicks in and my free time is gone. &quot;Baby steps,&quot; as they say.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49689856) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
