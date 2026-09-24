# SPEC.md — Give your AI agents access to WhatsApp

## Problem

Hi,<p>I built Chat-Man because I wanted a cheap way to give my agents access to WhatsApp without integrating a WhatsApp library separately in every project.<p>You get  WhatsApp MCP server, so you can connect WhatsApp to an agent and programmatically read, search, extract and send messages - but also have a web UI for non-techies.<p>You can also receive webhooks for incoming messages for starred conversations.<p>What you can do with the MCP?
-Read WhatsApp messages and turn them into CRM records
-Summarise conversations or groups
-Extract structured information from messages
-Find messages, participants or other WhatsApp data
-Send messages
-Manage group memberships<p>Of course.. you always need to follow data protection regulation.<p>The web UI:
-Edit group details
-See who joined or left
-See who is most active
-Export group members
-Match members against a CSV (e.g. from a CRM)
-Bulk message members
-Bulk kick members
-Create invite links
For individual contacts, you can send messages directly from the UI.<p>Why I built it for myself?
I needed WhatsApp access for several projects (hermo.ai, florahaus.co.uk, …) and didn&#x27;t want to pay for a WhatsApp integration for each project.<p>Link: <a href="https:&#x2F;&#x2F;chat-man.net" rel="nofollow">https:&#x2F;&#x2F;chat-man.net</a><p>I’d love to get some feedback, especially from people building agents that need access to WhatsApp. 
Fabian

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49728159)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T15:04:08Z

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
