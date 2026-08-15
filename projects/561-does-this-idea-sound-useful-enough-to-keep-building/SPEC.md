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

## Problem

I’m building a tool that looks across lots of separate information and tries to find useful connections that aren’t obvious from reading each piece on its own. For example, one source might mention a problem, another a change, and another an outcome. The tool tries to connect those into something worth noticing rather than just summarizing everything. I’m currently testing whether it can actually find better insights than asking a normal AI to do the same thing. Does this sound genuinely useful? If you had something like this, what would you use it for? I’m keeping the actual method private for now, but I’d like to know if the idea itself sounds worth continuing. submitted by /u/Pitiful-Hearing-5352 [link] [comments]

---

## Objective

Determine whether a tool that surfaces non-obvious connections across separate information sources (a problem mentioned in source A, a change in source B, an outcome in source C) is a category users will pay for, given that general-purpose LLMs already summarise.

## Target Users

Researchers, analysts, and operators whose work depends on finding connections a single-source read cannot surface. The author does not name a vertical, but the examples (problem + change + outcome stitched together) point toward competitive-intelligence, due-diligence, or trend-mapping use cases.

## MVP Scope

A working prototype that, given three user-supplied documents, produces a connection summary the author can show to ten potential users and ask 'would you pay for this?'. The author explicitly keeps the underlying method private, so the MVP scope is the demo + the validation interviews, not the algorithm.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Author keeps the method private — this rules out open-sourcing or white-papering the approach pre-validation. Validation is gated by user reactions, not benchmarks. The author's own comparison 'vs asking a normal AI to do the same thing' is the only competitive benchmark provided.
