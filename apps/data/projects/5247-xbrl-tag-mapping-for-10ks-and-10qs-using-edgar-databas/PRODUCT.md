# PRODUCT.md — xbrl-tag mapping for 10ks and 10qs, using EDGAR database

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello HN! 
I built a pipeline which fetches SEC EDGAR 10k and 10qs for more than 600 companies, maps xbrl-tags onto around 35 financial concepts and computes growth- , fundamental- and valuation-multiples (prices provided by yfinance). 
This project originated bc I wanted clean, non-third-party financial data in order to judge a trading thesis of mine. I could not find any app providing such data (for free), let alone being open source. 
Turns out there are no data providers because xbrl of 10ks and 10qs SUCKS(!!!!). It is messy, unregulated and devastated. Its the wild west of finance. 
A project like this was 5 years ago not possible, at least not with less than ~1000 people. Thats because of the nature of xbrl-tags. Since they are unregulated, a certain xbrl-tag could fit perfectly for a certain company, while providing nothing, only a partial amount, or complete garbage for another company. You would have to iterate through every financial statement ever relesed by a company, searching every tag possbile, comparing, once found, a tag and constantly checking, once more companies are added to the obserable universe, if the tag also produces meaningfull data for those new companies. 
As I said, unmanagable task. Except for LLMs. 
I used Anthropics Claude Fable 5 mostly, giving strict, non-regression focused tag research tasks, constantly letting it iterate through the entire ticker universe, searching and comparing tags. And it worked. 
It took me around 3 weeks just to produce wrong data, manually searching for a ticker universe of 3 (AAPL, MSFT, NVDA). Now this pipeline produces correct, cleaned data (more on that later) for more than 600 companies.<p>That was just the main problem tho. Notable problems taht also had to be fixed: 
-companies tagging everything as fy ull year; 
-cash flow being filed cumulative; 
-q4 is never filed; 
-a quarter isnt always the same length; 
tag changing by a company; 
-STOCK SPLITS (god i hate them); 
-companies reporting wrong (a few 0s more for example);<p>Still got a lot of work to do, UI and UX are...rudimentary. 
Appreciate any feedback&#x2F;critics. 
Thanks for taking your time reading this.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49578331) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
