# SPEC.md — Gescom MiniDisc Runner – 88 tracks, 88! possible orders

## Problem

NOTE: For a full backstory on this project, please see my blog post here which explains the absurd mathematics behind this unique music album. I hope you enjoy it!<p>Blog Post: <a href="https:&#x2F;&#x2F;ei3lh.eu&#x2F;2026&#x2F;09&#x2F;13&#x2F;gescom-minidisc-and-mind-boggling-mathematics&#x2F;" rel="nofollow">https:&#x2F;&#x2F;ei3lh.eu&#x2F;2026&#x2F;09&#x2F;13&#x2F;gescom-minidisc-and-mind-bogglin...</a><p>Hello!<p>I made a small Python program to solve a completely unnecessary problem: listening to Gescom&#x27;s 1998 &#x27;MiniDisc&#x27; album in every possible order.<p>The album has 88 pieces, which gives us:<p>88! = 1.8548264225739844 × 10^134<p>possible sequences.<p>Obviously, making a playlist containing all of them would incur a slight storage problem!<p>So instead, &#x27;Gescom Runner&#x27; generates one 88-track M3U at a time, hands it to VLC (or player of your choice), waits for the playlist to finish, records where it got to, and generates the next permutation.<p>It can resume after rebooting, jump directly to a particular permutation, and doesn&#x27;t need to store the astronomical number of playlists.<p>The complete journey would take approximately 2.37 × 10^130 years, so I&#x27;m reasonably confident nobody will be filing a completion report anytime soon!<p>For transparency, I used AI and Wolfram to help write and document the code, and I&#x27;ve included that disclosure in the repository readme.md.<p>The music isn&#x27;t included — you provide your own legally obtained copy.<p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;EI3LH&#x2F;Gescom-MiniDisc-Runner" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;EI3LH&#x2F;Gescom-MiniDisc-Runner</a><p>I am no mathematician or hardcore developer, just a (very amateur) curious hobbyist, but I am particularly interested in whether there are interesting ways to improve the permutation generation, playback handling, or the general absurdity of the project.<p>Thank you!<p>EI3LH

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49724628)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T10:52:35Z

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
