# PRODUCT.md — Timeline, a team project planner with a fast canvas Gantt view

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I do a lot of project management, and for years I wanted a tool that was simple, interactive, and just worked: a timeline I could see and touch, where moving a task is a drag and not a form. Nothing I used felt like that. I didn&#x27;t have the coding chops to build it myself until AI-assisted coding made it possible, so over the last few months I built it with Claude Code doing most of the typing and me doing the design, testing, and a great deal of arguing about how dragging should feel. This is the result, and I&#x27;m open-sourcing it.<p>What it does:<p>- A Gantt-style timeline you drag, resize, zoom and pan. Dependencies draw as arrows and the critical path is computed and highlighted.
- A board view of the same tasks grouped by status, and a list view for phones.
- Projects are private to their members, with owner &#x2F; editor &#x2F; commenter &#x2F; viewer roles and reusable teams.
- Templates: start from a plan (MVP launch, seed round, hiring, OKR quarter, and some hobby ones) anchored to a date, or save your own.
- A documented REST API (Django + DRF, JWT) behind a React frontend.<p>The part that took the most work is the rendering. Everything scroll-sensitive (ruler, lane backgrounds, dependency arrows, minimap) is drawn on canvas rather than the DOM, and the visible range is culled, so panning and zooming stay smooth with hundreds of events. Safari in particular was a fight: per-scroll SVG and stacks of sticky layers stall it badly, and canvas was the way out.<p>One design choice you&#x27;ll notice immediately: events are &quot;sticky&quot;. A plain drag pans the timeline; you hold Ctrl or Cmd to move an event. It stops accidental nudges, and the app tells you the first time you try it, but I&#x27;m curious whether people would rather have the opposite default.<p>Try it with no setup other than Docker:<p><pre><code>    git clone https:&#x2F;&#x2F;github.com&#x2F;vakahnke&#x2F;Timeline.git &amp;&amp; cd Timeline
    SEED_DEMO=1 docker compose up --build
</code></pre>
then open localhost:5173 and sign in as demo &#x2F; demo12345. Apache 2.0.<p>Not done yet: iCalendar export, Microsoft Project import&#x2F;export, manual ordering within board without an account. Issues and PRs welcome. Happy to answer anything about the canvas work, the tenancy model, or what it was like building this with AI as a non-programmer.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49748928) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
