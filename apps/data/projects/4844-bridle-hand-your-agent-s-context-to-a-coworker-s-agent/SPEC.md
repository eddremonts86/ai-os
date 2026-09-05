# SPEC.md — Bridle: hand your agent's context to a coworker's agent

## Problem

A college went on holiday this week and his agent was the one that did the whole migration from Shopware to Shopify. All products, domains, DNS- basically, it had all the knowledge. I spent the morning figuring out how to answer questions to client and finish up what was left to do. From then on we connected our agents with Bridle.<p>Bridle is a CLI that moves work between agents, so that handoff is a command
rather than a memory:<p>bridle send marko.dev --note &quot;migration 0042 is half-applied, continue&quot;
  bridle queue marko.dev --title &quot;finish the retry backoff — see the note&quot;
  bridle inbox<p>Idea came from Tailscale where both ends need to connect in (bridle up). 
Being on the same mesh grants nothing on its own.  Alos payloads are sealed to the recipient, so the coordination server routes by name and holds ciphertext it can&#x27;t read.<p>I tried to make it super simple to run and free to test:
npm install -g bridle-cli &amp;&amp; bridle up<p>Let me know what you think, courious if someone finds it useful our team is super exceted .

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49553877)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T17:48:22Z

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
