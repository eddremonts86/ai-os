---
id: "782"
slug: the-lack-of-a-service-that-creates-hyper-personalized-g
title: "The lack of a service that creates hyper-personalized, gamified English courses (in the Duolingo format) for narrow professional niches (e.g., for a barista in a vegan coffee shop or a startup founder"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/jdez9r0101-the-lack-of-a-service-that-creates-hyper"
category: education
date: "2026-01-20"
tags: [Education, AI, Career, Other]
country: USA
tech: [Next.js, TypeScript, Convex, PostgreSQL, OpenAI API, Anthropic API, Vercel, Tailwind CSS, Stripe]
---
# The lack of a service that creates hyper-personalized, gamified English courses (in the Duolingo format) for narrow professional niches (e.g., for a barista in a vegan coffee shop or a startup founder

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An English course that adapts to the specific job the learner has, not the generic curriculum the learner does not have. The learner types what they do — the two examples in the post are a barista in a vegan coffee shop and a startup founder — and the course generates lessons whose every sentence is about that job, in the same card-stack, XP-and-streak format that the post explicitly invokes.

The product is the combination of a course generator and a Duolingo-shaped gamification shell. The generator does the work that a human curriculum designer would do for a single learner, and the gamification does the work that turns the lesson into a daily habit. The two are inseparable: a brilliant generator with no streak is a forgotten app, and a beautiful streak with generic content is the failure the post names.

The architecture supports a single small deployment because the audience is learners, not enterprises. The unit of growth is the niche catalogue and the per-niche quality score, which is what makes the product feel bespoke without a bespoke budget.

**One-liner:** NicheLingo turns the job you do into a Duolingo-shaped English course, so every sentence you practise is recognisably about your work.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Working adult in a narrow job context | Needs vocabulary and phrases specific to the job, not generic school English. |
| Recent immigrant / bilingual professional | Fluent in general but patchy in the job context; wants targeted practice. |
| Career changer moving into a new industry | Wants a fast ramp on the language of the new field. |
| Trainer / language school | Wants to assign niche courses to cohorts without commissioning bespoke content. |

## Jobs To Be Done

1. **Functional job** — Practise English sentences that the learner would actually use at work today.
2. **Functional job** — Keep a daily streak alive across devices without losing the schedule.
3. **Functional job** — Generate a course for a niche the catalogue does not already cover.
4. **Emotional job** — Stop feeling that a generic lesson is wasted time on the wrong vocabulary.
5. **Emotional job** — Stop worrying that the learner will be embarrassed by a phrase the model invented.
6. **Social job** — Share a niche course with a colleague in the same job so both of them benefit from the same material.

## Success Metrics

- **Niche-relevance rating** — average learner rating per lesson when asked how niche-relevant the content felt, because the niche promise is the entire value.
- **Day-7 retention** — share of new learners who return on day 7, because the gamification only matters if the daily habit forms.
- **Lesson completion rate** — share of started lessons that finish, because a long lesson the learner abandons is worse than no lesson.
- **Streak length distribution** — distribution of streak lengths among active learners, because the streak is the daily hook.
- **Hallucination rate** — share of generated lessons flagged for a phrase the learner reports as wrong or embarrassing, because a confident wrong sentence is the worst failure.
- **Per-niche catalogue coverage** — number of distinct niches for which a learner has completed at least one full course.

## Pricing & Monetization

The post names no price, no tier and no business model. What the architecture forces is a usage-based cost shape: every lesson the learner sees incurs a model call plus the spaced-repetition storage, while the gamification and the catalogue are roughly fixed per active learner. Any future monetisation has to charge for depth (a longer course, more niches per learner, a coach review of the learner's spoken answers) rather than for the basic daily lesson, because charging the learner for the streak they came for is the model the post is implicitly rejecting.

## Competitive Landscape

- **Duolingo** — named in the post as the format to emulate; the gap the post identifies is that the content is not niche-specific.
- **General-purpose English apps** — large libraries, but the same generic content problem the post names.
- **Human tutoring marketplaces** — solve the niche problem at a price and a scheduling cost the post rules out for daily use.

The post names one competitor. No comparison is claimed beyond the three shapes above.

## Risks & Open Questions

- [ ] Validate that the model output is recognisably niche-relevant on the two examples in the post before extending the catalogue.
- [ ] Confirm the spaced-repetition schedule keeps new vocabulary in the learner's active rotation without overwhelming a 10-minute daily window.
- [ ] Establish how the system handles a niche so narrow that no model can produce useful sentences; a graceful honest path matters more than a forced lesson.
- [ ] Decide whether the hearts / lives mechanic is part of the gamification or skipped, because a pay-to-avoid mechanic would violate the constraint.
- [ ] Measure the hallucination rate on real niches and decide the right review layer (a small editor, a per-niche allow-list, a learner-reported flag).
- [ ] Decide whether the niche input is shareable across learners in the same job, because the catalogue value grows with each new learner who tries a niche.
