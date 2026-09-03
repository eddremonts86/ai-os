# SPEC.md — Tenux – Access your computer from your phone (terminal, files, browser)

## Problem

Hi HN,<p>If you&#x27;ve been using claude code or codex, you may have been like me and used some sort of SSH&#x2F;VPN combo to get remote access to your computer from your phone. It (kinda) works, but it is clunky.<p>Tenux bundles everything into one smooth experience. You install the npm package, login through the cli to link the computer to your account, and start.<p>npm i -g @tenux&#x2F;cli
tenux login
tenux start<p>Inside Tenux, you can open your device&#x27;s workspace from the dashboard, and a terminal (as many as you want), a localhost preview (just type the port number), and an AI agent will be ready for you (BYO API key compatible).<p>The AI agent has some built-in tools that allow it to view output and type on any terminal within tenux. It can also screenshot and view the localhost preview content (as you see it) and control the preview on the same window, or open its own window to control. I&#x27;ve been experimenting recently with a &#x27;UX&#x27; mode that allows you to touch a component within the localhost browser and make direct UI changes (this is a newly added feature), or just talk to the agent with the component selected and it will have the context it needs.<p>You can try all this out for free. The free tier is p2p and uses WebRTC to connect to your device, it will work as long as you are on the same network (pro tip: if your machine and your phone are on the same VPN, you can access your machine remotely).<p>I&#x27;ve tested Windows and Linux, if you&#x27;re on Mac I would appreciate any feedback.<p>Happy to answer any questions.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49524367)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T16:38:10Z

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
