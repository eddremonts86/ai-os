---
id: "2561"
slug: pagesieve-a-web-scraping-browser-extension
title: "PageSieve, a web scraping browser extension"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49320034"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# PageSieve, a web scraping browser extension

## Problem

PageSieve[1] is a browser extension for scraping data from different websites from within your browser. Currently it's Firefox only but I am open to porting it to other browsers if that's something people want.My original motivation for this started with a desire to improve the capabilities of the selectorgadget[2] bookmarklet to support extracting as well as finding selectors.The ideal use case is when some data you need is useful but you don't want to spend the effort of writing a one-off script to extract it especially nowadays when a lot of websites need an entire JavaScript environment to load correctly which complicates scraping.Using this extension means you only need to maintain the selectors for extracting the data and don't need to worry about managing dependencies. As long as the website can be opened in your browser you should be able to scrape data from it using the extension.I have a lot of features planned as well as some rough edges that need smoothing. I use this extension nearly everyday and I hope it can make somebody else's work easier.Take a look and let me know what you think.[1]: https://julius383.github.io/PageSieve/[2]: https://github.com/cantino/selectorgadget/

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
