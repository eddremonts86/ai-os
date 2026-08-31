---
id: "3816"
slug: claypot-a-block-based-studio-for-kids-to-inspect-ai-sys
title: Claypot – a block-based studio for kids to inspect AI systems
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495751"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Block-based visual programming, kid-facing AI inspection studio, client-side web app, model playground, educational content, no-code interaction blocks]
---
# Claypot – a block-based studio for kids to inspect AI systems

## Tech Stack

Inferred from the category the title names; no source is linked in the capture.

- **Block editor engine:** a visual, drag-and-drop block workspace (Scratch-style interaction).
- **Client-side web app:** the studio at claypot.app, browser-first for classroom reach.
- **AI interaction layer:** API-mediated calls to inspectable models (prompt, settings, comparison).
- **Child-safe session model:** no accounts, no personal-data collection, bounded inputs.
- **Experiment runner:** executes assembled block programs and captures before-and-after behavior.
- **Explanation renderer:** child-readable summaries of what changed and why.

## Architecture

- **Block palette:** categories of inspection blocks (inputs, settings, run, compare).
- **Canvas:** assembly surface where blocks snap into experiments.
- **Runner:** executes the block graph against the AI interaction layer, with rate and content limits.
- **Observation view:** side-by-side before-and-after outputs and behavior diffs.
- **Guardrail layer:** content filtering, input bounds and no-PII enforcement around the runner.

## Milestones

1. **M0 — Block canvas.** A working drag-and-drop canvas with one inspectable AI behavior (prompt-and-response).
2. **M1 — Observation.** Before-and-after comparison and child-readable explanation of behavior changes.
3. **M2 — Guardrails.** Content and privacy guardrails enforced by default, validated with parents.
4. **M3 — Curriculum.** Two or three ready-made lesson flows so a teacher can run a session unassisted.

## Risks

- **Thin capture:** the whole plan is built from a title; the real product could have a different shape entirely.
- **Safety surface:** a child-facing AI tool inherits every output-safety problem of the underlying models.
- **Expressiveness ceiling:** blocks that are too simple teach nothing; too complex stops being child-friendly.
- **Cost of AI calls:** every experiment run spends model tokens; a free product needs a sustainable call budget.
