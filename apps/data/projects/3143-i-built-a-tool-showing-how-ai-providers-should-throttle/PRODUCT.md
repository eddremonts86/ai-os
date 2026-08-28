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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A queueing-theory argument and a toy visualization that explain why AI providers' current "throttle when the system is busy" policy tends to *increase* total load — bad answers drive re-asks, and re-asks compound — and propose a separation-based scheduling rule as an alternative. The deliverable is the paper plus the toy; the goal is to make the argument legible to operators without forcing them to read the proofs.

## Target Users

- AI provider platform and infra teams who design throttling policy and want a mechanical argument against the threshold-on-load approach.
- Operators and PMs who have noticed models feeling degraded under load and want a model of why.
- Students and researchers of queueing theory who want a worked example of optimal scheduling for heterogeneous users.

## Jobs To Be Done

- When I am designing throttling policy for an AI fleet, I want a model that predicts what happens to total load when answers get worse, so I can pick a rule that does not create a re-ask storm.
- When I am an operator who has seen models "feel degraded" during peak hours, I want a written explanation for the feedback loop, so I can reason about it instead of guessing.
- When I am reading the HN thread, I want a toy visualization that matches the figures in the writeup, so I can see the effect without rebuilding it from the proofs.
- When I am a queueing-theory reader, I want the numerical example to be reproducible from the paper's input parameters, so the toy does not silently drift from the theory.

## Success Metrics

- Paper and toy are reachable from the HN post and the linked domain (`throttle.staffinganalytics.io`) without 404s.
- The toy visualization matches the figure in the paper for the documented numerical example (the poster says the JS frontend is grounded in the original numerical example of the paper; readers should be able to confirm this by hand-checking one parameter).
- Feedback signal on the HN thread (comments, upvotes) — a soft proxy for whether the argument lands with the platform-engineer audience the poster is trying to reach.

## Pricing & Monetization

The post does not state a price, a subscription, or a paid tier, and the deliverable is a paper plus an open visualization. The poster is sharing analysis, not selling a product. No pricing model can be stated from the source.

## Competitive Landscape

The post does not name competing tools, papers, or vendor approaches. The poster situates the argument against "the industry standard practice of throttling once the number of users in system [crosses a threshold]," but does not cite a specific competitor's product or paper. Naming one would be invention.

## Risks & Open Questions

- The toy is illustrative, not calibrated. The poster is explicit that only providers have enough telemetry to calibrate on real load; the toy should not be read as a deployable controller.
- LLM-generated frontend drift. Because the JS was LLM-assisted, the curve the reader sees could silently diverge from the figure in the paper if either side changes. A regression check against the documented numerical example is needed before any update.
- Generality of the optimal rule. The model assumes heterogeneous users separable into "tolerant" and "sensitive"; whether that partition is the right one in practice is a question only providers can answer with their telemetry.
- Reading the wrong audience. The post is written for two audiences at once (platform engineers and operators). If the toy visual leads operators to believe they can deploy the proposed policy themselves, the framing has failed; the project is a paper, not a runtime.
