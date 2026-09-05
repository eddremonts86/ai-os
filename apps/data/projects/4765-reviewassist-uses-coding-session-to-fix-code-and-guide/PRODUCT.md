---
id: "4765"
slug: reviewassist-uses-coding-session-to-fix-code-and-guide
title: ReviewAssist-Uses coding session to fix code and guided PR walkthrough
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49546071"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# ReviewAssist-Uses coding session to fix code and guided PR walkthrough

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We are a three person team and one thing that we cannot afford to do is spend too much time on the PR. While there are review tools around it to help in the process, all of them start from the diff and the other problem is all of them cost money.So, I build an MCP server which resides in every developer claude session. The MCP server spawns couple of sub agents: Author and ReviewerAuthor holds the chat session without the code and the Reviewer holds the diff. The reviewer tries to reason out from the diff and asks questions to the author for grounding. Once the reviewer gets all the answers, it generates an intent document that contains whats and whys of the changes. It also contains what was tried and not done and the assumptions that were taken. While the reason for generating such an intent document was to ease up the review process but it also gave us a side benefit which made the MCP server more useful for us. In this process, the author is unable to answer to ground some of the questions from the session chat and ends up relaying it back to the main session agent, which then corrects the code and provides an explanation to the author which is not present in the session.Overall, the mcp server and the github action have helped us reduce the bugs while shipping code. This made me bullish on the product and I wanted to make sure it gets its due light.Do try it out and raise issues or bash it if it does not work.Thanks for reading.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49546071) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
