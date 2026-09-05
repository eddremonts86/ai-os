# PRODUCT.md — Vantage – One prioritized health action per day from Apple Health

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello, there. This is Petre, Adrian and Diana and we are building Vantage while maintaining day jobs and poor relationships with sleep. We shipped Vantage to the App Store on August 12th and we currently have 24 installs and 9 subscribers - all warm leads - one of them is our accountant.<p>Vantage is an iOS longevity coach built on Apple Health. I have used numerous apps to track nutrition, sleep and workout guidance, my main complaint has always been that there isn’t one that encompasses all these streams, at a level of detail that is sufficient for me<p>So what does Vantage do? It reads your health data and returns one prioritized action per day for each stream: sleep, training and nutrition.<p>Workouts: Training plans are generated from your fitness levels (strength and cardio), either self reported (strength) or read from Apple Health (cardio - based on VO2Max). We have instructional videos filmed professionally with fitness instructors and filming crew<p>Nutrition: Calories and protein are computed, protein from bodyweight, carbs and fat split per user choice, based on preferred diet style.
Sleep: up to six ranked tactics running on 31 active rules, refreshed daily based on last night’s sleep data. HRV, resting heart rate and respiratory rate calculated on overnight data<p>So what does Vantage do differently?
No streaks, badges and points.<p>No social anything. No feeds, no leaderboards, no comparison.<p>No free coaching tier. Free shows you your HealthKit data exactly as we read it, so you can check what we see before paying anything. The coaching itself costs money, because the coaching is the product, and we did not want to fund it with ads or engagement tricks.<p>What are we proud of? The nutrition model - It is not built on BMI and acts on its decomposition instead: fat mass index sets the size of any deficit, fat-free mass index gates whether a deficit is allowed at all. I “wrote” an article explaining this here (“wrote” because not being a native English speaker, I just drafted the main points and wrote it using an AI agent)  <a href="https:&#x2F;&#x2F;notes.vantagehealthapp.com&#x2F;p&#x2F;bmi-is-a-sum-not-an-instruction" rel="nofollow">https:&#x2F;&#x2F;notes.vantagehealthapp.com&#x2F;p&#x2F;bmi-is-a-sum-not-an-ins...</a><p>How about what Vantage didn’t solve yet:
The lean-mass guard that we put in place cannot detect sarcopenic obesity. The way it works is by not prescribing a calorie deficit when fat-free mass falls below an absolute floor, but the design has a limit - this does not transfer well to heavier bodies, simply because they carry more lean mass just for daily movement.<p>Without a declared waist measurement, body fat falls back to BMI - the equation uses BMI, age and sex - so the composition split that we are so proud of falls back to a partial assumption, rather than observation
On how we use the user’s data: deleting your account is a hard delete from all database schemas, including the consent record itself (yes, we may be shooting ourselves in the foot here, but for us, hard delete should be hard delete)<p>There are two things we would like your view on.
First, the body classifier ignores any user-supplied body fat figure (which may even be a DEXA scan) and calculates its own estimate. It was implemented this way partly from principle, partly due to other priorities - we figured that very few users will have DEXA scan numbers, and using that number in the classifier would raise issues we chose not to spend time on in v1.  We may revisit it. Is that the right call?<p>Second, the sarcopenic-obesity gap. The size-adjusted floor exists (FNIH, ALM&#x2F;BMI), but it needs appendicular lean mass, and as far as I looked, that cannot be computed from waist, height, weight, age and sex. The honest answer here might be a consumer bioimpedance scale, but we cannot ask users to spend money on such devices, if they don’t already have one. If anyone has seen reliable lean-mass estimation methods, we would like the reference.<p>If you would like to try the app, you can find it here: <a href="https:&#x2F;&#x2F;apps.apple.com&#x2F;app&#x2F;id6789713982">https:&#x2F;&#x2F;apps.apple.com&#x2F;app&#x2F;id6789713982</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49548903) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
