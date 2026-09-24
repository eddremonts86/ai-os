# SPEC.md — Mutt-like mail client with terminal HTML+img, MCP, CRM & scheduled mail

## Problem

For the past few weeks I&#x27;ve been working on my mail client which is behaviorally based on neomutt, but it has a unified inbox&#x2F;archive&#x2F;etc. which is based on a notmuch backend. neomutt was a big pain for me to use with tag based email handling, and it&#x27;s really hard to get it setup and working mail moving, when using a tag based workflow. I still found a bug in maildir flag handling by two days ago, so it turns out I underestimated all the corner cases that exist, but it should be good now. There is a setup function that sets up fcc and the folder structure per account.<p>It does things such as schedule mail with NLP. It&#x27;s fully async, it&#x27;s tabbed, and because the HTML client(which supports images in the terminal) is fully integrated, when you use the MCP, it converts the HTML into useful text rather than feeding full HTML.<p>It validates s&#x2F;mime, but i didn&#x27;t dare implementing gpg support it.<p>There is a lua plugin example for using external file browsers like yazi for attachment selection. It also has a CRM queue that can be used to process new contacts with a pluggable api backend(only hubspot for now).<p>Two things that are still in flux, which is why you would probably consider this alpha software is the config structure. For example I changed the mcp config to be per account permissions, rather than simple permissions, so I can gate each account.<p>There is still a lot to do make this production quality, but I use it as a daily driver now.<p><a href="https:&#x2F;&#x2F;github.com&#x2F;fishman&#x2F;notmutt" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;fishman&#x2F;notmutt</a><p><a href="https:&#x2F;&#x2F;fishman.github.io&#x2F;notmutt&#x2F;" rel="nofollow">https:&#x2F;&#x2F;fishman.github.io&#x2F;notmutt&#x2F;</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49660245)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T15:38:42Z

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
