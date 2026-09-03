# SPEC.md — I wrote a small CLI to inspect and remove Cursor chat sessions

## Problem

Cursor stores chat session history in SQLite but lacks a way to delete individual chat sessions or by folder or repository.<p>After accumulating hundreds of sessions, I needed a way to clean up specific conversations and even chat sessions from specific folders.<p>With that in mind I built a small Python CLI that let you do that.<p>It can be installed with brew:<p><pre><code>    brew install vilaca&#x2F;tap&#x2F;cursor-chat-cleaner
</code></pre>
pip:<p><pre><code>    pip install cursor-chat-cleaner
</code></pre>
by cloning the repo:<p><pre><code>    https:&#x2F;&#x2F;github.com&#x2F;vilaca&#x2F;cursor-chat-cleaner

</code></pre>
For safety there&#x27;s a --dry-run parameter and chat sessions are only deleted when --yes is present in the command.<p>Chats are deleted from the both the database and the file system and there&#x27;s a possibility of doing backups (but no restore command yet).<p>As a bonus there&#x27;s a &#x27;stats&#x27; sub command that shows the models and tokens spent for each chat session.<p>This was exclusively tested in MacOs (Sequoia) with the latest Cursor version but should be fairly simple to port to other operating systems.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49520816)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T12:03:41Z

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
