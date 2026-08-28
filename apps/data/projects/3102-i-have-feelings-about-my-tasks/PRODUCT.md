---
id: "3102"
slug: i-have-feelings-about-my-tasks
title: I have feelings about my tasks
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49446769"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Productivity, B2C]
tech: [TypeScript, browser-only drag-and-drop, Google OAuth, serverless persistence]
---
# I have feelings about my tasks

## Value Proposition

A task tool that treats tasks like cardboard boxes on the floor of a room — pick one up, drop it on the desk, and watch its clock tick up. The metaphor only works if it is physical.

## Target Users

| Stakeholder | Why they care |
|---|---|
| The founder | First-ever task tool they have ever built; validates the spatial-metaphor hypothesis. |
| HN readers who resonated with the post | Many commented "this is how I think about tasks too"; they want to try it. |
| Loose time-trackers | People who find Toggl / RescueTime too friction-heavy but still want to see where their attention went. |

## Jobs To Be Done

1. **Functional job** — track which tasks have eaten your attention, without filling out timesheets.
2. **Emotional job** — feel that the task list is a physical space you can move around in, not a flat queue.
3. **Social job** — N/A in v1 (no sharing, no team).

## Success Metrics

- **Activation:** 60% of first-time visitors drop a box on the desk within their first session.
- **Retention:** 30% week-2 retention of signed-in rooms (a user who comes back after two weeks is keeping the metaphor).
- **Revenue:** this is a hobby experiment; the success metric is resonance on HN and the answer to the founder's "should the desk hold exactly one box?" question, not revenue.

## Pricing & Monetization

No monetization path stated in the post. If the founder ever adds one, the most natural shape is a small subscription that unlocks multiple rooms, history beyond a month, and export — but that is speculation, not a stated plan.

## Competitive Landscape

- **Todoist / Things / OmniFocus** — flat list metaphor; the wedge is the spatial one.
- **Toggl / RescueTime** — time tracking, but with timesheet friction the cardboard-box metaphor explicitly avoids.
- **Are.na / Kinopio** — spatial / canvas-based personal organization; the wedge is the per-task clock.

## Risks & Open Questions

- [ ] Resolve the open question: should the desk hold exactly one box? Ship with "exactly one" + a settings toggle and let usage data answer.
- [ ] Confirm the cardboard-box visual survives on a phone screen (drag-and-drop on touch is the unknown).
- [ ] Validate that Google sign-in is enough; if readers ask for email + password, add it in v2.
- [ ] Decide whether to ship a "many" desk mode at all or force the founder's "exactly one" choice on everyone.
