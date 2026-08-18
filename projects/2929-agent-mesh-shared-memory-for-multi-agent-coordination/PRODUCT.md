---
id: "2929"
slug: agent-mesh-shared-memory-for-multi-agent-coordination
title: Agent Mesh – Shared memory for multi-Agent coordination
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49332326"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Agent Mesh – Shared memory for multi-Agent coordination

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built a Human + multi-Agent shared memory system I use daily for my coding workflow. It helps reduce Agent drift by formalizing Human decisions and storing coordination logs. We're calling it Agent Mesh.You can try it out yourself via the GitHub link or pip install my-agent-mesh. Simply point your AI Agent to Agent Mesh and ask it to review the README and adoption docs. Your Agent will automatically review it, prompt you for any input needed, add your input to a decision log, and give you a link to a dashboard UI (aka Workbench) you can bookmark and use to monitor logs. Adoption steps include updates to CLAUDE.md/AGENTS.md, hooks, etc. Your Agent can migrate your existing workflow and add more Agents as well.It started over 6 months ago while experimenting with different AI coding models and platforms. Switching back and forth meant losing valuable context. I found myself manually relaying messages from one Agent to another and becoming frustrated with constant drift. First, I created a simple "Agent Mail" system using a SQLite database for Agent messages, indexed on a request/response id. Instead of copying and pasting an entire message, it allowed me to relay a single id. Separately, I started maintaining a decision log (also indexed on id) to track my decisions and reduce Agent drift. Agents started inserting these decision and request ids into code comments and plan docs as a reminder of why something was implemented. After building a simple web dashboard (aka "Workbench") for myself to track these messages and create my own request ids for User/Human feedback, I decided to incorporate the decision log and my project's development backlog to create what is now "Agent Mesh".Eventually, I automated the message relay too. Now, I work exclusively in the Claude app and have Claude send/receive messages to CODEX via codex exec (CODEX can do this as well). Both of them maintain the backlog and decision log. I communicate directly with Claude for planning and design. Claude communicates directly with CODEX for research and review. I use the Workbench to track all logs and add my own User/Human feedback when reviewing their work. After submitting feedback in the Workbench, it generates a feedback message + an associated request id which I can give to Claude who then parses it into backlog items and relays to CODEX for review. Agents automatically add to and prune the decision log. I found this typically happens when an Agent receives pushback from me (or sometimes other Agents) or I provide feedback that results in multiple new backlog items. They still refer to decisions created months ago and will mark one as superseded if a new decision overrides it. All decision additions and modifications require Human approval from the Workbench.Agent Mesh was structured to be Agent agnostic. You can add any Agent you want. I like using the Claude + CODEX setup I described because it allows me to use both subscriptions instead of paying per-token.Enjoy! If you try it out, let me know what you find useful or would like to see added. Feedback is appreciated.

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49332326) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
