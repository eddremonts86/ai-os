# SPEC.md — Rokz: a browser port of a 1990 ASCII dungeon crawler

## Problem

For those younger than me, Kroz was Apogee&#x27;s first game, a text-mode dungeon crawler from 1987. Apogee released the Turbo Pascal source under GPL in 2009.<p>I ported the 1990 episode (Lost Adventures of Kroz) to the browser. No dependencies typescript.<p>Some interesting tidbids I learned:<p>The game&#x27;s clock is its sound :-)<p>Turbo Pascal&#x27;s delay() blocks, and the sound effects are built out of delays, so a footstep is an 8 ms tone, 120 ms of silence, another 8 ms tone. That silence is the turn. You can&#x27;t outrun Kroz by mashing keys because every move costs the length of its own beep. In the port a square-wave oscillator reproduces this (no samples etc), and playing a sound returns its duration whether or not it is audible.<p>DOS Kroz asked at startup: &quot;Slow or Fast PC&quot; - and repeated sound chunks according to this.<p>All the hidden stuff, easter eggs, and even most of bugs are reproduced. You can play it just like original. Oh, one thing - instead of ASCII letters I used tiles (from Dungeon Crawl Stone Soup (CC0)).<p>I started with Lost Adventures because Apogee&#x27;s source was most complete. I will continue with rest of the episodes.<p>AI Disclose: I used Claude to help me extract levels from the Pascal source and to test it by taking over chrome session and measure miliseconds :D<p>You can play it here:<p><a href="https:&#x2F;&#x2F;taler.pl&#x2F;rokz&#x2F;" rel="nofollow">https:&#x2F;&#x2F;taler.pl&#x2F;rokz&#x2F;</a><p>source code here: <a href="https:&#x2F;&#x2F;github.com&#x2F;htaler&#x2F;rokz" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;htaler&#x2F;rokz</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49616059)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T19:55:20Z

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
