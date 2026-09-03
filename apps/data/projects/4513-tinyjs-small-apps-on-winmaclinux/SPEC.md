# SPEC.md — TinyJS – small apps on Win/Mac/Linux

## Problem

Hi all. I&#x27;m Tarwin. I&#x27;ve been working on TinyJS for about 6 weeks now.<p>I was sick of installing 500mb Electron apps for every little utility. The last straw was Harvest updating from 5mb to 500mb in latest release.<p>Tauri exists (and it&#x27;s great) but I wanted something that was JS first. So I built this on top of txikijs, a tools that includes QuickJS and SQLite already.<p>TinyJS does what it says it does. Small apps that can do almost anything. 100% JS.<p>As part of building a tool like this I also built a lot of example apps, to test and understand required functionality on all three systems. The two I am most proud of are:<p>amp: like winamp, but with a bunch of extra stuff like being able to play tracker files, and internet radio<p>nib: I&#x27;d like to think it will soon be the best editor for documentation (specifically) in markdown<p>I&#x27;ve also experimented with re-wrapping many of the apps I already have downloaded. Some just work (Harvest), some possibly could ie Slack. I know some apps will never make sense to use tinyjs but that&#x27;s ok.<p>I just want to save room on people&#x27;s ever pricier SSDs!
(and make computers fun again with silly things like pigeons that fly across your screen for now reason)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49529062)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T22:25:05Z

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
