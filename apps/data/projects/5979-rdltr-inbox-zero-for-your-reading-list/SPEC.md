# SPEC.md — Rdltr – Inbox zero for your reading list

## Problem

Hi HN, for the past few months I’ve been working on a read later app called RDLTR (<a href="https:&#x2F;&#x2F;rdltr.app" rel="nofollow">https:&#x2F;&#x2F;rdltr.app</a>). The whole thing started because I had so many tabs open with stuff I wanted to read, across browsers, Mac, Linux, and iPhone. They cluttered everything and got in the way of other things I had to do.<p>Pocket had just shut down when this idea came up, I looked around, tried Instapaper, Raindrop, Matter, and a few others I forget. They were fine, but they all give you a list that only grows, which is another thing to maintain, and not the model I had in mind. Safari has this Reading List feature where you read something and it drops off the unread list. But it’s Apple only and half worked. What I wanted was inbox zero for reading. Open something, read it, come back, and it’s gone from the queue but still in the archive. You keep going until there is nothing left.<p>Links come in from anywhere. Paste a URL on the page, drag one in, or use the bookmarklet, the Chrome and Firefox extensions, or the Apple Shortcut for the iOS share sheet, plus Vim keys, TL;DR summaries on each link, search across everything you have read or saved, RSS for every list, and it works just as well on the phone.<p>The extensions have a couple of tricks that I use all the time. Shift+DD pulls the article text, cleans it up, and sends it to ChatGPT, Claude, or Gemini in a new tab, so you can ask it anything about what you just read. Shift+AA opens it in the Internet Archive, handy for paywalled sites when you don’t have a subscription.<p>The stack is Bun, TypeScript, HTMX, and SQLite, with SSE so the list updates the moment you save or read something, deployed on a Hetzner VPS.<p>Full disclosure, Claude Code wrote most of it. I still spent a ton of time dogfooding, testing, and polishing the UI until things felt right.<p>Anyway, curious to know what your current setup is for this.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49629747)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T17:06:21Z

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
