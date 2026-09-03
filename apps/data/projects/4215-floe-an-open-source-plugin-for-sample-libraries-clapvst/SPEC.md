# SPEC.md — Floe – an open-source plugin for sample libraries – CLAP/VST3/AU

## Problem

I&#x27;m Sam, I make sample libraries (as FrozenPlain). These sample libraries run inside Floe, my audio plugin for Linux, macOS and Windows. It&#x27;s designed for musicians, composers and producers - typically people involved with film&#x2F;TV&#x2F;game scoring or ambient music. I open-sourced it primarily because I&#x27;m very fond of this philosophy and I want to open the door for serving a wider audience than just my own libraries.<p>It&#x27;s totally free, no sign-ups. You&#x27;ll need a DAW. To try it:
- Download and install Floe: <a href="https:&#x2F;&#x2F;floe.audio" rel="nofollow">https:&#x2F;&#x2F;floe.audio</a>
- Download your choice of free packages: https:floe.audio&#x2F;packages#community-packages or <a href="https:&#x2F;&#x2F;www.frozenplain.com&#x2F;product&#x2F;music-box-suite-free" rel="nofollow">https:&#x2F;&#x2F;www.frozenplain.com&#x2F;product&#x2F;music-box-suite-free</a>
- Install the packages using Floe&#x27;s &#x27;Install Package&#x27; button. <a href="https:&#x2F;&#x2F;floe.audio&#x2F;docs&#x2F;installation&#x2F;install-packages" rel="nofollow">https:&#x2F;&#x2F;floe.audio&#x2F;docs&#x2F;installation&#x2F;install-packages</a><p>I&#x27;m curious about HN&#x27;s thoughts regarding the open-source nature, directions I could take for expanding the audience, and the Lua based sample-library it has (<a href="https:&#x2F;&#x2F;floe.audio&#x2F;docs&#x2F;develop&#x2F;develop-libraries" rel="nofollow">https:&#x2F;&#x2F;floe.audio&#x2F;docs&#x2F;develop&#x2F;develop-libraries</a>). Thanks.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49507908)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T10:11:39Z

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
