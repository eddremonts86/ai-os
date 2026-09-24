# SPEC.md — MCPJam - the first testing & evaluations platform for MCP servers

## Problem

Prathmesh, CEO of MCPJam here.<p>Users now start in ChatGPT, Claude, Cursor, and other AI clients. They reach your product through your MCP server.<p>That means your users often aren’t in your product anymore. You can’t see what they prompted for, how the agent interpreted it, or whether your server helped them get the result they wanted.<p>I saw this firsthand leading MCP technical strategy at Asana, including our ChatGPT and Claude launches. We were building high-stakes enterprise integrations, but we had no reliable way to test them the way we test normal software- or to know whether they worked once they reached real users.<p>I started using MCPJam for those problems after re-connecting with my former coworker who created the project. brought it to more of our developers, and worked it into our CI&#x2F;CD pipeline. I joined the team because I kept hearing the same issue from other companies building for agents.<p>So, what does “good” look like for MCP? For us, it means users reliably get the outcome they came for, across the AI clients they use.<p>That’s what we’ve been building toward. MCPJam now helps you test the full workflow, from the first prompt to the expected result:<p>* Swarms: Simulate users with different goals and prompts to find where workflows break across AI clients.
* User Testing: Watch how real users interact with your MCP product, where they get stuck, and how they feel about the results.
* Evals: Turn those workflows into repeatable tests that check whether users get the expected outcome.
* CI&#x2F;CD: Run those evals across AI clients before each release to catch regressions.<p>Over 106,000 developers and +300 enterprises use our open-source solution to see how their servers behave locally across major AI clients. MCPJam has grown from a debugging tool into a continuous testing and evaluation workflow for MCP servers.<p>If you’re building an MCP server or agent-facing product, give MCPJam a try. What is the hardest thing for you to test? We love hearing about your MCP server builds!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49745351)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T19:23:47Z

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
