# SPEC.md — Tech Event Bingo – Track Events in Tech on a Bingo Card

## Problem

With shopify buying TailwindCSS, I thought, &quot;hey, I definetly had this on my tech bingo card.&quot;<p>So then I thought it&#x27;d be fun to build an app to generate these.<p>Put in your X handle (optional), get a card with a permanent URL, download it as a PNG. No signup, no cookies beyond the admin one nobody but me uses.<p>How it&#x27;s built, since that&#x27;s the part HN actually cares about: one Cloudflare Worker with Hono, D1 for storage, Tailwind v4, and workers-og (Satori + resvg) for the PNGs. The PNG rendering was the only hard part. Satori only speaks a subset of flexbox, so the HTML card and the image card are two separate renderers reading from one theme file so they can&#x27;t drift. Cold renders take a few seconds, longer than social crawlers wait, so PNGs are pre-rendered at card creation, stored as blobs in D1, and cached at the edge.<p>The 120ish squares are hand-written. There&#x27;s an admin page where Claude drafts new ones and I approve or reject them one at a time. Roughly a third of its drafts survive.<p>Happy to hear which squares you&#x27;d add. &quot;Cloudflare outage breaks the web&quot; is already on there, in case you&#x27;re wondering whether this site is exempt.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49629447)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T16:47:31Z

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
