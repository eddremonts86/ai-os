---
id: "750"
slug: need-an-ai-app-upload-a-photo-get-a-weekly-verdict-prog
title: "Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to increase load. Existing trackers either lack AI or are too complex. Willing to pay $100/year."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/xhutexah41-need-an-ai-app-upload-a-photo-get-a-week"
  captured: "2026-03-29"
category: fitness
date: "2026-03-29"
tags: [Fitness, AI, Other]
country: Greece
wtp:
  raw: "$100/year, or $150 for a PRO membership"
  currency: USD
  min: 100
  max: 150
  period: year
  mrrMid: 10
tech: [React Native with Expo, FastAPI, Postgres, pose-estimation preprocessing, vision model comparison pipeline, encrypted object storage]
---
# Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to increase load. Existing trackers either lack AI or are too complex. Willing to pay $100/year.

## Problem

Tolis, in Greece, trains regularly and tracks whether he is gaining muscle or cutting fat by photographing himself once a week. What he wants is narrow: an app that saves the weekly photo, analyses it with AI, compares it against previous shots, and answers "progress" or "no progress" — and when the answer is no progress, tells him when to increase the load or adjust nutrition. He tried ChatGPT for this and rejected it on two grounds he states plainly: it costs $20/month, and its photo analysis is not accurate for this purpose. He searched the app stores as well, and describes what he found: some apps just store photos with no AI analysis, others offer complex 3D scans, others require manual data entry, and none produce the simple weekly verdict or the advice on when to push harder. His words for the requirement are the design brief: "I don't want to dig through dozens of metrics — I need a clear yes/no." The problem recurs every week, as part of a routine he already keeps.

## Objective

Ship a weekly-photo progress app that returns one verdict — progress or no progress — from a photo comparison the user does not have to interpret, plus a concrete recommendation to increase load or adjust nutrition when the verdict is negative, at a price under the $20/month he already rejected.

## Target Users

- Primary: self-coached lifters who already photograph themselves weekly to track body composition, and who want an answer rather than a dataset. Tolis is the archetype: regular training, an existing weekly routine, no interest in dozens of metrics.
- Secondary: people cutting fat rather than gaining muscle, who have the same weekly-photo habit and the same question in the opposite direction, and for whom the verdict logic has to work symmetrically.
- Tertiary: coaches with a handful of remote clients, who currently eyeball the same weekly photos by hand — a later surface, not part of the MVP.

## MVP Scope

- Weekly photo capture with pose and framing guidance, since a verdict from inconsistently framed photos is a coin flip dressed as an analysis.
- Photo storage as a private timeline, one entry per week.
- Comparison against previous shots and a single verdict: progress or no progress. No score, no percentage, no metric panel on the main screen.
- When the verdict is no progress: one recommendation, either increase the load or adjust nutrition, with the reasoning stated in a sentence.
- Confidence handling: when framing, lighting or interval make a comparison unreliable, say so instead of issuing a verdict. A wrong confident answer is the failure that lost ChatGPT this user.
- Weekly reminder tied to his existing measurement routine.
- One year of history, viewable as a photo sequence with the verdict attached to each week.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Price ceiling is set by the alternative he already declined: $20/month for ChatGPT was too expensive, and he named $100/year, or $150 for a PRO membership, as what he would pay. That is roughly $8/month, which caps per-user inference cost hard.
- Accuracy is the whole product. He rejected ChatGPT specifically because its photo analysis was not accurate for this purpose, so shipping a verdict that is confidently wrong reproduces the failure he is escaping.
- The interface must not become what he rejected. Complex 3D scans, manual data entry and dozens of metrics are each named in the source as reasons existing apps failed him. Any metric added to the main screen is a step toward the products he already tried.
- Body photographs are sensitive personal data and the user is in Greece, so GDPR applies: explicit consent, encryption at rest, real deletion, and no training on user images without separate opt-in.
- Weekly cadence bounds the analysis budget. One comparison per user per week is the design point, not continuous tracking.
- The author has stated he wants 1% equity in the startup that builds this, and is ready to give feedback. That is a term to settle before he becomes a design partner, not a detail to discover later.

## Out of Scope

- 3D body scanning, which he names as one of the things that made existing apps unusable.
- Manual entry of measurements, calories or lifts as a requirement for the verdict.
- A metrics dashboard. The verdict is the product; metrics are what the competitors offer instead of it.
