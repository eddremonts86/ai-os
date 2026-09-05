---
id: "4184"
slug: a-file-based-router-for-cloudflare-workers
title: "A file-based router for Cloudflare Workers"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509922"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# A file-based router for Cloudflare Workers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

The plugin brings the file-based routing convention a Next.js / Remix developer already knows to a Cloudflare Workers project. Drop a file, the router picks it up; the rest of the Workers build is unchanged.


## Target Users

Developers building Cloudflare Workers who are used to file-based routing from Next.js / Remix / TanStack Start and want the same affordance on Workers. Assumes the reader is comfortable with Vite and Cloudflare Workers.

## Jobs To Be Done

- When I build a Workers project, I want a routes folder so I can navigate by file shape, not by a hand-written handler map.
- When the route set changes, I want the router to update so I do not have to edit a manifest by hand.
- When I deploy, I want the plugin to integrate with the existing Vite / Workers build, not replace it.


## Success Metrics

- Coverage of the file-based routing conventions (index, dynamic, catch-all).
- Number of example apps using the plugin.
- Bundle size overhead of the generated router.


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other Cloudflare Workers routing libraries and file-based routing plugins (Next.js, Remix, SvelteKit). The captured source post positions this plugin around Workers-native file-based routing, but the precise list of named incumbents is not stated in the source text.


## Risks & Open Questions

- File conventions differ subtly across frameworks; copying Next.js too literally will confuse Workers developers.
- Cloudflare Workers' runtime evolves; the plugin has to track the runtime, not just the file shape.
