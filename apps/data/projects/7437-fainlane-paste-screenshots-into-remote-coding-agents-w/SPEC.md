# SPEC.md — FainLane – Paste screenshots into remote coding agents with Ctrl+V

## Problem

Hi all,<p>I run all my CLI coding agents in a remote cloud VM and not being able to paste screenshots has been my only annoyance.<p>So I built this small (2mb) native macOS app that helps me paste screenshots into remote coding agents with Ctrl+V, same as pasting images on coding agents running on my local mac. The app automatically detects the remote host based on the focused window and uploads the image over SSH inside the `~&#x2F;.cache&#x2F;fainlane&#x2F;uploads&#x2F;` directory on the remote machine and then inserts the path at cursor.<p>The app supports Ghostty, iTerm2, and Apple Terminal. Works even if you have multiple remote hosts you connect to. And works if you use tmux as well.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49728437)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T15:21:50Z

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
