# SPEC.md — A translation pipeline that doesn't chew up long HTML pages

## Problem

My site has 1000+ HTML pages. Most of the content is AI-drafted and
poured into templates, so pages tend to be long and full of repeated
structural markup instead of hand-written one-offs.<p>Feed a long HTML page straight to an LLM for translation and it doesn&#x27;t
just mistranslate. It silently drops content. Whole sections vanish,
paragraphs get summarized instead of translated, and the longer the page,
the worse it gets. You get back something that looks like a translation
but is missing half the page, with no warning that anything was lost.<p>Naively splitting the page into smaller chunks, by line or by character
count, doesn&#x27;t fix this. It just cuts through the middle of tags and
sentences, breaking the structure and handing the model fragments that
don&#x27;t mean anything on their own.<p>What actually works is parsing the page into its real structure with
tree-sitter, then chunking along structural boundaries so each chunk is a
complete, meaningful unit and nothing gets silently cut or dropped.
Anything non-translatable, like template logic or layout attributes,
stays out of the model&#x27;s hands entirely. A structural check after
translation catches anything that still slips through, mostly as a
safety net at this point.<p>Ran it for real on 1000+ pages, six languages, output checked by hand.<p>Not pitching anything. Just want to know if this content-loss problem
bites other people translating long pages with LLMs, or if it&#x27;s specific
to how my site is built.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49509437)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-08-31T13:18:59Z

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
