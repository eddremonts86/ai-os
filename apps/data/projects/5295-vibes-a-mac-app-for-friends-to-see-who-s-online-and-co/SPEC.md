# SPEC.md — Vibes – A Mac app for friends to see who's online and coding

## Problem

Hi HN, I built Vibes because I wanted a small sense of company while working on my own projects.<p>It’s a native Mac app that shows which friends are online, what they’ve chosen to put in their status, and a summary of their day’s Git activity. You pick local repositories and connect with friends through invite links. There are orbit and list views, plus optional music and weather sharing.<p>The idea is to glance over and see that a friend is around building something too.<p>Git scanning happens locally. Source code, file contents, repository paths, branch names, and commit messages aren’t uploaded. You choose what to share, the privacy page explains what goes through the relay, including repo names and commit fingerprints used for counting across devices.<p>It’s open source under MIT: <a href="https:&#x2F;&#x2F;github.com&#x2F;marcus&#x2F;vibes" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;marcus&#x2F;vibes</a>. Currently it requires Apple Silicon and macOS 26 or newer, it&#x27;s SwiftUI.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49582247)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T00:42:22Z

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
