# SPEC.md — Freeform – One click shareable AI generated apps

## Problem

TLDR: Curious if YC startup requests are a valid take, so I built freeform in a weekend.<p>Storytime: I’ve been working on a startup for a while (another context layer startup) and one night while I had One Piece playing in the background and I was going through YCs request for startups list. I was watching the videos and reading the transcripts when two of them particularly stood out to me: cloud for small apps and shareable apps. Specifically the quote “AI hasn&#x27;t had its multiplayer moment yet”. I had an idea floating in my head for a collaborative app which I thought would be nice to have and haven’t seen anyone implement anything like it yet (maybe so, I live under a rock). So having a free weekend and a claude pro subscription I started building Freeform. I didn’t count how many hours it took overall but it was about ~4.5 days total. I figured I should post about it since I’m curious if YCs startup direction is… well.. market driven. Anyway, this isn’t a reflection of YCs predictions obviously but more so a loose experiment of my interpretation and implementation of said ideas.<p>Application: Freeform. What is it? I’d loosely describe it as an ai canva since a lot of the direct output is design driven and based on what you see. However, I think the functionality exceeds that as each applet is its own sandboxed environment with persistent storage. This and being able to inject your own api keys or just random links from the web (ie unsplash) results in some pretty interesting creations. The core component I wanted was sharing and collaboration, so I designed the entire idea around sharing links, previewing, and simultaneous prompt based collaboration with versioning. Anyway, try it out I hope you like it :)<p>Try it here: <a href="https:&#x2F;&#x2F;sharefreeform.com" rel="nofollow">https:&#x2F;&#x2F;sharefreeform.com</a> 
Some stuff I made:<p>A product page with stripe integration on checkout: 
<a href="https:&#x2F;&#x2F;sharefreeform.com&#x2F;a&#x2F;d0e55aff-8aec-45dc-9874-5dc1b943afa8" rel="nofollow">https:&#x2F;&#x2F;sharefreeform.com&#x2F;a&#x2F;d0e55aff-8aec-45dc-9874-5dc1b943...</a><p>A record player that plays midi and itunes music:
<a href="https:&#x2F;&#x2F;sharefreeform.com&#x2F;a&#x2F;661d308e-1751-49c3-bd68-f7a58c051a03" rel="nofollow">https:&#x2F;&#x2F;sharefreeform.com&#x2F;a&#x2F;661d308e-1751-49c3-bd68-f7a58c05...</a><p>A brainrot card I’m sending to my friends:
<a href="https:&#x2F;&#x2F;sharefreeform.com&#x2F;a&#x2F;e31a5954-dcd4-4821-8cdf-c1dc6d2ffddc" rel="nofollow">https:&#x2F;&#x2F;sharefreeform.com&#x2F;a&#x2F;e31a5954-dcd4-4821-8cdf-c1dc6d2f...</a><p>PS: I didn’t put a lot of credits to the llm or sandbox pool so if you run into any issues (or bugs) just shoot me an email here: hello@sharefreeform.com
Also if you decide to make something feel free to email it to me or post it in the thread  Thanks!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49725268)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T11:43:17Z

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
