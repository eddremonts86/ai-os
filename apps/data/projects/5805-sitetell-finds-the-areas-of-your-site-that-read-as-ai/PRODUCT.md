# PRODUCT.md — SiteTell: finds the areas of your site that read as AI-generic

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey everyone, I built this product called SiteTell. You put in your website url, it returns a list of all of the things across the site that get flagged as likely to be AI-written&#x2F;AI-generic. It works against a curated rule set (which will obviously get updated as AI models update and evolve) and then you can fix these issues and get a PDF&#x2F;CSV&#x2F;JSON file that you can download to either take the suggested fixes yourself and apply them, or use the CSV&#x2F;JSON file to drop into your agent for it to fix autonomously within minutes. I actually ran it through my first copy of SiteTell and my rule set gave me an overall score of 6&#x2F;100. Woops.<p>Google updated its core rules in February 2026. The important thing to note is that it does not punish AI-written content. It instead punishes thin content, or generic content. The stuff that AI will typically write if you don&#x27;t go and edit it after. SiteTell can fix this by taking these generic, common issues such as stock AI openers (think &#x27;in today&#x27;s fast paced world&#x27;), AI vocabulary (see &#x27;seamlessly integrates&#x27;) or far more subtle things that once you notice, you see everywhere. For example, consecutive paragraphs within 8 or so words of the same length.<p>The other way I think SiteTell helps is through trust. Increasingly if you go to a landing page, or even a whole site, that reads generically and has the typical AI tells (em-dashes etc...) it instantly loses some amount of intangible trust with the customer which could be costing you customers if you run a site with a lot of written copy. SiteTell also aims to fix this.<p>The rule set is really the main product in my opinion. It&#x27;s about 200 rules covering vocabulary, sentence structure, hedging, and some layout patterns, built from public slop-word lists, a corpus diff against pre-2022 marketing copy, and a lot of manual tuning against real sites. False positives are the hard part, particularly with technical writing where precise language reads as formulaic. Because of the false positive situation, if a user chooses to go through with the fixes they can pick and choose what parts actually need fixing. The customer gets granular control and gets to essentially remove the false positives before the fix stage.<p>Detection is pure regex and heuristics, so scanning is free and needs no signup. Rewrites cost money because they hit an API, so those are paid.<p>Stack is Next.js, Supabase, Gemini Flash for the rewrites only.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49610677) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
