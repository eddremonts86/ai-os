---
id: "2986"
slug: personal-ai-tutor-that-builds-and-probes-your-understan
title: Personal AI tutor that builds and probes your understanding
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337613"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Personal AI tutor that builds and probes your understanding

## Tech Stack

Chosen for this problem:
- **Python** — matches the author's repo (grandimam/suki) and the LLM ecosystem.
- **OpenAI / Anthropic / local-ollama via a single abstraction** so the learner can pick a backend.
- **SQLite** for local state — curricula, probe history, learner confidence deltas.
- **CLI front-end (Click or Typer)** — developer ergonomics over a web UI.
- **Rich** for terminal rendering of probe questions and curriculum overviews.

## Architecture

```
+-------------------+    topic    +-----------------------+    LLM call   +-------------------+
|  Learner CLI      | ----------->|  Curriculum generator | ------------->|  LLM backend      |
|  (Python / Click) |             |  (chapter planner)    |               |  (OpenAI / Anthropic|
+-------------------+             +-----------------------+               |   / Ollama)       |
        |                                  |                              +-------------------+
        |                                  v
        |                         +-----------------------+
        |                         |  SQLite store         |
        |                         |  - curriculum         |
        |                         |  - chapter probes     |
        |                         |  - confidence deltas  |
        |                         +-----------------------+
        v
+-------------------+
|  Probe loop       |
|  (Q&A, adapts to  |
|   learner replies)|
+-------------------+
```

Two LLM calls per chapter: one to plan the curriculum, one to probe. The probe loop uses the chapter content + previous replies to drive the next question. SQLite holds state so re-runs continue from where the learner left off.

## Milestones

- **M1 (week 1):** CLI scaffold + single-topic curriculum generation against a chosen LLM.
- **M2 (week 2):** per-chapter probe loop with persistent state in SQLite.
- **M3 (week 3):** confidence-delta tracking; learner sees whether they actually understood each chapter.
- **M4 (week 4):** pluggable backend (OpenAI / Anthropic / local Ollama).
- **M5 (week 5+):** optional web view; export curriculum to Markdown or Anki deck.

## Risks

- **Probe-quality feedback loop.** The same model that writes the curriculum also grades the learner — generous self-grading is a known failure mode. A second model or rubric-based grading should be considered.
- **Backend lock-in.** Defaulting to one LLM vendor makes the project fragile if pricing or availability changes; the abstraction needs to be clean and tested.
- **Cold-start UX.** Asking a learner to phrase a topic at the right level can stall the workflow. Good defaults and example topics matter.
- **No stated funding path.** Suki is open source, but the post doesn't name a monetization or sustainability plan.
