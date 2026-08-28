---
id: "3143"
slug: i-built-a-tool-showing-how-ai-providers-should-throttle
title: I built a tool showing how AI providers (should) throttle their models
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448480"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# I built a tool showing how AI providers (should) throttle their models

## Problem

The poster started from the suspicion that AI providers throttle their models when server load rises — switching to a quantized version, shrinking the context window, or downgrading to a smaller model — and built a queueing-theory model to study whether that intuition holds. The finding is counterintuitive: throttling down under load tends to *raise* total data-center demand, because users who get a bad answer re-ask, and re-asks compound. The effect is worse for agentic workflows, which produce re-ask storms, which the poster argues may explain the "models feel degraded today" reports and the visible outages.

The poster's model — optimal scheduling for an AI fleet with heterogeneous users — argues against the current industry rule of throttling once the number of users in system crosses a threshold. The alternative the poster derives is to separate users who tolerate degradation from users who are very sensitive to it, and route accordingly. The visualization is a toy (~100 lines of Flask + JS frontend, LLM-assisted, grounded in a numerical example from the paper) and the poster is explicit that only the providers have enough telemetry to calibrate the model on real data. The full paper with proofs is hosted at `throttle.staffinganalytics.io`.

## Objective

Publish the queueing-theory argument and the toy visualization so providers and operators can read the result, reproduce the numerical example, and reason about throttling policies without needing to derive them themselves. The poster is not selling a runtime product; they are sharing a paper and a small visualization that illustrates it, and asking the HN audience for feedback.

## Target Users

The post is written for two audiences the poster names implicitly: AI provider platform teams that design throttling policy, and operators/PMs who have noticed degraded model behavior and want a mechanical explanation. The toy visualization is aimed at the latter — readers who want to see the re-ask feedback loop without reading queueing-theory proofs. A secondary reader is the queueing-theory curious: students or researchers who want a worked example of optimal scheduling for heterogeneous users.

## MVP Scope

- The paper, hosted at `throttle.staffinganalytics.io`, with the proofs and the scheduling argument.
- The toy visualization: a small Flask backend plus a JS frontend (around 100 lines), generated with LLM assistance, grounded in the original numerical example from the paper so the curve the reader sees matches the figure in the writeup.
- A reproduction path: the poster calls out that only the providers have enough telemetry to calibrate the model on real load, so the MVP does not pretend to be a deployable throttling controller. The deliverable is the argument and the toy, not a system that touches production traffic.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Toy, not production. The poster is explicit that the visualization and the numerical example are illustrative; the model needs provider-grade telemetry to be calibrated on real load.
- No claim that the result is novel to production. The poster says the insight is "the industry standard practice … is in fact what's causing the problem," but does not say any provider has shipped the proposed policy. Reading the post as a deployment roadmap would over-claim.
- Reproducible numbers. Because the visualization is LLM-generated and grounded in the paper's numerical example, any change to the curve needs to be checked against the figure in the writeup, not against intuition.
- Surface the limitation up front. The poster calls it out themselves; the project page should too, so a reader does not walk away thinking this is a drop-in throttling controller.
