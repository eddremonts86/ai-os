---
id: "886"
slug: searching-for-an-adaptive-system-for-training-and-nutri
title: Searching for an adaptive system for training and nutrition that helps overcome plateaus and is resilient to schedule disruptions
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/5x163so5m1-searching-for-an-adaptive-system-for-tra"
  captured: "2025-10-24"
category: fitness
date: "2025-10-24"
tags: [Fitness, Food]
country: Russia
wtp:
  raw: "currently spends ~6,000 RUB ($75) per month on gym, sports nutrition and vitamins; ready to pay more than that for a solution"
  currency: USD
  min: 75
  max: 75
  period: month
  mrrMid: 75
tech: [Kotlin Multiplatform, Ktor, Postgres, deterministic periodisation rules engine, HealthKit and Google Fit ingestion, RevenueCat]
---
# Searching for an adaptive system for training and nutrition that helps overcome plateaus and is resilient to schedule disruptions

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A training and nutrition plan that treats the business trip, the cold and the work deadline as inputs rather than failures. When the week breaks, the next weeks recalculate; when the weights stop moving, the programme changes and says why. Built for the lifter who knows the theory and cannot live inside it.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Plateaued self-coached lifter (Vadim) | Over a year of serious training, visible progress for the first months, now nothing — and every failed session confirms the problem is systemic. |
| Lifter with an irregular schedule | Travels or works to deadlines, so a fixed weekly template collapses routinely and the fragile routine is hard to restart. |
| Returning trainee after illness or a break | Faces the same mismatch acutely: the old plan no longer fits, and no app tells them where to resume. |
| Anyone who knows the golden triangle | Perfect plan, caloric surplus, eight hours of sleep — knows all three and cannot hold them together in real life. |

## Jobs To Be Done

1. **Functional job** — Keep making progress when the week does not go to plan, and change the programme when the weights stop moving.
2. **Emotional job** — Stop spending time and effort for no tangible return. He names the state directly: demotivating.
3. **Social job** — None stated. He is not asking for a community, a coach's approval or a shareable streak, and building one would answer a different problem.

## Success Metrics

- **Recovery after disruption:** sessions completed in the two weeks following a logged interruption, against the same user's baseline. This is the product's core claim and the thing no existing app does for him.
- **Plateau exit rate:** share of detected plateaus where the user adds load, sets or repetitions within four weeks of the programme change. His own definition of progress, so his own definition of success.
- **Logging survival on bad weeks:** share of disrupted weeks still logged. If logging stops exactly when life breaks, the adaptation engine is blind at the only moment it matters.
- **Explanation acceptance:** share of plan changes the user reports understanding. An unexplained adjustment to someone already demotivated is indistinguishable from randomness.
- **Retention past three months:** the plateau he describes is a background state measured in months, so anything shorter proves nothing.
- **Monthly value against his stated spend:** he already pays about $75 a month for gym, nutrition and vitamins. Perceived worth relative to that is the honest pricing signal.

## Pricing & Monetization

He gives a reference rather than a price: about 6,000 RUB ($75) per month currently spent on gym membership, basic sports nutrition and vitamins, and a statement that a solution getting him out of this dead end is worth more than his current expenses, with various options open for consideration. That anchors what he values the outcome at; it does not name what he would pay for software, and inventing a subscription figure would put words in his mouth. The pricing decision needs its own validation.

## Competitive Landscape

The source does not name products, so this landscape is drawn only from the failure he describes:

- **Fixed-template training apps** — deliver the perfect plan he already knows how to follow, and have no answer for the week it collapses. Their model of a missed session is a red mark.
- **Calorie and macro trackers** — measure the caloric surplus without adapting the plan around a missed meal, which turns a disrupted day into a logged failure.
- **Written programmes and spreadsheets** — what a serious lifter of a year typically runs. Precise, and completely static against illness and travel.
- **A human coach** — the thing that actually adapts to a business trip and a plateau, at a price and a communication cadence he never mentions considering.
- **Doing nothing different** — his current state: still going to the gym regularly, still getting no return, still knowing the theory.

## Risks & Open Questions

- [ ] Establish whether plateau cause can be distinguished from logged data. Insufficient stimulus, insufficient surplus, insufficient recovery and measurement noise all look alike, and prescribing the wrong fix confidently is worse than saying the cause is unclear.
- [ ] Design logging that survives a bad week. Every input the engine needs is hardest to collect exactly when it is most needed.
- [ ] Decide how illness is handled. It is one of his named disruptions and also the one where guidance shades toward medical advice.
- [ ] Validate what he would actually pay for software, given he anchored on $75 a month of gym, nutrition and vitamin spend rather than on an app price.
- [ ] Determine how much nutrition precision the adaptation needs, without introducing the meal-tracking burden that would recreate the collapsing routine.
- [ ] Confirm that a rules-based periodisation engine can produce changes a knowledgeable lifter finds credible. He knows the theory, so a naive deload suggestion will be recognised as one.
- [ ] Nothing in the source establishes how many lifters share this framing. The problem is described with unusual clarity by one person in Russia.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/fitness/5x163so5m1-searching-for-an-adaptive-system-for-tra) · **Category:** fitness · **Tags:** Fitness,Food
