# SPEC.md — Tell HN: Screenshots on macOS don't have to be date named files with spaces

## Problem

Do you not like lots of files on your Desktop like Screenshot 2026-09-14 at 6.42.17 AM.png ?<p>mkdir ~&#x2F;Screenshots<p>defaults write com.apple.screencapture location &quot;$HOME&#x2F;Screenshots&quot;<p>killall SystemUIServer<p>https:&#x2F;&#x2F;gist.github.com&#x2F;andrewarrow&#x2F;1584ca32badeb19868dcc3bec657eaa9<p>https:&#x2F;&#x2F;gist.github.com&#x2F;andrewarrow&#x2F;3d61d1c8ecdd3a7e7401bbec481718ca<p>launchctl bootstrap gui&#x2F;$(id -u) ~&#x2F;Library&#x2F;LaunchAgents&#x2F;com.aa.rename-screenshot.plist<p>And now I get:<p>~&#x2F;Screenshots  $ ls<p>basifacial_decidua.png<p>dehull_knopweed.png<p>erlking_walloping.png

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49696875)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-14T13:50:20Z

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
