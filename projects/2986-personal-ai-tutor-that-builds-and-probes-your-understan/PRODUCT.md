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

## Value Proposition

Suki is an open-source tutor that turns any topic into a beginner-to-advanced curriculum and then probes you chapter by chapter until you've actually built a mental model, not just skimmed a textbook. It replaces the "LLM on the side filling in what the book skipped" workflow with a single CLI loop that does both.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Self-taught developers | Books skip things; LLM help is unstructured; Suki combines both into one probed loop. |
| Engineers pivoting into a new stack | Want a curriculum with built-in probing, not another blog post rabbit hole. |
| Tutors and educators | Want an open framework to scaffold personalised study plans for students. |

## Jobs To Be Done

1. **Functional job** — generate a curriculum for a new topic and verify understanding of each chapter.
2. **Emotional job** — stop wondering whether you've actually learned something or just recognised it.
3. **Social job** — be able to point at a real artefact (curriculum + probe results) when claiming expertise.

## Success Metrics

- **Activation:** time from `suki learn ` to first generated chapter.
- **Retention:** learners who come back across multiple sessions on the same topic (curriculum-completion signal).
- **Output quality:** self-reported confidence delta per chapter; ideally some kind of probing score.

## Pricing & Monetization

The source post declares Suki open source with no price signal. Reasonable next decisions for the author: GitHub Sponsors, optional hosted backend that caches curriculum state, or team/educator plans with shared curricula. Pricing is left as an open question.

## Competitive Landscape

- **Books and MOOCs (O'Reilly, Coursera, etc.)** — rich content but no built-in probing of whether you've built a model.
- **LLM chat sessions (ChatGPT, Claude, etc.)** — flexible but unstructured; learners drift between questions without a curriculum.
- **Spaced-repetition apps (Anki)** — good for memorisation, but the source material still has to come from somewhere.
- **Other open-source tutor experiments** — niche repos; most focus on flashcards, not curriculum + probing.

## Risks & Open Questions

- [ ] Curriculum quality depends heavily on the LLM behind it; lock-in risk and the question of which model is "best" for tutoring is open.
- [ ] Probe quality — the same LLM that generates the curriculum also grades the learner; self-grading can be too generous.
- [ ] Cold-start UX: a learner has no idea how to phrase the topic at the right level; needs good defaults.
- [ ] No stated WTP — the open-source stance is clear, but a sustainable funding path is not named.
