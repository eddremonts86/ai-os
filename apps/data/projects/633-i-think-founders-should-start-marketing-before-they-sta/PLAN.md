---
id: "633"
slug: i-think-founders-should-start-marketing-before-they-sta
title: I think founders should start marketing before they start building.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voy6zq/i_think_founders_should_start_marketing_before/"
category: saas
date: "2026-08-15"
---
# I think founders should start marketing before they start building.

## Tech Stack

- **Frontend:** SvelteKit. The product is a small number of text-heavy views; a framework that
 ships little JavaScript suits a tool meant to feel like a notebook rather than a dashboard.
- **Backend:** the same SvelteKit server routes. There is no second consumer, so a separate API
 would be structure without a reader.
- **DB:** PostgreSQL, specifically for full-text search over captured quotes. Grouping competing
 descriptions of one problem is a text problem, and this is the one place the stack is chosen
 for the domain rather than habit.
- **Deployment:** a single container on any host. Nothing here needs to scale before it is known
 whether anyone wants it — which is, fittingly, the product's own argument.

## Architecture

Three tables and two views: `captures` (a quote, its source link, the framing it belongs to),
`outreach` (what was posted, where, and the response), and `problems` grouping both. The single
summary view is a query over those, not a service.

There is no diagram here on purpose. Prose describes this accurately in one sentence, and a
three-box picture would carry less than the sentence does.

## Milestones

1. **M0** — capture a quote with its source link, and list captures for one problem.
2. **M1** — framings: group captures, and show competing descriptions side by side.
3. **M2** — the outreach log, with the response types the post actually names (nothing, a reply,
 "same here", tell-me-when-it-ships).
4. **M3** — the "does anybody care yet" view built from M1 and M2.
5. **M4** — export, so the record outlives the tool. A validation record locked inside a SaaS is
 a worse version of the notes app it replaced.

## Risks

- **The source is an opinion post, not a request for a product.** The pain is described
 first-hand and credibly, but nobody in the thread asked for software. That gap is the main
 risk here and it should be closed by talking to the poster's audience before building — which
 is, unavoidably, the method the post is advocating.
- **The behaviour it depends on is rare.** Founders who will keep a written record before
 building are a subset of a subset.
- **Manual capture is friction, and friction is fatal to a habit tool.** If pasting a quote is
 slower than not bothering, the record stays empty and the summary view has nothing to show.
- **A notes app is the real competitor.** Not another product — a text file. The tool has to be
 better than that or it will not be used.
