# SPEC.md — Quickly generate and explain complex shell commands

## Problem

Hi everyone,<p>as I spent a substantial amount of time in the console, even today, i sometimes need to think of some complex combination of git&#x2F;find&#x2F;ffmpeg&#x2F;xargs and friends and so i&#x27;ve been using <a href="https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask</a> for some time.<p>Since it appears to be unmaintained i started my own version (yes, thanks to some LLMs work) and i am quite happy with it.
It appears to have gained a lot more features than i initially thought but there it is.<p>My personal highlights are:<p>- can install shortcuts for bash&#x2F;fish&#x2F;zsh for pressing CTRL-W and having the current prompt replaced with the &quot;answer&quot;<p><pre><code>  $ find all images in this directory
</code></pre>
becomes<p><pre><code>  $ find . -type f \( -iname &#x27;*.jpg&#x27; -o -iname &#x27;*.jpeg&#x27; -o -iname &#x27;*.png&#x27; -o -iname &#x27;*.gif&#x27; -o -iname &#x27;*.bmp&#x27; -o -iname &#x27;*.webp&#x27; -o -iname &#x27;*.svg&#x27; -o -iname &#x27;*.tiff&#x27; \)
</code></pre>
in 1-2 seconds.<p>- there is also a review TUI that explains the commands (which can become complex) or retries with another model<p>In any case, it&#x27;s open source, maybe someone else will find it useful as well.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49656218)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T10:47:12Z

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
