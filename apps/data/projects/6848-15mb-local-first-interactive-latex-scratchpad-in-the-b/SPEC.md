# SPEC.md — <15MB Local-first Interactive LaTeX Scratchpad in the Browser

## Problem

I am working on a very modular typesetting engine called TeLoX, intended as a superset of the capabilities (of at least) XeTeX and pdfLaTeX, written in Rust. The main goals are modularity and speed (which we know sometimes fight each other unless we try to be principled about it). Today I wanted to demonstrate these diegetic interactive sliders that control values within in LaTeX from the browser (kinda like marimo).<p>This isn&#x27;t meant to be a complete editor like quicklatex and texlyre -- just a tiny playground that loads quickly enough and responds interactively to see how good I can get the typing experience to be. Package support is the weakest link right now so lots of reasonable LaTeX you type up will fail. Increasing coverage fights against fast load times, and so I&#x27;ll add some &#x27;code splitting&#x27; -- I can make the editor dynamically fetch cached blobs for the most common $k$ packages and see how much time that buys me. After I add support for Lua or some other simple expression language, seems like you could make some really beautiful receipts&#x2F;calculators fairly easily.<p>The other interesting thing you&#x27;ll notice is that clicking and dragging on text selects the associated input text really accurately, down to the word. I have an art project that I was working on that was blocked by this exact issue -- being unable to correctly attribute a click back to the exact word that generated it (essentially an interactive storybook, WYSIWYG computational notebook with diegetic inputs). That&#x27;s now unblocked. I wanted to make a choose-your-own adventure game that takes place _in_ a book on the web.<p>This whole thing is quite difficult, but I think it&#x27;s worth it. I know it&#x27;s an ambitious notion to bring arbitrary support for arbitrary LaTeX to arbitrary devices, but it feels like it&#x27;s leading somewhere interesting.<p>Desktop gives the best experience for now, and even still it loads slower than I&#x27;d like at ~2.5 sec on cold boot. I should probably default mobile to view mode. A PWA version, bookmarklet support for typesetting the current page, etc, all possible, not started yet. I&#x27;m most interested in optimizing my in-memory representation first, and if that&#x27;s not enough, I&#x27;d make a lexical dependency tracker for the TeX interpreter under the hood and deal with mutations&#x2F;overwriting in a sensible way, possibly svelte style. Like I said, a lot of work. Sharing now before my semester kicks in and my free time is gone. &quot;Baby steps,&quot; as they say.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49689856)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T23:30:17Z

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
