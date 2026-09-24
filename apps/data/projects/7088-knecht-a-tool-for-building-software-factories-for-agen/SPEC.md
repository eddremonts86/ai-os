# SPEC.md — Knecht, a tool for building software factories for agencies

## Problem

An agent that only reads and writes code is guessing whether its changes work. To maintain many projects I need one that can boot the app, run migrations, hit the page and read the actual error.<p>So I built Knecht. A Self-hostable tool. You connect your GitHub repos and it starts each project in an isolated Docker sandbox, generated with DDEV. Inside, an agent can do what a developer does locally. Reproduce a bug, run migrations, open the page in the browser etc.<p>Workflows can be started by triggers (Jira tickets, GitHub issues, PRs..) and can run across all projects at once, mixing AI agent steps with deterministic steps, similar to n8n.<p>Knecht is in beta and I am looking for people who maintain many projects. Works best with DDEV projects.
<a href="https:&#x2F;&#x2F;github.com&#x2F;knecht-works&#x2F;knecht-cloud" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;knecht-works&#x2F;knecht-cloud</a>
<a href="https:&#x2F;&#x2F;knecht.works&#x2F;updates&#x2F;beta-tester" rel="nofollow">https:&#x2F;&#x2F;knecht.works&#x2F;updates&#x2F;beta-tester</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49709714)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T09:01:56Z

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
