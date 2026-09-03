# PRODUCT.md — Don't trust me bro: fixing GPT-OSS (3.49B tokens, 1k GPU hours, 1x3090)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Long story short, about a year ago, in spite of everybody bashing gpt-oss for broken tool calling and refusals, I thought there&#x27;s something there worth exploring. Model hit a sweet spot for me in that it was the first time I could run full 128k context, factory-precision weights, across parallel requests on a single RTX 3090 at close to 200 tps (well... eventually, but it was still flying at around 100 tps initially which was mind blowing in the before-times).<p>Could and would being two different things, turned out both llama.cpp and vLLM were shitting their pants running the model at the time (love you guys, I know this model was a pita!), particularly around tool calling (vLLM was &#x2F; is broken seven ways to Sunday), mostly due to the Harmony template introduced by OpenAI (which, coincidentally (?) is almost identically implemented in Gemma 4 and somehwat similar in Muse Glimmer, 9-12 months after the gpt-oss release, so OpenAI was on to something there and likely not just for the OSS release but their bigger and closed siblings too).<p>Anyway, validating my hypothesis with the vanilla backends proved impossible at the time.<p>So I did the only rational thing: built an inference harness that fixes the model, then ran probably the most autistic evals in history -- 320,192 questions across 8 seeds, prefilling and decoding over 3.49B tokens, for 1,062 hours of batch size 1 GPU time on a single 3090.<p>In the words of Carl Sagan, to make an apple pie from scratch, you first have to invent the universe. I spent my nights inventing this one in parking lots between food delivery gigs, so I named it burrito.<p>All that just to test whether OpenAI shipped a broken model (spoiler: it didn&#x27;t). Did it work? Here&#x27;s the hero shots for the final boss of tool calling evals: multi-turn, pass@8 (at least 1 seed of 8) and pass^8 (every seed).<p><a href="https:&#x2F;&#x2F;raw.githubusercontent.com&#x2F;iamskeole&#x2F;burrito-evals&#x2F;refs&#x2F;heads&#x2F;main&#x2F;plots&#x2F;phase_5-f02-pass@8.png" rel="nofollow">https:&#x2F;&#x2F;raw.githubusercontent.com&#x2F;iamskeole&#x2F;burrito-evals&#x2F;re...</a>
&gt; task solve rate on at least one seed<p><a href="https:&#x2F;&#x2F;raw.githubusercontent.com&#x2F;iamskeole&#x2F;burrito-evals&#x2F;refs&#x2F;heads&#x2F;main&#x2F;plots&#x2F;phase_5-f03-pass%5E8.png" rel="nofollow">https:&#x2F;&#x2F;raw.githubusercontent.com&#x2F;iamskeole&#x2F;burrito-evals&#x2F;re...</a>
&gt; task solve rate on every seed<p>Sharing everything, MIT:<p>- harness: <a href="https:&#x2F;&#x2F;github.com&#x2F;iamskeole&#x2F;burrito-core" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;iamskeole&#x2F;burrito-core</a>
- evals (incl. full inference traces): <a href="https:&#x2F;&#x2F;github.com&#x2F;iamskeole&#x2F;burrito-evals" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;iamskeole&#x2F;burrito-evals</a>
- fixed jinja template: <a href="https:&#x2F;&#x2F;huggingface.co&#x2F;openai&#x2F;gpt-oss-20b&#x2F;discussions&#x2F;274&#x2F;files" rel="nofollow">https:&#x2F;&#x2F;huggingface.co&#x2F;openai&#x2F;gpt-oss-20b&#x2F;discussions&#x2F;274&#x2F;fi...</a><p>(Detailed analysis on reasoning zones and &quot;optimal effort&quot; levels can be found in the evals repo)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49523381) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
