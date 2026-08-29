---
id: "786"
slug: a-beginner-in-online-business-needs-not-a-course-but-a-
title: "A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/h0x8gh7a71-a-beginner-in-online-business-needs-not"
category: ai
date: "2026-01-18"
tags: [AI, Business, Startups, Other]
country: USA
tech: [Remix, TypeScript, SQLite (better-sqlite3), Anthropic Claude API, Trigger.dev background jobs, PostHog analytics, Fly.io]
---
# A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

The title is unusually direct about what is wrong with the existing options: another course is not what a beginner needs. Beginners do not need more content; they need a plan that is theirs and someone — or something — to walk them through it. The product is that plan and that walk-through, generated from the beginner's situation and adjusted as reality diverges from the plan.

The plan is built in conversation, not chosen from a menu. The AI asks about idea, time, budget and constraints; produces a small number of steps; waits for the beginner to try one; asks what happened; produces the next step from the answer. The artefact the beginner sees at the end of each session is a plan that has changed to match their life, not a course they failed to finish. A weekly review and a daily check-in keep the plan in motion when the beginner's natural tendency is to drift.

The MVP is intentionally narrow: one beginner, one plan, one small deployment. That is the shape the title implies — a guide, not a platform — and it is the shape that keeps the personalisation honest.

**One-liner:** A conversational AI guide that builds a personalised step-by-step plan from a beginner's situation and walks them through it one step at a time, adjusting the next step from what they actually report.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Beginners who explicitly reject courses | The capture names them directly; they get a plan that is generated for them and led, not a curriculum to consume. |
| Beginners who have dropped off courses | The pacing matches their actual time and reflects what they have tried, instead of a fixed sequence. |
| Beginners with a specific idea | The plan is generated against the idea, not against a generic business-startup framework. |
| Time-constrained beginners | Each step is a single concrete action for a real schedule; the pace adapts to the time they actually have. |
| Beginners who need external accountability | The daily check-in and weekly review surface drift and prompt the next step rather than waiting for the beginner to remember. |

## Jobs To Be Done

1. **Functional job** — Get a plan that is actually built for the beginner's situation, not mapped onto a generic curriculum.
2. **Functional job** — Walk through the plan step by step with a guide that adapts the next step to what just happened.
3. **Functional job** — Return days later and pick up where the beginner left off without re-explaining the situation.
4. **Emotional job** — Stop feeling like every business-startup resource is aimed at someone with more time, money or skill.
5. **Social job** — Be able to tell a friend "I have a plan for the next three weeks" instead of "I'm watching a course".

## Success Metrics

- **Step completion rate** — share of generated steps the beginner reports as completed. A personalised plan that does not get walked is the failure mode the title is rejecting.
- **Time-to-first-step** — minutes from finishing onboarding to the beginner attempting step one. The longer this is, the more the beginner has slipped back into course-mode consumption.
- **Plan revision count** — median number of times the AI rewrites a step based on the beginner's report. A high revision rate means the plan is genuinely adapting; a low one means it is a fixed sequence in disguise.
- **Return rate** — share of beginners who return inside 7 days of their last session, which signals whether the plan is something they are living with or something they closed the tab on.
- **Drop-off step** — the median step number at which a beginner stops responding, used to find where plans consistently go wrong.
- **Check-in response rate** — share of daily check-ins the beginner answers, since the check-in is the mechanism that catches drift.

## Pricing & Monetization

The post names no price, no tier and no business model; it is a one-line ProblemHunt problem statement from the USA. The architecture forces a particular cost shape nonetheless: per-conversation tokens on the Claude API scale with beginner engagement rather than with seat count, Trigger.dev background jobs add a small fixed cost per weekly review, and the hosting footprint is one Fly.io deployment. Any paid tier would therefore have to be bounded by the depth of engagement (a coaching window, a number of plan revisions, or a duration of active guidance) rather than by a per-seat fee, since the beginner is the user and there is no team to license to.

The post names no incumbent or comparison point, so the listing above is the set of tools a beginner might already be using and is not a market survey.

## Competitive Landscape

- Online courses and cohort-based programmes — the option the title explicitly rejects: a fixed curriculum the beginner is asked to map themselves onto.
- Generic AI chat tools — can produce a plan on demand but do not walk the beginner through it, do not remember what was tried, and do not adjust the next step from the previous report.
- One-to-one business coaches — adapt to the beginner but cost more than a beginner in online business is typically willing to spend up front and depend on the coach's availability.

The post names no competitor, so the landscape above is the existing options a beginner typically compares against and is not a market map.

## Risks & Open Questions

- [ ] Decide how much the AI may borrow from common plan structures without making the result feel like a course, since beginners will notice if every plan is the same shape.
- [ ] Confirm the daily check-in does not become nag-ware that the beginner turns off; the AI has to know when to stop prompting.
- [ ] Establish a rule for when the AI should say "this plan is not working" and propose a different one, since personalisation includes the option of recommending a reset.
- [ ] Verify the onboarding does not demand too much from a beginner in one sitting, since a long onboarding is the same drop-off risk as a long course.
- [ ] Audit the AI for hallucinated market figures and customer counts in generated plans; the system must leave those blank rather than invent them.
- [ ] Test plan continuation after a two-week absence to confirm the AI does not re-onboard a returning beginner who already has context.
