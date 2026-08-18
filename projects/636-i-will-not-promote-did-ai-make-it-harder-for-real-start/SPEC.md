---
id: "636"
slug: i-will-not-promote-did-ai-make-it-harder-for-real-start
title: "I will not promote: did ai make it harder for real startups to win?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vozijo/i_will_not_promote_did_ai_make_it_harder_for_real/"
category: startups
date: "2026-08-15"
tags: [ai-noise, discovery, quality-signals, curation]
tech: [Next.js 14, Postgres + Drizzle, OpenAI embeddings, Resend, Plausible]
---
# I will not promote: did ai make it harder for real startups to win?

## Problem
 do u think ai made real valuable startups win less? was it easier before ai? my thinking is that building got so cheap that everyone can ship something in a weekend now, so the space is full of stuff that looks like a product but isnt solving anything. and the ones actually doing hard, valuable work get lost in that noise, or worse, people assume they just wrapped an api too. on the other hand maybe its the opposite and ai just removed the boring part so good teams move faster than ever, so which one is it in your experience? - is it harder to get attention now than before ai, or easier because u can build and test ideas so fast? - do investors and users still tell the difference between a real product and a thin wrapper? - if u were building before ai and are building now, what actually changed for u? curious what people think, thanks!! submitted by /u/Recent-Ad7093 [link] [comments]

## Objective

Build a curator that surfaces real, value-doing startups in a sea of cheap AI-generated noise, with quality signals that an investor, a buyer, or a curious peer can read in under a minute. The product is a public, browsable directory of vetted startups where each entry is annotated with a "depth score" — a short, defensible reading of how much real work the team has done beyond the surface UI. The MVP is a web app with a curated index, a small editorial workflow, and a transparent rubric that publishes the criteria and the score, so the curation is auditable rather than a black-box "we liked it".

## Target Users

- **Early-stage investor** (angel, scout, pre-seed partner) trying to find startups that have done real work under the AI wrapper — the source's central question.
- **B2B buyer or design partner** who has been burned by AI-wrapped products and wants a vetted list before booking a demo.
- **Journalist or newsletter writer** covering the post-AI startup landscape and looking for under-the-radar teams that match the "actually doing hard work" story.
- **Solo founder of a real, deep startup** who wants a discovery surface that does not lump them in with the weekend wrappers.
- **Curious peer in the r/startups tradition** who watches the space and wants the "front page of the actually-doing-it" feed.

## MVP Scope

- A public directory site with up to 200 vetted startups, each with a one-paragraph "depth score" explaining the rubric verdict.
- A short, transparent rubric (5-7 criteria) that the curator applies; the rubric is published on the site itself, not hidden in a footer.
- A small editorial workflow: a form to submit, a queue for the curator, a published/draft state, and a public edit history so the score is auditable.
- A weekly digest email of new entrants signed up for by readers, with a one-line "why this one" per entry.
- A "depth score" widget that any founder can embed on their own site to show their score; the widget calls back to the directory for the canonical read.
- A queryable tag system so visitors can filter by category, by stage, and by the rubric dimension the startup fares best on.

## Constraints

- The MVP caps the directory at 200 startups; the curator is human, not algorithmic, and the cap is the editorial pace.
- The rubric is published, but the curator's name is not — the curator is the role, not the brand.
- The product does not rank startups by funding or revenue; those are not in the rubric and not in the filter set.
- The MVP does not auto-include any founder who submits themselves; the curator applies the rubric by hand before publishing.
- The product avoids the AI-detection trap: no claim that "this is definitely not AI-generated" is published, because the rubric is about depth, not origin.
