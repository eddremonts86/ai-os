# SPEC.md — Wayfinder – A reference implementation for evaluating AI applications

## Problem

Testing is critical to software applications — first to make sure they reliably serve the purpose they were built for, and then to make sure they stay that way as they grow, evolve and change. The same applies to AI applications as well. But testing AI applications is very different from testing classic software applications, especially because of their non-deterministic nature. It is very important for AI Engineers to develop a deep understanding of AI Evaluation to be able to build reliable AI applications and ship changes faster without breaking their existing behavior.<p>AI Evaluation is often presented as a long list of independent techniques: Rule-Based Evaluation, Human Evaluation, LLM-as-a-Judge, Offline Evaluation, Online Evaluation, Component Evaluation and End-to-End Evaluation. But in practice they all complement and build on each other.<p>I built Wayfinder, a reference implementation where I explore these concepts progressively using the same AI application. My goal was to build an intuition for how the different evaluation techniques fit together, and how to turn them into an evaluation strategy for an AI application.<p>I&#x27;d be interested to hear how others are approaching evaluation in production AI applications and what you think is missing from this implementation.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49585201)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T10:45:53Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
