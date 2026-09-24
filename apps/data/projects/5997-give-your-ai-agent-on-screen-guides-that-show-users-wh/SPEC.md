# SPEC.md — Give your AI agent on-screen guides that show users where to click

## Problem

Hey HN. I&#x27;m Christian, one of the founders of Frigade (YC W23). I&#x27;ve noticed that a lot of in-app AI agents struggle to actually understand the products they exist in.<p>For instance, let&#x27;s say a user asks an agent how to do something in a given SaaS product. In an ideal case, maybe that agent replies saying it has a tool to do the task and just automates that work entirely for the user. That&#x27;s a great outcome.<p>But often that&#x27;s not the case. Maybe there is no tool call for that exact task, or maybe the user&#x27;s question is best solved by a specific UI workflow or interface. In these cases, many agents tend to fall back on basic RAG on their help center, or sometimes even searching the internet for an understanding of their own product. This can be a very slow process and most of the time help center articles are outdated as products evolve faster than them today. Even worse, no one likes reading a long list of bullets and mapping that back to a UI.<p>My tool (Assist API) solves this gap with a single tool call defined like this:<p><pre><code>  const frigade_guide_tool = {
    description: &#x27;Call this tool to answer product questions or guide the user through a task.&#x27;,
    parameters: {
      query: {
        type: &#x27;string&#x27;,
        description: &#x27;What the user is asking or wants to do&#x27;,
      },
    },
    run: ({ query }) =&gt; frigade.assist({ query }),
  }
</code></pre>
Here&#x27;s a demo I recorded on how to set it up with the Vercel AI SDK: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=9WQ0UbLjC6I" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=9WQ0UbLjC6I</a><p>When called, the tool will do the following:<p>1) Gather context on what the user is seeing on screen, their permissions, feature flags, and more. Then one of the following:<p>2a) If solvable: Generate an on screen guide for how to fix a given problem<p>2b) If conceptual: Return text describing to the parent agent how to solve the problem<p>2c) Reject (i.e. unable to help)<p>How does the tool know what to do?<p>The tool learns a given application UI by using a browser-based agent. You provide a test account to your software (i.e. staging og preview), and a browser agent logs in and works its way through the entire product. It then builds its own map of how the application works which can the be queried about any product-related question or how to get from A to B in the UI. It also writes its own documentation from this map. The agent re-runs on a schedule or can be triggered through CI&#x2F;CD.<p>Docs and more details: <a href="https:&#x2F;&#x2F;frigade.com&#x2F;assist-api">https:&#x2F;&#x2F;frigade.com&#x2F;assist-api</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49627872)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T15:09:05Z

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
