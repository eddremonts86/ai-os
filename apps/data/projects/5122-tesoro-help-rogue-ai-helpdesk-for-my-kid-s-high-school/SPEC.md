# SPEC.md — Tesoro.help – rogue AI helpdesk for my kid's high school

## Problem

My kid just started high school. The way they communicate information is absolutely insane. So I built a web scraper + MCP to aggregate it all, then layered on a snarky chatbot with a PG-13 Dave Chappelle personality.<p>The number of communication channels are just insane:
- email
- Google Docs
- Canvas
- PDFs 
- School Messenger 
- the official school website
- 5 different other websites that they don&#x27;t tell you about (eg athletics website)
- 22 (!) Instagram accounts for various school clubs &amp; sports
- district website &amp; calendar<p>Oh, and if you call the school office, they say &quot;look at the website&quot; or &quot;that&#x27;s handled by a different department.&quot; The whole system is just insane.<p>So I did something about it. With AI. Last weekend.<p>- Scraper: indexes all the public PDFs, GDocs, websites and Instagram accounts they have 4x per school day. It even transcribes images, because yes, they announce important deadlines over Instagram... as images!!! &lt;dies inside&gt;
- MCP server: makes all of the above available to any AI.
- Chatbot: Gemini 3.7 Flash with a &quot;PG-13 Dave Chappelle&quot; persona that answers legit questions helpfully and cracks jokes. All answers are grounded in the MCP and web search as a fallback. Trolls you if you go off-topic. Threatens to lookup your IP and report you to the principal if you ask for homework help. Prompt is loaded with deep research on the school and surrounding area as a fodder for jokes.<p>It&#x27;s awesome. I&#x27;m proud. And finally I know what the hell is going on with my kid&#x27;s school!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49569854)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T20:29:35Z

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
