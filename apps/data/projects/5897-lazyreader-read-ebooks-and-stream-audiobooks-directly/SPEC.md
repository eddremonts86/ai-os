# SPEC.md — LazyReader – Read ebooks and stream audiobooks directly from your cloud

## Problem

I built LazyReader because I was tired of re-importing the same ebook library whenever I switched devices or reading apps.<p>Most reading apps copy your books into their own storage. LazyReader connects directly to your existing cloud storage, so your books stay where they already are.<p>It supports Dropbox, OneDrive, and Nextcloud. You can browse your library and read EPUBs directly from the cloud, and it now also supports streaming audiobooks directly from cloud storage. So if you have a 1GB M4B audiobook, you don&#x27;t need to download the entire file to your phone before listening.<p>Since the original version, LazyReader has grown into a much more complete reading app:<p>- EPUB and audiobook support
- Library and reading-progress synchronization
- Collections and sorting
- EPUB and audiobook edition linking
- Offline reading and listening
- Offline dictionary
- Word and phrase search
- Notes and highlighting
- Text-to-speech
- Theming
- Multiple cover-enrichment options
- Book metadata editing
- QR-code book sharing
- Interactive&#x2F;choice-driven EPUB support<p>The interactive EPUB support is probably one of the more unusual parts. EPUBs can contain much more structure than a typical linear ebook, so LazyReader can handle branching and choice-driven books as well as conventional EPUBs.<p>The main idea is still the same as when I started it: your books are your files, and your cloud storage is your storage. LazyReader doesn&#x27;t require you to import everything into another proprietary library.<p>&quot;LazyReader on Google Play: <a href="https:&#x2F;&#x2F;play.google.com&#x2F;store&#x2F;apps&#x2F;details?id=com.lindocode.lazyreader">https:&#x2F;&#x2F;play.google.com&#x2F;store&#x2F;apps&#x2F;details?id=com.lindocode....</a><p>Requires an account so your library, reading progress, and cloud-storage connections can be synchronized across devices.<p>I&#x27;d be interested in hearing what people think, especially about the cloud-based approach and audiobook streaming. Happy to answer questions about the implementation or anything else.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49620251)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T02:52:59Z

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
