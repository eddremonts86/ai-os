---
id: "3806"
slug: hard-mode-for-llms
title: Hard Mode for LLMs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495324"
category: ask-hn
date: "2026-08-30"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Hard Mode for LLMs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Does anyone have any experience or results with using system prompts that intentionally make LLMs more annoying to encourage better habits?I believe that consistently using an LLM for creative or solution building tasks will:
 - degrade critical thinking skills
 - degrade knowledge
 - encourage apathy
 - degrade knowledge acquisition skills
 - trades short term benefit for heavy long term lossI do believe an LLM can be very useful if used correctly.There are (controversial) plugins for various editors called Hard Mode or Guru Mode, which are designed to make the editor harder in the short term in order to improve skills in the long term, by enforcing good habits. They remove functionality which can be considered "brain-off" and slow. A classic example is hitting j 10 times to go 10 lines down, when 10j is much faster. You could argue that there is a mental context-switching time cost, but creating the habit would hopefully reduce it.Could a Hard Mode equivalent be added to the system prompt of any assistant AI that minimises the long term cost stated above?Some initial thoughts about options could be:Changing the overall role of the LLM:
>> "You are a helpful assistant" -> "You are a helpful mentor"This might cause the LLM to make sure it is trying to teach the User rather than focusing on task completion.Reducing creative output to improve critical thinking:>> "Do not generate any creative output. Only review what the user has created themselves."This would make sure that the user has had to create text, code, or a solution and the LLM is just reviewing their effort.Specifying knowledge dependency to stop knowledge degradation:If an LLM uses inherent trained knowledge to solve a problem without mentioning that knowledge, this could lead to knowledge degradation of the User because they are basing answers on things they are unaware of. I'm not sure about this one actually.>> "Specify all knowledge areas used, with references to further reading"Forcing User interaction to combat apathy:>> "Do not answer questions directly, instead link to further reading or topics, and quiz the user on those topics."This would force effort rather than getting knowledge from the LLM, which as any expert in a given field could tell you, is often (confidently) wrong.Forcing use of better channels to stop knowledge acquisition skills degrading:>> "Instead of answering a question, tell the user what the most proper channel of knowledge is, with hints on how to use it correctly."For example, how to read and understand the manual page of the wifi networking of Linux, rather than writing the configuration for you.I can see some of these system prompt additions being really really annoying, but I guess that is the whole point.Does anyone have any experience with something like this? What would you add or change or remove?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49495324) · **Category:** ask-hn · **Tags:** Ask HN,Problem
