# SPEC.md — Below the Root (1984 game) ported to JavaScript

## Problem

As a kid, I loved this relatively unknown game, Below the Root.  The world-building of the original trilogy of novels from the 1970s, is lovingly carried through into this side-scrolling &quot;platform-adventure&quot;.<p>You can play the IBM PC port of this game online fairly easily, but the quality of the C64 version is much better (non-dithered graphics, better colors, polyphonic sound).  However I found there was a lot of friction to just play the C64 version. So back in 2013, I tried restoring and packaging the C64 version of the game to make it just one step to play. I made a bootable x86 ISO with a Linux unikernel that only ran the VICE C64 emulator, pre-configured to launch the game from some .G64 disk images that a German hacker cracked for me.  Took about 4 months of effort and the results were mid; the game would be running from VMWare boot in 5 seconds but it still required a whole VM, the sound was choppy, and save games were kind of a hassle.  I made a basic webpage and shelved it as a beta experiment.<p>Then, for some reason about a week ago I decided to try again.  But this time I directed Fable and Astra in varying capacities to dissect and disassemble the original .G64 images, produce a spec, and produce a Javascript version equivalent to the original.  They got about 75% mostly autonomously in a single evening.  I&#x27;ve since spent a few tens of hours playing it through, getting bugs fixed, tweaking the interface, improvements, and writing the About page.  I had to have some difficult conversations with Claude and I made some unpopular decisions, but after all that, this is the result and I&#x27;m kinda proud of it.  It&#x27;s not a major project, but then it never should have been.<p>So I just wanted to share this game from my childhood and the process and the result.  Hope other people remember this game fondly and enjoy playing it again!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49686686)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T17:57:12Z

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
