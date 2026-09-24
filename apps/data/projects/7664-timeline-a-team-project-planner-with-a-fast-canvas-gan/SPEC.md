# SPEC.md — Timeline, a team project planner with a fast canvas Gantt view

## Problem

I do a lot of project management, and for years I wanted a tool that was simple, interactive, and just worked: a timeline I could see and touch, where moving a task is a drag and not a form. Nothing I used felt like that. I didn&#x27;t have the coding chops to build it myself until AI-assisted coding made it possible, so over the last few months I built it with Claude Code doing most of the typing and me doing the design, testing, and a great deal of arguing about how dragging should feel. This is the result, and I&#x27;m open-sourcing it.<p>What it does:<p>- A Gantt-style timeline you drag, resize, zoom and pan. Dependencies draw as arrows and the critical path is computed and highlighted.
- A board view of the same tasks grouped by status, and a list view for phones.
- Projects are private to their members, with owner &#x2F; editor &#x2F; commenter &#x2F; viewer roles and reusable teams.
- Templates: start from a plan (MVP launch, seed round, hiring, OKR quarter, and some hobby ones) anchored to a date, or save your own.
- A documented REST API (Django + DRF, JWT) behind a React frontend.<p>The part that took the most work is the rendering. Everything scroll-sensitive (ruler, lane backgrounds, dependency arrows, minimap) is drawn on canvas rather than the DOM, and the visible range is culled, so panning and zooming stay smooth with hundreds of events. Safari in particular was a fight: per-scroll SVG and stacks of sticky layers stall it badly, and canvas was the way out.<p>One design choice you&#x27;ll notice immediately: events are &quot;sticky&quot;. A plain drag pans the timeline; you hold Ctrl or Cmd to move an event. It stops accidental nudges, and the app tells you the first time you try it, but I&#x27;m curious whether people would rather have the opposite default.<p>Try it with no setup other than Docker:<p><pre><code>    git clone https:&#x2F;&#x2F;github.com&#x2F;vakahnke&#x2F;Timeline.git &amp;&amp; cd Timeline
    SEED_DEMO=1 docker compose up --build
</code></pre>
then open localhost:5173 and sign in as demo &#x2F; demo12345. Apache 2.0.<p>Not done yet: iCalendar export, Microsoft Project import&#x2F;export, manual ordering within board without an account. Issues and PRs welcome. Happy to answer anything about the canvas work, the tenancy model, or what it was like building this with AI as a non-programmer.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49748928)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-18T01:01:21Z

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
