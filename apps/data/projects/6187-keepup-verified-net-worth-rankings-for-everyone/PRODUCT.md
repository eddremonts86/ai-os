# PRODUCT.md — KeepUp – Verified net worth rankings for everyone

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Solo founder here. I built this because of a question I couldn&#x27;t answer anywhere: Forbes tells me exactly what the ~3000 richest people are worth, but there&#x27;s no ranking for the rest of us. Not way to compare myself with normal people. Everyone privately wonders if they&#x27;re ahead or behind; the only available answers are self-reported Reddit threads, national statistics and lifestyle comparisons (which reflect income more than wealth).<p>What it does: you connect your accounts via Plaid (or add assets manually), your net worth is computed from verified balances, and you land on a global leaderboard under a pseudonym with your rank and percentile. Ranks are visible as well as net worth amounts, and the leaderboard is only visible to other KeepUp users — nobody outside can see you. Users where &gt;80% of their assets come from connected sources are considered “verified” and get a public blue checkmark. There’s also what I consider a very well-functioning personal dashboard to track all your wealth, but the leaderboard feature is the novel idea here.<p>Security and privacy is my #1 priority. The architecture is built to ensure no personally identifiable information (PII) is ever stored on our servers (date of birth, email, full name, address, etc.). Only your username is stored, which during sign-up is asked to not be identifying. We also make sure no one on the leaderboard can be identified using K-Anonymity on all quasi-attributes (country, asset classes, age bracket). This is important since the combination of a small number of quasi-attributes can quickly identify someone (famous example: combination of ZIP code, birth year and gender can uniquely identify 87% of US population).<p>The obvious question is &quot;why would I connect my bank to a solo founder&#x27;s app&quot;: access is read-only through Plaid&#x27;s OAuth flow, your bank credentials never touch the servers, I can see balances but can&#x27;t move anything, and you can delete everything anytime.<p>Business model, stated plainly: while the leaderboard is free forever, there’s a Pro tier for power users. But, more interestingly, I am working on a financial services marketplace where institutions compete for users who opt in. You stay anonymous, but your wealth is verified, so institutions can bid for your business without knowing who you are. I don&#x27;t sell data: the thesis is that verified wealth data is valuable enough that <i>you</i> should be the one monetizing it.<p>The thing I&#x27;d genuinely like this crowd&#x27;s help with: how would you game the leaderboard? Manual entries are allowed and shown on the leaderboard, but only connected accounts qualify your account to be “verified”. But even so, margin loans, business accounts, etc. can be used to “cheat” your way up the leaderboard (liabilities can also be connected but is not enforced obviously).

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49642756) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
