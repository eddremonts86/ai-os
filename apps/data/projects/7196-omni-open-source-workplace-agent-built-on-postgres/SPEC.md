# SPEC.md — Omni – Open-source workplace agent, built on Postgres

## Problem

Hi HN!<p>Over the past year, I&#x27;ve been building Omni (<a href="https:&#x2F;&#x2F;github.com&#x2F;getomnico&#x2F;omni" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;getomnico&#x2F;omni</a>) - an open-source, self-hosted agent that connects to your workplace apps (drive, email, wiki, CRMs, ticketing systems, etc.), and gives your team an AI agent that can operate across these apps.<p>I posted about Omni on HN about 6 months ago, and it generated some interesting discussions: <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=47215427">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=47215427</a>. At the time, Omni was largely an enterprise search system. Since then, the project has evolved to become more of an agent that can gather context, analyze information, and carry out tasks; rather than just search for answers.<p>E.g., you can tell Omni, &quot;create a project status deck on Google Slides with this week&#x27;s progress&quot;, and it will search through Jira, Slack, Docs, meeting transcripts, fetch the relevant information, analyze spreadsheets with Python, prepare a summary and ask for your approval before creating the slides on your drive.<p>A non-exhaustive list of things Omni can do today:<p>- Take action on connected apps, with an approval system for write actions<p>- Full MCP support, so connectors can integrate with any existing MCP servers.<p>- Sync data from connected apps into a unified search index, allowing the agent to query data across all apps using a single search tool.<p>- Sand-boxed code execution and shell access, enabling the agent to create documents, spreadsheets, presentations and HTML landing pages.<p>- Persistent memory and user-defined skills<p>Omni still uses Postgres as its core data layer where it syncs and indexes all data from connected apps. We use ParadeDB (Postgres extension) for BM25 search and pgvector for semantic search - so there&#x27;s no need to run and operate a dedicated search cluster or vector database. To know more about the architecture: <a href="https:&#x2F;&#x2F;docs.getomni.co&#x2F;architecture" rel="nofollow">https:&#x2F;&#x2F;docs.getomni.co&#x2F;architecture</a>.<p>Would love to get more folks involved in the project, so if you find this interesting, please check out the repo below. It only takes around 10-15 min to deploy using docker compose and connect a few apps.<p>Happy to answer any questions!<p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;getomnico&#x2F;omni" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;getomnico&#x2F;omni</a> (Apache 2.0 licensed)<p>Docs: <a href="https:&#x2F;&#x2F;docs.getomni.co" rel="nofollow">https:&#x2F;&#x2F;docs.getomni.co</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49715402)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T16:58:14Z

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
