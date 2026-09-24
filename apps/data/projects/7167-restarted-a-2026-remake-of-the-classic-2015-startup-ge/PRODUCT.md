# PRODUCT.md — Restarted – a 2026 remake of the classic 2015 startup generator

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ The original startup website generator by Tiff Zhang and Mike Bradley landed on Hacker News in April 2015 and has been one of my favorite little novelties of that era ever since. It perfectly captures the saturated colors, cliché hero shots, gimmicky names, buzzword-heavy slogans, and proudly hirsute team photos of the time.<p>A lot has changed since then, so I thought it would be fun to make a contemporary remake: <a href="https:&#x2F;&#x2F;restarted.io&#x2F;" rel="nofollow">https:&#x2F;&#x2F;restarted.io&#x2F;</a><p>By default you get the minimalist aesthetic and clean-cut faces of 2026. The classic 2015 look is still available — just click the link at the bottom of the page or change the “z” parameter in the URL to the more familiar “s”. The universe of partner sites and competing startups is just as expansive as it ever was.<p>The original site is entirely client-side and requires downloading all of the data tables locally. It leans on a mix of jQuery 1.11.2, Bootstrap 3.3.2, and Font Awesome 4.3.0, and if you view the source, it instantly gives away all of its secrets. For restarted.io I replaced all of that with a server-side renderer written in Go, so this time view-source tells you nothing. There are many Easter eggs in there — see how many you can find before I write them up.<p>My original goal was to stay faithful to the 2015 appearance, and that turned out to be a technical adventure. The original&#x27;s sine-based random number generator is... the worst, and different implementations of sine give different results. The eventual solution was to extract the exact sine function from Chrome’s V8 engine, as vendored C behind cgo and as a line-by-line Go port that keeps cgo optional, so the seeds and results line up the way they used to. Both are checked against V8’s own test cases.<p>Then I discovered a bug in the original code that made half of its vocabulary unreachable — the first half of the verb table and the second half of the noun table, exactly complementary, so nothing about the output ever looked truncated. My goal then shifted from remaking the generator as it was in 2015 to remaking the site as the authors intended it to be in 2015.<p>Over the years several people asked for their photos to be removed, so the remake instead draws from a broad pool of era-appropriate AI-generated profiles. A perceptual hash helps keep everyone looking distinct, and there’s a bit of extra care to make sure the Wang Fangs of the world don’t appear as Irish lasses.<p>The hero image pool is much larger now, and all the old Rio de Janeiro shots have been retired, though you’ll still recognize plenty of the 2015 photos.<p>Have fun poking around!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49710968) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
