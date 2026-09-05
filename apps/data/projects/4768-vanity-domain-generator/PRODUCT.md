# PRODUCT.md — Vanity Domain Generator

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ When each of my kids got to the age that they started using email and having an online presence, I got them their own vanity domain by going to a &quot;fake word generator&quot; and then taking the best-looking fake words and doing a registrar search for it.<p>With my youngest son starting the process, I thought &quot;I&#x27;ll save time going back and forth and integrate the process.  Surely it can&#x27;t be that hard.&quot;  Making it happen was easy.  Making it something I would share was harder.<p>It&#x27;s implemented as a single-page app at <a href="https:&#x2F;&#x2F;vanitydomain.net" rel="nofollow">https:&#x2F;&#x2F;vanitydomain.net</a>, with all of the logic on the client side.  It takes the top 10k words in your language&#x27;s Wikipedia, and builds a Markov trigram model to make a plausable-ish word.  I tried more clever things, but they were all worse.<p>For each plausible word, it hits Cloudflare&#x27;s DNS (super cheap, fast, and scalable) as a low-pass filter, then checks the definitive RDAP server if it&#x27;s available.  It displays the words that passed both and gives you a link to register it (not monetized; it&#x27;s all good).<p>If you know someone who might benefit from having a vanity domain with a hosting site, infinite email addresses, and control of their own online presence, this might be a fun starting point.<p>Let me know if there are things that could make it better, or if you know of a better model for word generation.  It&#x27;s my fun-time project that might be a blessing to other people, so feel free to push it in a good direction.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49545776) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
