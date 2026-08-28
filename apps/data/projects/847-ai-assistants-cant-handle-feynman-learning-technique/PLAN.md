---
id: "847"
slug: ai-assistants-cant-handle-feynman-learning-technique
title: "AI assistants can't handle Feynman learning technique"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: education
date: "2025-11-14"
tags: [Education, Other]
country: China
tech: [React (Vite), TypeScript, LLM API (model-agnostic), Static hosting]
---
# AI assistants can't handle Feynman learning technique

## Tech Stack

React (Vite), TypeScript, LLM API (model-agnostic), Static hosting.

## Architecture

Browser SPA talks directly to an LLM API with two prompt templates (gap detector, rephraser). All attempts are stored in localStorage so the user can scroll back.

## Milestones

- M1: chat interface with single-concept mode
- M2: gap-detection prompt that returns the failing sentence
- M3: simpler-rephrasing prompt and side-by-side attempt history

## Risks

Single-page app. Stateless on the server; attempts live in the browser.

- Gap detection is a quality problem with the underlying model; users will judge the tool on the worst answer, not the best.
- No curriculum or subject coverage claims; this is a study partner, not a tutor.
