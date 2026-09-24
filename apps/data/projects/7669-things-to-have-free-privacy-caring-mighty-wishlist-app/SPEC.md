# SPEC.md — Things To Have – free, privacy caring, mighty wishlist app

## Problem

Things To Have is a wishlist app. I started working on it in 2022 as a pet project for my friends, then turned it into a serious app in 2024.<p>I built it because I disliked other such apps – they were either too ephemeral, limited to a specific use case, or felt like a TV shop.<p>I wanted to build an app that would be calm and would cater to thoughtful buyers, collectors, and enthusiasts. I also didn&#x27;t forget about birthdays, so reservations and other birthday QoL are present.<p>As it always was a hobby&#x2F;passion project, I wasn&#x27;t bothered by &quot;time to market&quot; and overengineered a lot of things. For example, it ships transparency-aware blurhash for each image, has many unadvertised Drag&#x27;n&#x27;Drop interactions like MacOS has, 1001 ways to upload files into a form, etc.<p>It is also powered by a quirky stack: it is running on Cloudflare Workers and D1, and the code is written using Hono (<a href="https:&#x2F;&#x2F;hono.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;hono.dev&#x2F;</a>) and Vue, tied together by a custom Inertia (<a href="https:&#x2F;&#x2F;github.com&#x2F;brachkow&#x2F;hono-inertia" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;brachkow&#x2F;hono-inertia</a>) adapter. I also use better-result (<a href="https:&#x2F;&#x2F;better-result.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;better-result.dev&#x2F;</a>) to bring sane errors to JavaScript. All this results in a scalable, cheap, and extremely easy way to write full-stack apps, which feels like old-fashioned MVC.<p>I believe my app stands out from both established apps and beige vibecoded competitors and is worth your try. And if not, I hope you find the listed tech fun at least...

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49747847)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T22:57:08Z

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
