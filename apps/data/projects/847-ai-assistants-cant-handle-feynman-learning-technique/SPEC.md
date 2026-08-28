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

## Problem

A poster in China says current AI assistants do not handle the Feynman learning technique well. The technique is: pick a concept, explain it simply as if teaching a child, identify gaps where the explanation breaks, revisit the source, repeat. The poster's complaint is that assistants do not push back on vague explanations or surface the specific gap.

---

## Objective

Give a learner an AI partner that runs the Feynman technique rigorously: pushes back on vague explanations and surfaces the exact gap.

## Target Users

Self-learners and students in China (and elsewhere) using Feynman-style study for technical subjects.

## MVP Scope

A chat where the user picks a concept, explains it in their own words, and the assistant responds with two things: (a) the specific sentence or term where the explanation broke down, and (b) a simpler rephrasing the user can try again.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Single concept at a time. No progress dashboard in v1. No invented curriculum.
