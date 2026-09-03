# SPEC.md — Keeplea – photograph everything you want to remember

## Problem

At some point I noticed how many photos I take just to remember something, to come back to it later, when I need it. The packaging of a product I liked, a notice on the door of some government place, small paper documents, screenshots of something that felt important at the time. Well, even the wiring inside the walls during a renovation, photographed &quot;for the future&quot;. All of it lands in the photo gallery next to the &quot;real&quot; photos, and then you almost never come back to any of it, because finding one specific thing in that random stream is just not realistic.<p>Yes, modern mobile OSes categorize photos automatically and let you search the text on them. But the categorization is primitive, like &quot;mountains&quot;, &quot;documents&quot;, &quot;screenshots&quot;, and the thing you&#x27;re looking for isn&#x27;t always written on the photo. The native photo gallery will never find me that photo of the wiring behind the kitchen wall. There&#x27;s no text on it, and &quot;wiring&quot; is not a category.<p>So the idea was a mobile app where all these utility photos go, and I don&#x27;t have to maintain them in any way - automatic categorization, with semantic search on top.<p>Give it a try and let me know what you think:<p>Website: <a href="https:&#x2F;&#x2F;keeplea.app" rel="nofollow">https:&#x2F;&#x2F;keeplea.app</a>
Get the app: <a href="https:&#x2F;&#x2F;get.keeplea.app" rel="nofollow">https:&#x2F;&#x2F;get.keeplea.app</a><p>So far it&#x27;s all pretty hard. No users yet - an app like this has low &quot;search&quot; potential, nobody types this problem into a store search box. But I&#x27;ll keep trying, as they say.<p>Under the hood: KMP, native UI, Firebase, Gemini, Firestore vector search.<p>P.S. Let me say it right away: this app wasn&#x27;t vibecoded over the weekend, as people like to put it these days. Honestly, I hate the term &quot;vibecoding&quot;. It downplays the weeks and months that go into thinking through the idea, the architecture, the experiments, the design, the marketing, etc. The fact that you use AI agents while building doesn&#x27;t mean you slapped something together and spat it into production. Although, true, plenty of people nowadays do exactly that. Well, not me

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49521169)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T12:40:16Z

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
