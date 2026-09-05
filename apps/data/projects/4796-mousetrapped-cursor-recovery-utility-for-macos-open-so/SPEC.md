# SPEC.md — Mousetrapped: Cursor Recovery Utility for macOS- Open Source

## Problem

JT from uncSoft here, dev of cyberWriter and Anubis-OSS<p>There is an annoying as heck bug in macOS when you are using a secondary monitor and have other macs around - if you have push through edge to control another mac on and&#x2F;or screen connect active, often times your mouse will get eaten and disappear completely. Especially if you have a VM running in one of them using Screen Connect. Hotkey or Shake the mouse to recover your cursor. This utility was built in 5% Swift, 5% Shell, and 90% Frustration<p>Mousetrapped is free and open source and the release is notarized and signed.<p>Just shake your mouse (wth adjustable sensitivity) or hit ⌃⌥⌘M<p>and your mouse will pop up on your selected or primary display by default - even if it is currently controlling another mac.<p>If you are on a trackpad only setup and using edge-push to control another mac, use the keyboard shortcut to reclaim your cursor (shake works if you are using a mouse, trackpad only HID inputs eat the shake detection on a remote mac)<p>Readme and Release here
<a href="https:&#x2F;&#x2F;github.com&#x2F;uncSoft&#x2F;Mousetrapped" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;uncSoft&#x2F;Mousetrapped</a><p>Homebrew Install -<p><pre><code>    brew install --cask uncSoft&#x2F;mousetrapped&#x2F;mousetrapped
</code></pre>
Or Download and run the signed release<p><a href="https:&#x2F;&#x2F;github.com&#x2F;uncSoft&#x2F;Mousetrapped&#x2F;releases&#x2F;latest" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;uncSoft&#x2F;Mousetrapped&#x2F;releases&#x2F;latest</a><p>So <i>goshdang</i> annoying to lose your mouse into the ether<p><a href="https:&#x2F;&#x2F;imgur.com&#x2F;VsqPylw" rel="nofollow">https:&#x2F;&#x2F;imgur.com&#x2F;VsqPylw</a><p><a href="https:&#x2F;&#x2F;imgur.com&#x2F;TZyZr9H" rel="nofollow">https:&#x2F;&#x2F;imgur.com&#x2F;TZyZr9H</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49542177)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T20:38:01Z

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
