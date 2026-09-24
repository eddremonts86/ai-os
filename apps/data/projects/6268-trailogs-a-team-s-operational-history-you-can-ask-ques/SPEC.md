# SPEC.md — Trailogs – A team's operational history you can ask questions about

## Problem

Hi! My name is Marko, and I&#x27;m a developer (primarily backend) who loves building stuff.<p>I&#x27;ve been trying to solve a problem of scattered operational context across Slack threads, tickets, meetings, etc. (my way)... The idea of Trailogs is to be a central event-based history, where each event (log) has structure around it, like categorization, ownership, etc...<p>It has an exploration page, which is basically an AI chat where you can ask questions about what is happening in the company, why a certain decision was made, what is going on with a specific customer, who was responsible for a certain thing, etc...<p>I realized that &quot;what should I ask?&quot; could be a problem, so the chat gives you suggestions based on your role in the team and interests. So if you are a developer, you could get a suggestion to ask about a certain deployment&#x2F;feature release from today. If you are in sales, you&#x27;ll get a suggestion to ask about negotiations that happened today with a certain customer.<p>The chat is currently powered by OpenAI. Now, I understand the privacy concerns and sensitivity of the data, so I&#x27;m planning an implementation with a self-hosted LLM, or the possibility for users to use their own LLM.<p>I was thinking about how to reduce the friction so teams don&#x27;t have to manually log stuff every time, so, for now, I implemented the possibility to integrate through an API and webhooks (incoming, outgoing). Also, since a lot of team conversations happen in Slack, I&#x27;ve built a Slack integration so you can ask questions directly from Slack or ask it to draft a log based on what was discussed in a thread.<p>The app is functional and can be tried. It has a registration form, but I made it possible to just continue with a demo account, so you don&#x27;t have to leave any personal information if you don&#x27;t want to, and you can quickly get straight to the demo workspace.<p>Poke around, let me know what you think. :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49643847)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T14:00:17Z

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
