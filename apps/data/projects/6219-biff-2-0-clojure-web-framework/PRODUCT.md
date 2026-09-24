# PRODUCT.md — Biff 2.0 (Clojure web framework)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Biff is a web framework that I originally released 6 years ago.[1] I&#x27;ve just finished more-or-less rewriting it from scratch. The main changes:<p>- SQLite is now the default database.<p>- Datastar is used for server-side rendering.<p>- Introduces biff.graph[2] and biff.fx, two libraries that both help structure your application logic.<p>- Biff is now &quot;just&quot; a collection of independent libraries rather than a single monolithic framework, which makes it much easier to swap out the various parts. e.g. using a non-default database is much less work now.<p>I&#x27;d been experimenting with a good chunk of this work (the database change and the biff.graph &#x2F; biff.fx stuff) starting 2 years ago. The Datastar and independent libraries stuff goes back 6 months or so. Datastar&#x27;s been on my radar for a while and has been picking up steam in the Clojure community, for good reason IMO. The independent library stuff was instigated by me trying out LLM-driven coding for the first time earlier this year: I wanted to try making a Clojure web app without using Biff to see if web frameworks still seemed helpful (my conclusion: absolutely) and how I might do things from first principles were I to start over. So I did that and then started packaging up&#x2F;rewriting various Biff code as smaller individual libraries as I went.<p>Note that I consider Biff to be mostly &quot;hand-coded&quot;; I start with LLM-written drafts of code but often by the time I&#x27;m done editing it&#x27;s been completely reworked. The initial drafts of docs are all hand-written. I&#x27;m interested to try using it for vibe-coding apps though. e.g. how much of the code that requires good judgment can I pull into the framework so that the apps are then easier for LLMs to not screw up.<p>[1] <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=23921220">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=23921220</a><p>[2] <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48820361">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48820361</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49647635) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
