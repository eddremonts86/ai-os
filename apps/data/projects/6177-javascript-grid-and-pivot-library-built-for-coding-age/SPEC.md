# SPEC.md — JavaScript grid and pivot library built for coding agents

## Problem

Hi, I am building a js library for grids (and pivot tables) so that coding agents can use our primitives to deliver a grid based on your specifications.<p>I started working on this problem because data displays like grids &#x2F; pivot tables are tricky to get right as more and more features pile up (features like: pagination of data, virtualization, pivots, grouped views, custom renderers, filters, sort, etc)<p>Pre llm and coding agents, I built <a href="https:&#x2F;&#x2F;github.com&#x2F;chartshq&#x2F;muze" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;chartshq&#x2F;muze</a> (that later got acquired by mode analytics) with grammar of graphics for developers. But I have always felt a library built for agents would have a fundamentally different philosophy than the one built for devs.<p>What does an agent first js grid library mean?<p>The library comes up with few primitives and mental models that agents can use reliably (<a href="https:&#x2F;&#x2F;www.superplot.dev&#x2F;grid&#x2F;our-approach&#x2F;#principles&#x2F;table-algebra" rel="nofollow">https:&#x2F;&#x2F;www.superplot.dev&#x2F;grid&#x2F;our-approach&#x2F;#principles&#x2F;tabl...</a>) alongside the design and architecture of the grid (open closed system + data flow + relinquishing right control to agents). Thus enforcing enough abstraction for agents that produce fewer bugs in a single shot (<a href="https:&#x2F;&#x2F;www.superplot.dev&#x2F;grid&#x2F;our-approach&#x2F;#principles&#x2F;headless-architecture" rel="nofollow">https:&#x2F;&#x2F;www.superplot.dev&#x2F;grid&#x2F;our-approach&#x2F;#principles&#x2F;head...</a>).<p>How is it different from a lib built for devs?<p>Unlike a lib built for devs where the abstaction layer is much closer to humans (config driven like highcharts &#x2F; aggrid), I belive having a different layer of abstraction from carefully defined building blocks and stable contracts help agents build reliable and stable outputs.<p>For majority of the usecases, a user can ask an agent to build a particular representation of the grid (without waiting for the library to support it internally) to their liking. The agent would then go and build the grid with given constructs acting as guardrails. (Ofcourse there is a limit to that, for example if you want to do something which is outside the scope of mental model)<p>What does it support?<p>- Headless grid with virtualization
- Local in browser datasource via duckdbwasm (supports pivot &#x2F; tree &#x2F; grouped data ops)
- External datasource connection via our IR (codegen to db &#x2F; semantic model should be easy given llm like structures)
- Pivot + tree view + grouped data view 
- Table algebra support (that gets translated to IR for external datasource, for which agent can do codegen)
- Pagination &#x2F; data evictions for billions of row handling
- Metadata plumbing (for usecases like complex cells where data needs to be generated from multiple differnet parameters)
- Usage patterns &#x2F; documentations (we are working on this)<p>Some demos: <a href="https:&#x2F;&#x2F;www.superplot.dev&#x2F;grid&#x2F;#demos" rel="nofollow">https:&#x2F;&#x2F;www.superplot.dev&#x2F;grid&#x2F;#demos</a>
Github: <a href="https:&#x2F;&#x2F;github.com&#x2F;superplothq&#x2F;grid" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;superplothq&#x2F;grid</a><p>Would love to get your feedback on the approach as I continue to build the library.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49643496)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T13:35:40Z

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
