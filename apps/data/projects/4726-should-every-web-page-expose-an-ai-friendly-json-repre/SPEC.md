# SPEC.md — Should every web page expose an AI-friendly JSON representation?

## Problem

My website already includes AI-related files such as llms.txt.<p>I&#x27;m considering creating a separate JSON file for every page and article so AI systems can understand the content more easily and accurately. I would reference this JSON file from the page&#x27;s &lt;head&gt; using a &lt;link&gt; tag.<p>The JSON file could contain information such as:<p>Page URL<p>Canonical URL<p>Title<p>Summary &#x2F; Description<p>Main Content (clean article content)<p>Author<p>Published Date<p>Last Updated<p>Entities (people, companies, places, products, etc.)<p>Keywords &#x2F; Topics<p>FAQ<p>...<p>My idea is that AI crawlers could read this structured JSON instead of having to extract the main content from noisy HTML that contains navigation menus, sidebars, ads, comments, JavaScript, tables, and other non-essential elements.<p>I have two questions:<p>Could this approach reduce the chances of AI crawlers misunderstanding a page or extracting incorrect information from HTML, advertisements, tables, comments, or other noisy content?<p>Do you think a page-level JSON file like this could help AI systems better understand a page and potentially improve AI recommendations, citations, or other AI-generated responses in the future? Why or why not?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49542310)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-02T20:46:57Z

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
