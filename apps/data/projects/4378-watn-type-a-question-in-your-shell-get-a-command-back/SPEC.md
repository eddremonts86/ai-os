# SPEC.md — Watn – type a question in your shell, get a command back

## Problem

When trying to figure out some complex shell command (What&#x27;s the actual incantation of the git command, find or ffmpeg for my usecase?),
i used to use <a href="https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kagisearch&#x2F;ask</a> for some time, which seems to be unmaintained.
Also it tied to openrouter and some predefined model list.
So i set out to build a better version.<p>In the end, the new implementation added some new (maybe unique) features, like pressing CTRL-W in a shell prompt
and having the text being replaced by some proper command to be executed with enter.<p>Here is a quick glimpse of what it looks like the terminal:<p><pre><code>  $ find the top 5 largest files ever committed in this git repository (-&gt; hit CTRL-W &lt;-)
  $ git rev-list --objects --all | git cat-file --batch-check=&#x27;%(objecttype) %(objectsize) %(rest)&#x27; | sed -n &#x27;s&#x2F;^blob &#x2F;&#x2F;p&#x27; | sort -rn | head -n 5
</code></pre>
I&#x27;m curious to hear feedback and maybe someone else does find it useful as well.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49518777)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T06:49:10Z

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
