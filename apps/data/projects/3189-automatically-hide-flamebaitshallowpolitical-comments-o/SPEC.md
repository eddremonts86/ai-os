---
id: "3189"
slug: automatically-hide-flamebaitshallowpolitical-comments-o
title: Automatically hide flamebait/shallow/political comments on HN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452362"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automatically hide flamebait/shallow/political comments on HN

## Problem

I love HN, but lately I have been sick of reading the same dismissive criticisms over and over again. Along with political arguments that have been litigated to death, people's issues with smooth scrolling on blogs, etc. Many of these comments do not get flagged for whatever reason. So I made a service to automatically classify whether comments violate (a modified form of) the HN guidelines automatically. In addition there's a Chrome extension to collapse these comments (if they violate your score thresholds) so you don't have to read them too. You can also just watch guideline violating comments come in as they are posted on the website.Here's more info on how it works: https://classify.stylometry.net/how-it-works

## Objective

Build a working classification service plus a Chrome extension that lets HN readers collapse comments the classifier flags against (a modified form of) the HN guidelines, with each user able to set their own score threshold for collapse and a separate live view to watch flagged comments arrive as they are posted.

## Target Users

1. Heavy HN readers who are tired of re-reading the same dismissive one-line rebuttals and political back-and-forth that do not get flagged, and want those comments collapsed before they have to read them.
2. Lighter HN readers who want a live "what is being flagged right now" view of the comment stream so they can see what the system is catching without having to set up the extension.

## MVP Scope

- A backend service that ingests HN comments and scores them against a modified form of the HN guidelines.
- Per-user configurable collapse thresholds stored in a user account, not a global flag.
- A Chrome extension that hides or collapses comments whose score is above the user's threshold on news.ycombinator.com threads.
- A live web page on the project domain showing flagged comments as they come in, with a way to scroll back through recent ones.
- The model and prompt behind the classifier, kept as a documented artifact so the user can understand what "modified form of the HN guidelines" means here.
- A short "how it works" page (the existing link target) that explains the pipeline, so curious readers do not have to guess.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Stay within the HN guidelines (modified form), not invent a new moderation philosophy; the classifier is a personal reading aid, not a replacement for the site's own moderation.
- Per-user thresholds, not a single site-wide filter, so users with different tolerances all get something useful.
- Chrome extension targets news.ycombinator.com specifically; do not extend to other sites in the MVP.
- Keep the dependency footprint small: HN comments are public text, the classifier pipeline does not need third-party moderation APIs.
