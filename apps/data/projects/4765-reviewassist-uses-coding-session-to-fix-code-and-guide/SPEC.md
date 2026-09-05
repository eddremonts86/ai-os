# SPEC.md — ReviewAssist-Uses coding session to fix code and guided PR walkthrough

## Problem

We are a three person team and one thing that we cannot afford to do is spend too much time on the PR. While there are review tools around it to help in the process, all of them start from the diff and the other problem is all of them cost money.<p>So, I build an MCP server which resides in every developer claude session. The MCP server spawns couple of sub agents: Author and Reviewer<p>Author holds the chat session without the code and the Reviewer holds the diff. The reviewer tries to reason out from the diff and asks questions to the author for grounding. Once the reviewer gets all the answers, it generates an intent document that contains whats and whys of the changes. It also contains what was tried and not done and the assumptions that were taken. While the reason for generating such an intent document was to ease up the review process but it also gave us a side benefit which made the MCP server more useful for us. In this process, the author is unable to answer to ground some of the questions from the session chat and ends up relaying it back to the main session agent, which then corrects the code and provides an explanation to the author which is not present in the session.<p>Overall, the mcp server and the github action have helped us reduce the bugs while shipping code. This made me bullish on the product and I wanted to make sure it gets its due light.<p>Do try it out and raise issues or bash it if it does not work.<p>Thanks for reading.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49546071)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T04:50:59Z

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
