# PRODUCT.md — Quickly generate and explain complex shell commands

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi everyone,<p>as I spent a substantial amount of time in the console, even today, i sometimes need to think of some complex combination of git&#x2F;find&#x2F;ffmpeg&#x2F;xargs and friends and so i&#x27;ve been using <a href="https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask</a> for some time.<p>Since it appears to be unmaintained i started my own version (yes, thanks to some LLMs work) and i am quite happy with it.
It appears to have gained a lot more features than i initially thought but there it is.<p>My personal highlights are:<p>- can install shortcuts for bash&#x2F;fish&#x2F;zsh for pressing CTRL-W and having the current prompt replaced with the &quot;answer&quot;<p><pre><code>  $ find all images in this directory
</code></pre>
becomes<p><pre><code>  $ find . -type f \( -iname &#x27;*.jpg&#x27; -o -iname &#x27;*.jpeg&#x27; -o -iname &#x27;*.png&#x27; -o -iname &#x27;*.gif&#x27; -o -iname &#x27;*.bmp&#x27; -o -iname &#x27;*.webp&#x27; -o -iname &#x27;*.svg&#x27; -o -iname &#x27;*.tiff&#x27; \)
</code></pre>
in 1-2 seconds.<p>- there is also a review TUI that explains the commands (which can become complex) or retries with another model<p>In any case, it&#x27;s open source, maybe someone else will find it useful as well.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49656218) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
