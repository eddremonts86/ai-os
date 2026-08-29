---
id: "755"
slug: designers-are-losing-their-bearings-in-the-era-of-ai-it
title: "Designers are losing their bearings in the era of AI — it's unclear which direction to develop in, which stack to master, and how to become a «highly valuable specialist»."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/design/b17z60rdb1-designers-are-losing-their-bearings-in-t"
  captured: "2026-03-16"
category: design
date: "2026-03-16"
tags: [Design, Education, Career, AI, Other]
country: Russia
tech: [Next.js, Python FastAPI evaluation service, LLM agent orchestration framework, PostgreSQL, Object storage for design artefacts, Rubric-based scoring engine]
---
# Designers are losing their bearings in the era of AI — it's unclear which direction to develop in, which stack to master, and how to become a «highly valuable specialist».

## Tech Stack

- **Frontend:** Next.js — the simulator is a workspace where a designer submits artefacts and reads scored feedback, so server-rendered pages with a heavy authenticated area fit.
- **Evaluation service:** Python with FastAPI, separate from the web app, because scoring a submission is a slow multi-step job and must not block a request.
- **Agent orchestration:** an LLM agent framework, used twice over — as the subject being taught (designing a system of agents) and as the mechanism that grades submissions against a rubric.
- **Database:** PostgreSQL for users, trajectories, submissions and scores over time; progress is a longitudinal record, not a snapshot.
- **Artefact storage:** object storage for the design files, screens and flows users submit for calibration.
- **Scoring:** an explicit rubric engine on the three axes the author names — visuals, working with AI, simplifying complex scenarios — so a score can be explained rather than asserted.

## Architecture

Three loops around one profile. The trajectory loop takes a designer's current position and produces a direction with a concrete learning order. The simulator loop hands them a scenario, takes their submitted artefact or agent workflow, and returns a rubric-scored critique. The feedback loop compares their scores over time against the trajectory they picked and reports whether they are converging on it or drifting.

The content problem is architectural, not editorial. The author dismisses courses because they are written once and then lag behind the models. So scenarios live as versioned data with an explicit staleness date rather than as a fixed curriculum, and the simulator's teaching material about agent orchestration is regenerated against current tooling instead of being authored as a course module.

## Milestones

1. **M0 — Rubric definition.** Write the scoring rubric for visuals, working with AI, and simplifying complex scenarios, with worked examples at each level. Nothing else is meaningful before a score can be defended. End of week 3.
2. **M1 — Trajectory intake.** Capture a designer's current position and output a direction with a learning order, tested against the author's own profile. End of week 5.
3. **M2 — Simulator v1.** Scenario, submission, rubric-scored critique on one axis end to end. End of week 8.
4. **M3 — Agent-system track.** Scenarios that require the user to design and orchestrate a multi-agent workflow, not to operate a tool. End of week 11.
5. **M4 — Longitudinal feedback.** Score history versus chosen trajectory, with drift reported honestly. End of week 13.
6. **M5 — Pilot cohort.** Ten designers from professional communities; measure whether any of them commit to a direction and stay on it. End of week 17.

## Risks

- **The core promise may be unfulfillable.** The author wants feedback on whether their direction "will hit the mark" a year out. Nobody can verify that. The honest product tells them how they score against a rubric and where the market signals point; anything stronger is a prediction dressed as a service, and this audience is the one most likely to notice.
- **Staleness, the exact objection to courses.** They reject courses because new models ship before the material is finished. Simulator scenarios about agent orchestration decay just as fast, so a content-refresh cadence is a requirement rather than a maintenance nicety.
- **Scoring taste is contested.** Visuals and the ability to simplify complex scenarios are judgement calls. If a senior designer disagrees with a score and the rubric cannot justify it, credibility is gone in one session.
- **No price signal.** The author is willing to discuss monetisation but names no figure, and mentions they are currently job-hunting and open to co-founding. Building against undefined willingness to pay from a single respondent is the main commercial risk.
- **Audience of one so far.** Everything here derives from one detailed account. The paralysis described is plausible and specific, but the source contains no evidence about how many designers would pay for a way out of it.
