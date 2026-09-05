# SPEC.md — Learn/Practice Sudoku strategies web app

## Problem

So, I wanted to get better at Sudoku puzzles, and I watched a lot of strategy videos, but I just could not grok them.<p>Also I installed a bunch of free Sudoku games on my phone and got very (and I mean very) annoyed by the un-dismissible ads and calls to actions.<p>So, I vibe coded an ad-free Sudoku app for the browser (a kind of PWA that plays on a phone browser too).  The AI helpfully came up with a system for ranking Sudoku puzzle difficulty (by which strategies are required to solve).  I&#x27;m at the point where Easy is doable, and Medium does have some challenge to it, but the Hard, Harder, Hardest puzzles required me to use strategies I have not mastered yet.<p>So, I added a Learn button, a show-me how button, and a notes feature.   My wife and daughter gave feedback, so I fixed some usability issues (I am no UX designer).<p>Anyway it is open source, MIT licensed, with a link to the repo in the footer.<p>Posting this to see if anyone finds useful the Learn, Show-me, and Notes features (including having the game fill in the notes for you if you want).<p>I do not consider this a one-shot code-an-app project, because it went through many iterations and some user testing.  If you think this is AI slop, let me know why.  I found it useful for the prolem I was trying to solve.  I have gotten better&#x2F;faster at solving hard sudokus.<p>Also, it is not &quot;judgy,&quot; i.e., it counts mistakes but does not kick you out after 3 strikes.<p>It also tracks progress and an interrupted game in local browser storage.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49565298)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T14:35:45Z

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
