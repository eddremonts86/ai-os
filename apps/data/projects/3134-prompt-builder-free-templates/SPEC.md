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

## Problem

People who want to use a large language model productively usually have a task ("write a job spec", "summarise this email thread") but no idea what a good prompt for it looks like. The Prompt Builder site collects and publishes free prompt templates the user can pick from, edit in place, and copy or send directly to an LLM — lowering the activation energy from "I have a task" to "I have a working prompt".

## Objective

Ship a browsable catalogue of free prompt templates organised by task, each editable in a form on the page, with a one-click path to copy the prompt or send it to a configured model.

## Target Users

- Non-technical professionals who want to use an LLM at work but do not want to write prompts from scratch.
- Power users looking for a starting point they can adapt rather than a blank textarea.
- Teams sharing internal prompt libraries who want a public benchmark to compare against.

## MVP Scope

- A public templates page listing every template, filterable by task category (writing, summarisation, code, analysis).
- A template detail page showing the prompt, its variables (placeholders the user fills in), and an "edit and copy" form.
- A "copy to clipboard" button on every template.
- A "send to model" button for signed-in users, calling the user's own configured model endpoint (BYO key) or a default hosted option.
- A small admin path to add a new template (Markdown with `{{variable}}` placeholders) — kept minimal for MVP.
- Out of scope: marketplace or paid templates, fine-tuning on templates, collaborative editing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- All templates are free at MVP; no paid tier or upsell gate.
- The user's prompt content stays on the client unless they explicitly choose to send it to a model; the site does not log template runs.
- Variable substitution is explicit: every `{{variable}}` must be filled or the form must refuse to send.
- BYO-key model access uses the user's own provider account; the site never proxies the key to a third party.
