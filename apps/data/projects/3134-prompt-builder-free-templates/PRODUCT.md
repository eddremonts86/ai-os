---
id: "3134"
slug: prompt-builder-free-templates
title: Prompt Builder – Free Templates
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449363"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, AI, Prompts, Templates]
tech: [TypeScript, Next.js, PostgreSQL, Prisma, OpenAI API]
---
# Prompt Builder – Free Templates

## Value Proposition

A free, browsable library of prompt templates organised by task, each editable in the browser so the user can adapt the prompt to their situation and copy or send it without leaving the page.

## Target Users

- Non-technical professionals who want to use an LLM at work but do not want to write prompts from scratch.
- Power users looking for a starting prompt they can adapt rather than a blank textarea.
- Team leads curating a shared prompt library for their org who want a public reference.

## Jobs To Be Done

- When I need to get a useful answer from an LLM today, I want to find a template for my task and adapt it so I do not start from a blank page.
- When I am evaluating a prompt, I want to edit the variables in a form so I can rerun it quickly with different inputs.
- When I share a template with a colleague, I want a stable URL and copy-to-clipboard behaviour so the handoff is friction-free.

## Success Metrics

- Number of templates published.
- Number of templates copied or sent per week, as a usage signal.
- Number of distinct task categories covered (proxy for breadth).
- Repeat visits per week as a coarse engagement signal.

## Competitive Landscape

Prompt-template libraries (e.g. public Notion boards) exist, but the source does not name any direct competitor that packages a curated set of free prompt templates in a dedicated app.

## Risks & Open Questions

- Template quality varies; a "verified" or "tested" badge needs a clear editorial policy or it becomes meaningless.
- Sending prompts to a hosted model raises privacy questions for users handling sensitive data; the BYO-key path must be clearly presented as the safer option.
- The variable syntax `{{name}}` is opinionated; if it does not match what users already know from other tools, the form may confuse them.
- Whether to support prompt versioning and "compare two templates side by side" in v2.
