---
id: "901"
slug: hr-problem-subjective-hiring-and-slow-adaptation-of-new
title: "HR problem: subjective hiring and slow adaptation of new employees"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/otnixd2971-hr-problem-subjective-hiring-and-slow-ad"
  captured: "2025-10-08"
category: career
date: "2025-10-08"
tags: [Career]
country: Russia
wtp:
  raw: "5,000–10,000 RUB ($55–110) per hired employee"
  currency: USD
  min: 55
  max: 110
  period: hire
  mrrMid: 82.5
tech: [Scenario-based assessment engine, Node.js backend, PostgreSQL, LLM-assisted resume structuring with human review, ATS integrations via webhook, Onboarding task orchestration]
---
# HR problem: subjective hiring and slow adaptation of new employees

## Problem

Olga is an experienced HR professional. She describes two joined problems. Selection is subjective and consumes enormous resources: resumes are not analysed in depth, and it is especially difficult for novice recruiters to assess candidates' skills objectively. Then onboarding of new hires follows inefficient schemes, which prolongs the time before they reach full productivity. This is daily and systemic — it accompanies every new job opening, for every recruiter and HR department. What they currently do: standard ATS for initial screening, filtering by gender, age and experience; reliance on recruiters' own experience; and numerous manual interviews. She states plainly that standard assessment methods do not provide full objectivity, and that onboarding boils down to boring text and video courses without practical skill development. Her willingness to pay is anchored on the cost of a mis-hire: a bad hire means direct costs for job posting, from 5,000 rubles ($55) to 30,000 rubles ($330), plus losses from prolonged adaptation lasting from 1 to 6 months. A solution that meaningfully increases confidence in a candidate and speeds up their integration could cost 5,000–10,000 rubles ($55–110) per hired employee.

## Objective

Replace subjective judgement and boring courses with practice: assess candidates on evidence a novice recruiter can read as well as a senior one, and run onboarding as practical skill development so the 1–6 month adaptation period shortens — priced per hired employee, against the cost of the mis-hire it prevents.

## Target Users

- Primary: HR departments and recruiters running continuous hiring, where every opening carries the same subjectivity problem — Olga's own case, described as daily and systemic.
- Secondary: novice recruiters specifically, whom she names as those least able to assess candidate skills objectively and who therefore benefit most from a structured assessment.
- Tertiary: the new hire, whose adaptation currently takes 1 to 6 months on text and video courses with no practical component.

## MVP Scope

- Structured resume analysis that goes deeper than the ATS filter she describes, and produces reviewable evidence rather than a score alone.
- Scenario-based skill assessment: candidates do a representative task, so the evaluation rests on observed work rather than a recruiter's impression.
- Comparable candidate view, so a novice recruiter reaches the same conclusion a senior one would on the same evidence.
- Practical onboarding: task-based skill development for the new hire, replacing the text and video courses she says do not build skills.
- Time-to-productivity tracking per hire, since the 1–6 month adaptation window is half of the cost she is trying to avoid.
- Per-hire billing, matching the 5,000–10,000 RUB she names.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Price is 5,000–10,000 RUB ($55–110) per hired employee, justified by the mis-hire costs she quotes: 5,000–30,000 RUB in job posting alone plus 1–6 months of slow adaptation. Only successful hires generate revenue.
- The current screening she describes filters by gender and age. Those criteria are discriminatory and cannot be carried into the product, whatever the incumbent practice is.
- Full objectivity is not achievable. She says standard assessment methods do not give 100% objectivity; the honest goal is comparable, evidence-backed assessment, not an objective score.
- Onboarding must be practical. Text and video courses are explicitly named as the failing approach, so any content-library solution reproduces the problem.
- It has to work alongside a standard ATS, since that is where initial screening already happens.
- TODO: the source does not state company size, hiring volume, industry, or which ATS is in use, so integration scope and per-customer volume are unknown.
