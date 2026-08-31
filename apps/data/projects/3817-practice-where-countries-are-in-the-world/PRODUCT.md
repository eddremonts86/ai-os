---
id: "3817"
slug: practice-where-countries-are-in-the-world
title: Practice where countries are in the world
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495618"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Vue 3 and TypeScript, GeoJSON country data, Python data crunching, FSRS spaced repetition, static hosting, open source no-signup game]
---
# Practice where countries are in the world

## Value Proposition

Geography practice that remembers what you keep forgetting. The game is a simple loop — tap the named country, or name the highlighted one, under varying conditions like zoom levels — but the scheduling is the product: an FSRS-based learning algorithm decides which country shows up when, so practice time goes to the countries you actually need instead of a uniform shuffle. The poster reworked nearly every system after HN feedback on the previous version, fixing the too-hard, too-easy, boring-islands, recurring-countries and confusing-UX complaints directly. It stays what hobby geography tools should be: free, ad-free, signup-free and open source.

**One-liner:** A free, open-source world-map game that drills country locations with FSRS-driven spaced repetition.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Geography learners | Efficient drilling — the scheduler targets weak countries. |
| Teachers and parents | No signup, no ads, works anywhere; safe for classrooms. |
| HN testers of the prior version | Their named complaints are the roadmap of fixes. |
| Open-source contributors | The poster invites feedback and ideas; the code is open. |

The post states no commercial market; this is a hobby project shared for feedback.

## Jobs To Be Done

1. **Functional job** — Practice country locations by tapping or naming them on the map.
2. **Functional job** — Vary difficulty with conditions like zoom levels.
3. **Functional job** — Schedule reviews with FSRS so weak countries recur and known ones fade out.
4. **Emotional job** — Feel competent at world geography without app fatigue, ads or accounts.

## Success Metrics

- **Session length:** rounds played per session — the game loop's engagement signal.
- **Scheduler efficiency:** average recall improvement per country versus the pre-FSRS version.
- **Feedback resolution:** each previously reported defect (difficulty extremes, island noise, repeats, UX) verifiably addressed.
- **Community response:** feedback and ideas from HN, the poster's stated ask.

## Pricing & Monetization

None stated. The post explicitly says free, no ads, no signup, open source — monetization is not part of the project.

## Competitive Landscape

The post does not name competitors. The category is geography quiz and map-practice games (Seterra-style drills and similar web games); this project's position is the open-source, feedback-driven niche within it, differentiated by the FSRS scheduling layer rather than a larger content catalog or a subscription.

## Risks & Open Questions

- [ ] Progress is client-side on a static host; clearing browser storage wipes the learner's schedule.
- [ ] Country data quality (disputed names, island noise) was a past complaint and remains a curation cost.
- [ ] A hobby project invites feedback but names no maintenance cadence; fixes may follow the poster's spare time.
- [ ] Tap-vs-name difficulty tuning is iterative; the "too hard/too easy" complaints can return with new audiences.
- [ ] No localization is stated; non-English learners get English country names only.
