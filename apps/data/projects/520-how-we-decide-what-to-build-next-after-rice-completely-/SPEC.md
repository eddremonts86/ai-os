---
id: "520"
slug: how-we-decide-what-to-build-next-after-rice-completely-
title: How we decide what to build next after RICE completely fell apart for us
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3np0/how_we_decide_what_to_build_next_after_rice/"
category: saas
date: "2026-08-14"
---
# How we decide what to build next after RICE completely fell apart for us

## Problem

basically as title says, so we are a 12-person team and for about a year our roadmap was basically whatever RICE said. at first it looked fine. shared spreadsheet, every candidate project got a RICE score, we sorted by total and that was the next quarter. no fights, no HiPPO, everyone felt data driven. in practice, two things killed it: the reach numbers were made up the confidence score made everyone feel better about guessing, but we were still guessing concrete example: last year we were deciding between: - project A: new automation rules for power users - project B: another round of onboarding work, focused on templates we plugged it into RICE: - reach - A: impacts 2,000 MAUs (someone pulled this from a segment that looked vaguely right) - B: impacts 5,000 signups per month (which is just our signup volume, not the people who would actually get value) nobody could say how many people would actually use the new rules, or how many new users would make it through onboarding because of better templates. we argued for 30 minutes, then rounded to a number that made the project we already liked look better. - impact - A: 2x (power users are important was basically the argument) - B: 1.5x (improves conversion but not retention was the hand-wave) - confidence - A: 0.6 (we had a couple of support tickets and a vague idea of demand) - B: 0.7 (because we had done onboarding work before and it felt familiar) - effort - both were 3 person-weeks on paper, which was wrong, but similar enough that it did not matter. the spreadsheet spit out a higher score for onboarding templates, so we spent a quarter on it. our 14% monthly churn for that cohort did not move. the users who were never going to stick still left, just slightly more politely. the real problem was that the reach input was fiction. 5,000 signups looked precise, but the number that mattered was how many of those signups are actually in our ICP and make it to the 10 minute moment it clicks event. we did not have that broken out when we were running RICE. so we optimized for a big top-of-funnel number and ignored whether it changed anything 60-90 days later when people have mentally checked out. same story on a bunch of things. reporting overhaul, RICE said yes. the three customers who screamed the loudest loved it, everyone else did not care. integrations, RICE said no because reach looked small, then we lost five accounts over a quarter (about $20k each annually) because they could not make us fit their existing stack. eventually we admitted the spreadsheet was just formalizing whoever could argue numbers more confidently. what we do now is a lot dumber on paper and works better for us: hard guardrails first - does this help our ICP use case, yes/no - does this touch the first 7 days of usage or the 60-90 day churn window, yes/no - does it align with one of 3 company-level goals for the quarter if it fails those, it does not matter how shiny the idea is. 2) binary impact buckets instead of [r/I/C](r/I/C) - retain or expand existing customers in the next 2 quarters (top bucket) - make life materially easier for support/sales (middle) - everything else (bottom) we only commit roadmap slots to the top bucket until we have at least one bet per goal. 3) actual numbers where we have them, explicit we are guessing where we do not for each item we write: - target metric and current baseline - e.g. reduce churn in 60-90 day cohort from 14% to 10% or increase % of new workspaces that hit first task created and assigned in 10 minutes from 38% to 50% - evidence we have - churn reasons, usage data, support tickets, sales calls - evidence we do not have - spelled out in a sentence, e.g. we do not know how many customers would actually switch from Zapier to our native integration. we still write the guess down though. checkpoints, not a scoreboard top bucket stuff gets checked in 2-4 weeks against whatever metric we said it should move. if it's not moving it, we revisit. no more waiting till next quarter to re-argue the same guesses. still not perfect obviously. we argue plenty, everyone's still got a pet project they're pushing, and the "everything else" bucket basically never ships unless someone gets mad enough about it. but at least now we're arguing about the guardrails and the actual metric, not whether power users deserve a 2x or a 2.5x multiplier on a spreadsheet nobody can defend. so i think the helpful part is this that honestly RICE wasn't broken because the math was bad. it was fine math. it broke because it let us dress up a guess as something objective, and once your made-up number is sitting in a cell next to everyone else's numbers, nobody wants to be the one to say yeah i just made that up. submitted by /u/Aggressive_Act_5874 [link] [comments]

---

## Objective

Replace a RICE-based prioritization framework that stopped working for the team with a small, opinionated prioritization toolkit that scores initiatives on three dimensions the team actually has data for (customer evidence strength, build cost confidence, strategic fit), produces a single ordered backlog with the reasoning per item, and is auditable enough that leadership can challenge any decision.

## Target Users

- Primary: a product team of 5-15 that outgrew RICE because their inputs became guesses rather than measurements.
- Secondary: a single PM at a startup that needs to defend a roadmap without spreadsheet theatrics.

## MVP Scope

- Initiative intake form: title, customer evidence (link + 1-paragraph summary), build cost confidence (low/med/high + 1-line), strategic fit (1-5 with a sentence).
- Weighted scoring view: each dimension has a configurable weight; default weights from a published template.
- Ordered backlog with per-item reasoning ("scored X because customer evidence is strong, build cost is high, fit is medium").
- Public read-only board for stakeholders (no editing).
- A weekly "what changed" diff so leadership sees the backlog move.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Scoring must be defensible: every input field must accept a link/quote, not a number alone.
- Audit trail: every change to weights, scores, or items is logged.
- No AI scoring in v1 — the team's own reasoning is the point.
