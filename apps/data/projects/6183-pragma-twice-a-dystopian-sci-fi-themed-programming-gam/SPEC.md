# SPEC.md — Pragma Twice – A dystopian sci-fi themed programming game

## Problem

Hey HN, I&#x27;m Bryan. I released Pragma Twice earlier this week in anticipation for Steam&#x27;s &quot;Programming Fest&quot;. Pragma Twice is a programming puzzle game in the same vein as Untrusted (<a href="https:&#x2F;&#x2F;untrustedgame.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;untrustedgame.com&#x2F;</a>). You have to write real JavaScript code to incrementally improve your playable character&#x27;s &quot;kernel&quot; over the course of the game. Beating levels autonomously (without keyboard inputs) reveals a competitive time&#x2F;code golf aspect to the game.<p>I started developing Pragma Twice over 4 years ago after playing Untrusted and loving it. It took so long to develop because I&#x27;m not a full time game developer... between my actual job, my kids, and my own self-motivation, it&#x27;s taken a lot longer than I originally hoped to get this game shipped! It&#x27;s definitely what you might call a passion project. Anyway, I plan to keep iterating on it, so give it a spin and let me know what you think!<p>A few technical details&#x2F;challenges:<p>- The game was originally written in vanilla JavaScript, but I later converted it to TypeScript (which had an astonishing ROI)<p>- Uses PixiJS for the graphics and a custom game engine built around Web Workers + SharedArrayBuffer for sandboxing and guarding against things like infinite loops<p>- The web version is hosted on GitHub Pages, which was challenging because of the SharedArrayBuffer requirement (I use <a href="https:&#x2F;&#x2F;github.com&#x2F;gzuidhof&#x2F;coi-serviceworker" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;gzuidhof&#x2F;coi-serviceworker</a> to work around this)<p>- The linux&#x2F;windows versions use Electron<p>- Uses CodeMirror for in-game editor&#x2F;console<p>- Levels built with LDtk<p>- Automated game testing with Puppeteer<p>Steam: <a href="https:&#x2F;&#x2F;store.steampowered.com&#x2F;app&#x2F;3528840&#x2F;Pragma_Twice&#x2F;" rel="nofollow">https:&#x2F;&#x2F;store.steampowered.com&#x2F;app&#x2F;3528840&#x2F;Pragma_Twice&#x2F;</a><p>Dev Notes: <a href="https:&#x2F;&#x2F;www.bryanpg.com&#x2F;games&#x2F;pragma_twice" rel="nofollow">https:&#x2F;&#x2F;www.bryanpg.com&#x2F;games&#x2F;pragma_twice</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49643036)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T13:00:51Z

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
