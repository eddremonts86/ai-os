# SPEC.md — Claude's innerworkings: turn 170 costs 2.1x turn 20, over 14,640 turns

## Problem

On Aug 26, this happened in my CoWork session:<p>Tom: I can&#x27;t help but think we can do some other cool stuff with this knowledge of Claude&#x27;s innerworkings regarding sessions, etc. Any thing sticks out to you that I haven&#x27;t captured&#x2F;asked for yet?<p>Claude: Six: the scaffolding trend (the cost of our own rules, creeping 87,999 → 92,619 → 93,809 across three seats), the review share of the wall clock (the thesis measured), the session aging curve (when a fresh seat is cheaper), before&#x2F;after receipts on process changes, model economics, and a crash watchdog reading both records.<p>Four days later, we analyzed 144 sessions, 14,640 turns. The facts showed us that past turn 141, a turn costs 2.1x what a turn cost in the same session&#x27;s first twenty. <a href="https:&#x2F;&#x2F;my-status.app&#x2F;stats#aging" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;stats#aging</a> The worst offenders were our own batch sessions, so we stopped batching. Wanna see your own curve? The script is public: <a href="https:&#x2F;&#x2F;github.com&#x2F;lordbron&#x2F;mystatus-samples&#x2F;tree&#x2F;main&#x2F;claude-session-aging" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;lordbron&#x2F;mystatus-samples&#x2F;tree&#x2F;main&#x2F;claud...</a><p>What we do is our own flavor of &quot;one thinking session, short task sessions&quot; to better utilize my plan. I kept running out of Fable usage and had about half my usage leftover for Opus.<p>But this only happened because we wrote a script to surface the data to us. (Granted, our first run found a bug in our script: 46.6M tokens that were really 28.1M. <a href="https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;t33hPWp7zmtnAE5G&#x2F;u&#x2F;d2ba812d-13bb-4ade-8480-aabc7d9be6ed" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;t33hPWp7zmtnAE5G&#x2F;u&#x2F;d2ba812d-13bb-4ad...</a>)<p>This peek into the innerworkings of Claude fascinated me, so we kept counting: the standing context re-read every turn (114,133 tokens on the hub seat <a href="https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;6iYmualpgrZ6_C9u&#x2F;u&#x2F;2f4d4498-dcdb-43a5-84f9-7e3eb68416f1" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;6iYmualpgrZ6_C9u&#x2F;u&#x2F;2f4d4498-dcdb-43a...</a>, 108,213 on a spoke <a href="https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;Zsse45gEDBTQ6mOL&#x2F;u&#x2F;c3f8bca2-b7f9-4bee-b313-442552fb9753" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;Zsse45gEDBTQ6mOL&#x2F;u&#x2F;c3f8bca2-b7f9-4be...</a>) and the human&#x27;s share of the clock (67% <a href="https:&#x2F;&#x2F;my-status.app&#x2F;stats#review" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;stats#review</a>).<p>The best part of all this to me: every feature moving forward comes with receipts. Take the aging curve: it cost 2.6 person hours and $8.23 in tokens at list rates. <a href="https:&#x2F;&#x2F;my-status.app&#x2F;receipts" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;receipts</a><p>We have a whole bunch of stats for you to nerd out on if you want. It&#x27;s a bit overboard, but new things pop up as other things come down. <a href="https:&#x2F;&#x2F;my-status.app&#x2F;stats" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;stats</a><p>I know we&#x27;re not the only ones geeking out about stuff like this. What else have you all measured, and what surprised you in the findings?<p>Oh and if you wanna know what the heck the project was originally built for: it&#x27;s public task tracking, for things like a 20 mile run <a href="https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;EdiPcBGBZxcGkr9x" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;EdiPcBGBZxcGkr9x</a> or which app versions are supported <a href="https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;i3jQU03T46e0hrsk" rel="nofollow">https:&#x2F;&#x2F;my-status.app&#x2F;t&#x2F;i3jQU03T46e0hrsk</a>. The experiment behind the project is: Can a human and Claude build something new, splitting the work along what each excels in?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49552931)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T16:43:21Z

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
