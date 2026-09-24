# SPEC.md — Claude Desktop Silently Associates with Common Files

## Problem

v1.44121.1 2026-09-02
&gt; Added Claude to the “Open with” menu for common work files, including spreadsheets, PDFs, Word and PowerPoint documents, text files, and images, on macOS and on Windows (Microsoft Store and MSIX installs).<p>I don&#x27;t recall I ever approved anything, somehow the Claude app associate itself with some common formats like .json, .csv, .markdown, .rtf, .docx, etc. on my Windows 10 machine, even though I already have Cursor, Notepad, New Notepad App, LibreOffice... that can handle these files and associated.<p>I am not sure how this happened and how would Windows (10) allowed this to happen. Regardless, I don&#x27;t appreciate the move trying to become &quot;the default&quot; at all, considering it&#x27;s a rate-limited, connection-required app that does not really allow the user to directly edit the file.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49741481)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-17T14:38:26Z

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
