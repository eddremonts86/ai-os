---
id: "2420"
slug: how-to-claude-like-anthropic
title: How to Claude Like Anthropic
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49396175"
category: ask-hn
date: "2026-08-22"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# How to Claude Like Anthropic

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I just received an email from Anthropic. Besides the usual new feature ad, there is a piece that I find quite amusing:> How to Claude like Anthropic> "My daily driver currently looks like: two lead agents that keep each other accountable and restart the other if either fails. These delegate to tech lead or PM agents for the 8-10 projects I'm running at any one time, and each project has 5-10 IC agents, generalists or specialists depending on the problem. Across all of these I'm still only doing 30-50 prompts per day, and my IC agents typically work autonomously for 2-3 days. About 60% of my interaction is with the leads, 35% with a project lead, and 5% is when something has gone off the rails. All of these agents communicate directly with the SendMessage tool."> – Daisy, Engineer on Claude CodeThis sounds very foreign to me because it couldn't be more different from how I use Claude Code. My current workflow is:- For a new feature, I create a session, and depending on the complexity, I will either use plan mode or something else like Superpowers to brainstorm, work out the requirements, and create a plan/spec. This process typically makes up most of my interactions with the agent.- Then, after it implements the feature, I open a new session, use my own skill to review the PR, and post the findings on the PR.- Once I have the PR comments, I give them back to the original session and use another matching skill to give a verdict on the findings and attempt to fix them. This process will typically happen back and forth for ~3 rounds.- Once the reviewer session is happy, I ask the original session to perform an E2E test plan that covers everything it has implemented.I feel like my workflow is not automated enough, and my verification loops are still too manual. But I also feel more reassured this way because I read every report and have a general sense of the quality of the PR without having to read the code.Does anyone here use a similar workflow to Claude, that utilizes specialized agents instead of just the general-purpose one? Can you share your experience? Do you have a guide/blog I can read to learn more about it?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49396175) · **Category:** ask-hn · **Tags:** Ask HN,Problem
