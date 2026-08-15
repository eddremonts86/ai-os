---
id: "561"
slug: does-this-idea-sound-useful-enough-to-keep-building
title: Cross-source synthesis tool — does the idea itself justify continuing?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vogufy/does_this_idea_sound_useful_enough_to_keep/"
  captured: "2026-08-14"
category: ai
date: "2026-08-14"
tags: [ai, research, synthesis, indie]
scores:
  money: 3
  learn: 6
  fun: 4
---
# Cross-source synthesis tool — does the idea itself justify continuing?

## Tech Stack

Python for the synthesis pipeline (whatever the author's private method is); a small web frontend for the demo. Postgres or SQLite for the source corpus. Vector store optional, depending on whether the method needs embedding similarity.

## Architecture

Three components: source ingestion (one or many formats), the private synthesis method, and a thin demo UI that shows a before/after of 'sources read separately' vs 'sources synthesised'. The method stays closed — only the inputs and outputs are observable.

## Milestones

M1: prototype the synthesis method on a fixed 10-document corpus. M2: build the demo UI. M3: run 10 validation interviews. M4: decide go/no-go based on interview signal.

## Risks

Risk: the author keeps the method private, so external review is limited — the algorithm risks overfitting to a small set. Risk: general LLMs catch up. Risk: the 10 demos confirm interest but not willingness-to-pay.
