---
id: "305"
slug: ai-assistants-cant-handle-feynman-learning-technique
title: "AI assistants can't handle Feynman learning technique"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/education/tnjlstt8s1-ai-assistants-cant-handle-feynman-learni"
category: education
date: "2025-11-12"
tags: [Education, AI, Other]
country: China
tech: [Next.js, TypeScript, Postgres, Anthropic Claude API, LangSmith tracing, Vercel]
---
# AI assistants can't handle Feynman learning technique

## Problem

A user in China describes a specific failure mode of current AI assistants: they do not handle the Feynman learning technique well. The Feynman method requires the learner to explain a concept in plain language as if teaching a child, then surface the gaps where the explanation breaks down, then return to the source and re-learn. Today's assistants tend to either accept any explanation as good enough or over-correct with a flood of jargon, neither of which is what the learner actually needs. The title pins the missing piece: an AI that runs the Feynman loop, not an AI that just answers.

## Objective

Ship a learning companion that runs the Feynman technique end-to-end — accepts a topic, asks the learner to explain it, identifies the weak joints in the explanation, and loops back with targeted questions until the learner can teach it back without recourse to the source.

## Target Users

- Chinese university students studying technical subjects (CS, engineering, economics) who use AI to study.
- Self-taught learners in China preparing for industry certifications or interviews.
- Tutors and study-group leaders who want a structured loop to assign to mentees.

## MVP Scope

- Topic input (free text or paste of study notes).
- Explanation prompt: the AI asks the learner to explain the topic in plain language, as if to a smart 12-year-old.
- Gap detector: identifies phrases that are vague, jargon-heavy, or rely on the source instead of the learner's own model.
- Targeted question loop: each round returns 3–5 short questions the learner must answer before the next round.
- Completion badge when the learner can explain the topic with zero jargon in under 200 Chinese characters.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/education/tnjlstt8s1-ai-assistants-cant-handle-feynma` follows the constraints in `305-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in China.

For China, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Must work in Chinese (Simplified) as the primary study language, with English as a secondary option.
- No reliance on Western-only SaaS for the model layer at runtime; model calls must go to a China-reachable endpoint or be served by a local model.
- Sessions are private: explanations and gap notes are not used to train other models.
