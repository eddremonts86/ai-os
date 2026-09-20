# SPEC.md — Ontoplano, FOSS Life Management desktop and mobile app with MCP server

## Problem

Hi, I am Estevão, the developer of Ontoplano, a holistic life management webapp, supporting *tasks planning, todos, goals, habits, notebooks, people, inventory tracking, recipes, and more.*<p>I built this app because my life was spread over multiple different apps and pieces of paper. Ontoplano started as a weekly planner that I made (because I dislike sharing my life information with Google and also had nitpicks with every FOSS calendar I tried) and grew into one app for everything personal.<p>As said in the title, the project is completely free and open source, licensed under AGPL-3.0, for anyone who wants to run their own instance.<p>I run my own instance at app.ontoplano.com, for people who aren&#x27;t into self hosting. On it, there are no ads, no tracking&#x2F;profiling code, no telemetry, no tricks whatsoever. You can leave it at any time and take all your data with you.<p>I firmly believe software should empower people, not exploit them, and I hope that&#x27;s just what I can provide the world with by releasing Ontoplano.<p>Furthermore, I also like software to be beautiful and practical. Ontoplano (self-hosted or not) comes with a Mobile app (PWA or the APK if you want the widget and prettier-looking notifications), and a MCP server for using it with AI (if you hate AI, don&#x27;t worry, there is no built-in AI to opt-out of, only a MCP server you can create a token for, or not).<p>I implemented these two because:
1. I wanted to use it smoothly, even if I am away from home
2. Sometimes is much easier to say &quot;Hey AI, put on Ontoplano that last week I actually slacked off and played videogames everyday&quot; than manually doing that in a calendar, for psychological and time-consuming reasons.<p>Besides that, you can also: 
- Import your notes&#x2F;todo tasks from Google Tasks, Google Keep, Obsidian, Todoist, and more in the future.
- Calendar sync with Google Calendar (or other calendars) using ICS
- Access your shopping list offline it, and share it with your family members (if you want to).<p>And there is more in the roadmap. Any help is appreciated — be it you self-hosting to help me find bugs and improve the app, be it you giving me a star on GitHub.<p>Thank you for your attention.<p>Main website: <a href="https:&#x2F;&#x2F;ontoplano.com" rel="nofollow">https:&#x2F;&#x2F;ontoplano.com</a>
Demo (no signup, throwaway account): <a href="https:&#x2F;&#x2F;demo.ontoplano.com" rel="nofollow">https:&#x2F;&#x2F;demo.ontoplano.com</a>
Code: <a href="https:&#x2F;&#x2F;github.com&#x2F;ontoplano&#x2F;ontoplano" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ontoplano&#x2F;ontoplano</a>
Docs: <a href="https:&#x2F;&#x2F;docs.ontoplano.com" rel="nofollow">https:&#x2F;&#x2F;docs.ontoplano.com</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49588540)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T17:07:03Z

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
