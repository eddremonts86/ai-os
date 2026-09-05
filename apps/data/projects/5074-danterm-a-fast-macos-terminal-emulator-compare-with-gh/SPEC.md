# SPEC.md — DanTerm – a fast macOS terminal emulator (compare with Ghostty, iTerm2)

## Problem

danterm started out as a small AppKit wrapper around libghostty so I could get vertical tabs.<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;danneu&#x2F;danterm" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;danneu&#x2F;danterm</a><p>About 3-4 weeks ago, I decided to replace libghostty with my own Swift terminal engine implementation, and the whole project is just Swift with no third-party deps -- only Apple&#x27;s swift-collection for a Deque impl.<p>I started with a naive correctness implementation that passed third-party tests, and then I incremented to the optimized release of today with things like a packed byte arena for scrollback that grows on demand.<p>The result is that it&#x27;s an 8 MB application that sits at 52 MB with 10 empty tabs open and grows to just 250 MB when those tabs are filled with 10k lines each. (kitty: 240 -&gt; 790 MB, ghostty 1.3: 780 -&gt; 1400 MB). It also has the best pty throughput as measured by kitty&#x27;s `kitten __benchmark__ --render`.<p>Perhaps most interestingly is that this project is my latest experiment in how to use rigor to automate high-quality software with LLMs. I use things like ADRs, a docs&#x2F;research&#x2F; system, a review&#x2F;revise cycle on plans, and multi-pass workflows to pay back debt and find code improvement opportunities.<p>For example: <a href="https:&#x2F;&#x2F;github.com&#x2F;danneu&#x2F;danterm&#x2F;blob&#x2F;749942ffa1198f520c8b752c7af6caab7ae7ce0b&#x2F;docs&#x2F;scratch&#x2F;2026-08-26-improvement-audit.md" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;danneu&#x2F;danterm&#x2F;blob&#x2F;749942ffa1198f520c8b7...</a><p>This project has put yet more writing on the wall, for me, that most software -- and then all software -- can be fully automated with just a human &quot;taste-maker&quot;.<p>It has some cute features like:<p>- A `danterm &lt;command&gt;` CLI<p>- A replayable pty flight recorder (`danterm tape`)<p>- Usual fare like tabs, panes, themes, search, and a recovery system so that you can close danterm, reopen it, and it reads its prev state from disk. Even has a gimmicky todo system (per pane and per tab).<p>- A semantic model powered by shell&#x2F;agent integrations where you notify danterm things like &quot;command started (vim foo.sh)&quot; and &quot;agent waiting (claude code)&quot;. This seemed a lot more reasonable than trying to cleverly determine the state of the session from the pty stream.<p>- A companion iPhone app that lets me control danterm remotely over Tailscale<p>- A reusable Swift terminal engine that compiles on Linux (for fun, I started a gtk4 frontend)<p>Anyways, I hope it&#x27;s interesting. It was a lot of work and it&#x27;s my daily driver terminal.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49567153)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T16:55:14Z

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
