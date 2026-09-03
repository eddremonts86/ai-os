# PRODUCT.md — Watn – type a question in your shell, get a command back

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ When trying to figure out some complex shell command (What&#x27;s the actual incantation of the git command, find or ffmpeg for my usecase?),
i used to use <a href="https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask</a> for some time, which seems to be unmaintained.
Also it tied to openrouter and some predefined model list.
So i set out to build a better version.<p>In the end, the new implementation added some new (maybe unique) features, like pressing CTRL-W in a shell prompt
and having the text being replaced by some proper command to be executed with enter.<p>Here is a quick glimpse of what it looks like the terminal:<p><pre><code>  $ find the top 5 largest files ever committed in this git repository (-&gt; hit CTRL-W &lt;-)
  $ git rev-list --objects --all | git cat-file --batch-check=&#x27;%(objecttype) %(objectsize) %(rest)&#x27; | sed -n &#x27;s&#x2F;^blob &#x2F;&#x2F;p&#x27; | sort -rn | head -n 5
</code></pre>
I&#x27;m curious to hear feedback and maybe someone else does find it useful as well.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49518777) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
