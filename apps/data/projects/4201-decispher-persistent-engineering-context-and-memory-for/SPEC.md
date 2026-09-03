# SPEC.md — Decispher – persistent engineering context and memory for coding agents

## Problem

Hello HN,<p>I&#x27;m Ali, building Decispher.<p>The problem we&#x27;re working on is that coding agents repeatedly rediscover context that already exists inside an engineering organization.<p>A developer working on a feature can combine information from previous PRs, Jira tickets, Slack discussions, ownership boundaries, architectural decisions and their own experience. Coding agents usually start with a prompt and a repository, then spend tokens searching for that same context—or miss it entirely.<p>Decispher is a context and memory layer for engineering agents.<p>It currently has three parts:<p>1) Context Engine<p>Engineering context is usually fragmented across systems. Decispher connects records from engineering platforms and combines related fragments into context units that agents can retrieve for a task.<p>For example, context around a component might include previous PRs, related issues, architectural decisions, ownership information and implementation history.<p>We also built Branch Story, which records an AI coding session and turns its execution into a structured handoff on the PR:<p>Prompt → plan → actions → result.<p>2) Memory Plane<p>The Memory Plane stores persistent context at the user, team and project levels.<p>This includes working preferences and engineering conventions. Teams can also create reusable memory sets for example frontend, payments-backend, or project-specific sets and inject the relevant memory based on the task.<p>On LongMemEval, our current system reaches:<p>a) 89% accuracy on the oracle split using GPT-4.1-mini as extractor and reader
b) 81% on LongMemEval -S dataset (89% with frontier models)
c) 38× median token reduction<p>I&#x27;m happy to share more details about how we measure retrieval quality and token reduction.<p>3) Worker Agent<p>Decispher also has an autonomous worker agent that uses the Context Engine and Memory Plane while working on a task.<p>It can take work from sources such as Jira and Slack, retrieve relevant context and ownership information, and ask the humans involved when the available context is insufficient instead of guessing. Those answers can then become available as context for future work.<p>The Context Engine, Memory Plane and Worker Agent can be used independently.<p>Setup<p>npx decispher init<p>This connects a repository and configures the agent integration.<p>npx decispher link<p>This links your decispher account to your repo.<p>Decispher works with MCP compatible agents, with specific integrations for Claude, Codex, Grok Build and Cursor. We also have a VS Code&#x2F;OpenVSX extension for viewing context and writing handoffs.<p>Notes:<p>a) The Context Engine does not clone source code; it reads and writes through the GitHub API.
b) The Worker Agent uses an isolated sandbox with no network route out except through an allowlisted proxy.
c) Worker sandboxes are destroyed after a run.
d) Raw messages and text are encrypted at rest and automatically purged. Sessions are currently purged 7 days after merge or 30 days after last activity, with configurable retention.<p>We also have an MIT-licensed open-source project called Decision Guardian for surfacing ADR context on PRs.<p>The Context Engine is available now. Memory and the Worker Agent are rolling out gradually.<p>I&#x27;m especially interested in feedback and we are also looking for design partners.<p>Happy to answer.<p>Ali<p>This is a follow-up to my previous Show HN post:<p><a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48762112">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48762112</a><p>The major additions since then are the Memory Plane, LongMemEval results, Worker Agent sandboxing and Branch Story for AI-generated work on PRs.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49509142)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T12:53:52Z

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
