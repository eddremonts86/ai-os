# PRODUCT.md — You can't read every ToS, but the clanker can

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Termsinator is a public registry of LLM-performed analyses of public legal documents like ToSs, Privacy policies, Cookie policies, etc. The goal of this project is to help people better understand how their data will be used, and what potential pitfalls they need to avoid.<p>Why?
You know that feeling of enlightenment and sense of control after you&#x27;ve red dozens of pages of legal mumbo-jumbo before subscribing to a service? Yeah, neither do I (well, maybe some of you do and mad respect for that). I&#x27;ve been encountering more and more reports on how corporations abuse ToSs, Privacy policies and the like to push data collection and retention to really orwellian depths - and thus openly declaring that they deem their (paying!) userbase sheepishly stupid. I don&#x27;t know the solution to this problem, but Termsinator is a stab in this direction.<p>What?
The idea is very simple:<p>- let the clanker read and analyse the legal stuff
- collect the results in a common place so everyone can access it
- help people make better informed choices
- rinse repeat<p>On a high level this is being implemented in the following way:<p>- scrape public facing legal docs
- forward it to an LLM, which will analyse it, and evaluate the content based on several metrics (see the docs)
- store the results along with some metadata
- present these on the website
- and also provide people a browser extension that can pull these results automatically (if they exist of course)<p>I&#x27;d like to honestly declare (not that it&#x27;s not obvious) that this is a PoC and it&#x27;s an LLM generated codebase (Python + Go + Astro written mainly by Sol in&#x2F;with? the Pi agent). At the moment I manually trigger the analyses and since I&#x27;m poor I&#x27;m using a dirt cheap and thus not super bright Qwen model to do the reading. My goal with this Show HN is to gauge if such a project even makes sense. If you find it promising I encourage you to try it, contribute to it or just spread the word. :)<p>PS.: The logo was carefully crafted by my totally human hands and not part of a new &quot;draw me an angry robot-like SVG face&quot; benchmark.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49656324) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
