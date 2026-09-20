# SPEC.md — Gote – a CLI note-taking management tool for plain Markdown

## Problem

Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;banorton&#x2F;gote" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;banorton&#x2F;gote</a><p>I built a note taking management tool to use at work for quick note taking and searching. It is intended to be quite minimal. Another focus was to have lots of shortcuts and to keep things close to the homerow for ergonomics and speed.<p>Notes are just markdown files in whatever directory you point it at. The only thing it keeps elsewhere is an index in ~&#x2F;.gote. If you stop using it you still have all your notes.<p>Tags go on the first line of the note, separated by periods, like .project.urgent.work. No frontmatter.<p>Search is built into the binary, BM25 with stemming, so there&#x27;s no ripgrep or fzf to set up. gote s meeting searches titles and content, gote s -t .work filters by tag, gote s -w 2412 pulls up notes from December 2024.<p>Most commands have a two letter version that combines a list with an action. ro is recent + open, sv is search + view, tp is tag + pin. When results come up you pick one with a home row key instead of arrows or numbers.<p>Binaries for mac&#x2F;linux&#x2F;windows are on the releases page, or go install github.com&#x2F;banorton&#x2F;gote@latest if you have Go.<p>The goal of this project was not to learn something new or build something impressive. I simply had a need and filled it with a vibe-coded solution. I have been using it for about a year now and it does more or less exactly what I wanted. So I thought I&#x27;d share in case others are interested in using it, contributing to it, or want to use it as a reference for their own solution.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49600397)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T16:55:46Z

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
