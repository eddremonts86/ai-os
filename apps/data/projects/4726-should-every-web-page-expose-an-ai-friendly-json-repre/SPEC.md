---
id: "4726"
slug: should-every-web-page-expose-an-ai-friendly-json-repre
title: Should every web page expose an AI-friendly JSON representation?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49542310"
category: ask-hn
date: "2026-09-02"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Should every web page expose an AI-friendly JSON representation?

## Problem

My website already includes AI-related files such as llms.txt.I'm considering creating a separate JSON file for every page and article so AI systems can understand the content more easily and accurately. I would reference this JSON file from the page's using a tag.The JSON file could contain information such as:Page URLCanonical URLTitleSummary / DescriptionMain Content (clean article content)AuthorPublished DateLast UpdatedEntities (people, companies, places, products, etc.)Keywords / TopicsFAQ...My idea is that AI crawlers could read this structured JSON instead of having to extract the main content from noisy HTML that contains navigation menus, sidebars, ads, comments, JavaScript, tables, and other non-essential elements.I have two questions:Could this approach reduce the chances of AI crawlers misunderstanding a page or extracting incorrect information from HTML, advertisements, tables, comments, or other noisy content?Do you think a page-level JSON file like this could help AI systems better understand a page and potentially improve AI recommendations, citations, or other AI-generated responses in the future? Why or why not?

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
