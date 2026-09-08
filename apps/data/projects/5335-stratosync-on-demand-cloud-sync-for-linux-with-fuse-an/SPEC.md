# SPEC.md — Stratosync – on-demand cloud sync for Linux with FUSE and rclone (BETA)

## Problem

I came across Stratosync recently and thought it was worth sharing here. I’m not affiliated with the project.<p>It seems to be trying to fill a gap that Linux still has: a decent “files on demand” style cloud sync client, where the filesystem is mounted normally but file contents are only downloaded when needed instead of mirroring everything locally. One can also pin files to keep them in sync.<p>Stratosync is written in Rust, uses FUSE3 for the filesystem layer and rclone for cloud backends, so it should work with services like Google Drive, OneDrive, Dropbox, S3, Nextcloud, SFTP, etc.<p>From what I can tell, it also has some fairly ambitious sync semantics: local caching, background uploads, offline pinning, selective sync, version history, and conflict handling that attempts 3-way merges for text files and otherwise keeps both versions.<p>It’s still marked as beta, so probably not something to trust blindly with irreplaceable data yet. Or at least one should have a good backup strategy in place.<p>The project doesn’t seem to have much visibility yet. I figured posting it here might get it some useful testing, feedback, contributors, or simply enough attention to help keep development going.<p>Curious if anyone here has tried it, or has experience with similar FUSE-based sync systems.<p>Notes on AI:
I could see the code is written with AI assistance and have not dug deeper to evaluate sloppiness nor am I able to do so in rust. Also this post was written with use of AI but I have read it all (and adapted where necessary) so hopefully it does not appear as slop.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49584540)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T08:54:42Z

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
