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

## Tech Stack

- Flask backend for the toy visualization (the poster calls out "around 100 lines of flask plus js frontend," LLM-assisted, grounded in the paper's numerical example).
- Plain JavaScript frontend for the curve / interaction; no framework stated in the post.
- The paper itself is hosted on a separate domain (`throttle.staffinganalytics.io`) and is the primary artifact; the visualization sits next to it.
- No AI runtime, no DB, no auth — the deliverable is read-only. The post does not name a deployment target for the toy.

## Architecture

Paper (markdown/HTML, hosted on `throttle.staffinganalytics.io`) plus a small Flask service that serves a JS-driven visualization. The Flask service is stateless: it exposes a parameter set (the numerical example's inputs) and the JS renders the curve / queueing dynamics from them. The poster's note that the frontend was "LLM assisted with ground truth based on the original numerical example of the paper" is the only architectural constraint that matters — the JS is a presentation of the paper's numbers, not a free-form simulation.

## Milestones

- Write up the queueing-theory argument and proofs as the paper artifact on `throttle.staffinganalytics.io`.
- Pick a concrete numerical example from the paper and parameterize the Flask service around it.
- Generate the JS frontend (LLM-assisted) against the paper's figure for that example; verify the rendered curve matches the figure by hand-checking one parameter.
- Publish on HN with the domain link and the source post's framing; respond to feedback in-thread.

## Risks

- Toy-vs-production confusion. A reader could mistake the toy for a deployable throttling controller. The poster calls out the limitation themselves; the project page has to do the same, prominently, so the framing does not mislead.
- Frontend drift. LLM-generated JS can drift from the paper's figure on any edit. A regression check against the documented numerical example is the cheapest way to catch this before publishing.
- Calibration gap. The model needs provider-grade telemetry to be meaningful on real load; without it, the toy only illustrates the shape, not the magnitude. Saying more than that would mislead.
- Audience mismatch. The post is aimed at both platform engineers (who can act on the result) and operators (who can only watch). If operators walk away thinking they can deploy the proposed policy themselves, the framing has failed.
