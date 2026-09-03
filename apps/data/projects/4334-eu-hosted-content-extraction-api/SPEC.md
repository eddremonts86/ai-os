# SPEC.md — EU-hosted content extraction API

## Problem

I built Danubia, a web scraping and content extraction API, hosted in the EU.<p>Why: I used to build crawler infrastructure for a search engine company. I wanted to apply my knowledge to building a clean text extraction API, in part because was it fun to do (why else do we program things, if not for fun?) and in part because I felt I could build something <i>good</i>: a scraping API, with genuinely good content extraction, hosted in the EU, and no subscription needed to use it.<p>The thing does this:<p>You give it a URL, and it gives you back clean markdown (or HTML, or plain text), no ads, no boilerplate. You can do that on-demand, or you can do that in batch. If you do it in batch, you save credits.<p>The whole thing is backed by a shared crawling layer, which is capable of enforcing politeness (concurrent downloads, robots.txt filtering, crawl delay and retries) at scale. The content extraction layer is a library which I built from scratch. I used Trafilatura as a starting point but rewrote it so I could own the extraction process and improve it continuously. I run a benchmark of my extraction lib against Trafilatura, Readability, Turndown, and Firecrawl and try to do match if not beat them. The tech stack is Typescript + Effect.<p>For now, I&#x27;m offering free credits to anyone who would like to try it. In the future, I&#x27;d like to offer paid credits top-up. No subscription.<p>I am in a validation phase, so I&#x27;m not charging for credits. Anyone who signs up get 500 credits immediately, no credit card needed. I only wish to collect some feedback. If you build something with Danubia, message me and I will give you more credits. I&#x27;m also really curious to know what you&#x27;re building!<p>I also have ideas for the next steps: I don&#x27;t want to stop at clean text extraction, I want structured data extraction too and I&#x27;m already working on it

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49521632)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T13:19:49Z

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
