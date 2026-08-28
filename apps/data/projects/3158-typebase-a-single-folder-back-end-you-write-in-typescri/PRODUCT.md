---
id: "3158"
slug: typebase-a-single-folder-back-end-you-write-in-typescri
title: Typebase – A single-folder back end you write in TypeScript
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447178"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [TypeScript, oRPC, Drizzle, better-auth, Neon, Vercel, Cloudflare Workers, Deno Deploy]
---
# Typebase – A single-folder back end you write in TypeScript

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A back end you write as a `typebase/` folder of TypeScript files inside the repo you already have — schema and server functions in TS, end-to-end typed client calls, built-in auth, deployable with one CLI command to Vercel, Cloudflare Workers, or Deno Deploy (Neon as the database), or generated as code for any other target. Convex-shaped DX without Convex's DB model or realtime-first defaults; Supabase-shaped openness without RLS / SQL authorization.

## Target Users

- TypeScript developers building full-stack apps who want their back end to be a folder in the same repo.
- Developers who liked Convex's "server in your code" shape but want a different database or no realtime defaults.
- Developers who tried Supabase and bounced off using SQL / RLS for authorization.
- Teams that already deploy to Vercel / Cloudflare Workers / Deno Deploy and want their server to land on the same edge.

## Jobs To Be Done

- When I start a new TS app, I want a typed back end in a single folder of my repo, so I do not have to stand up a separate service to get auth and persistence working.
- When I call a server function from my frontend, I want it to look like a local typed function call, so I do not have to maintain client/server type contracts by hand.
- When I deploy, I want one CLI command to push the server to Vercel / Cloudflare Workers / Deno Deploy, so the deploy step is not its own mini-project.
- When I need auth, I want it built in, so I do not have to wire a third-party provider into the same schema and session story.

## Success Metrics

- Adoption: number of repos that contain a `typebase/` folder, downloads of the Typebase CLI / library package, and GitHub stars — the post does not state a target.
- Time-to-first-server-function: how long it takes from `npm init` to a typed server call from a TS client. The post does not quote a number.
- Deploy success rate: share of `typebase deploy` runs that complete without manual steps on each of the three named platforms.

## Pricing & Monetization

The post does not state a price, a paid tier, or a hosted-service fee. Typebase is presented as a library ("a library that gives you…") with a CLI; the poster does not name a monetization model. No pricing can be stated from the source.

## Competitive Landscape

The poster names two competitors by function — Supabase and Convex — and frames Typebase as the gap between them: Convex's DX without its DB model or realtime defaults, Supabase's openness without RLS / SQL auth. The post does not name pricing, market share, or any other tool in the same space; the "landscape" is whatever the reader already knows about those two. Beyond restating that, no specific competitor naming is supported by the source.

## Risks & Open Questions

- Multi-platform deploy drift. Vercel, Cloudflare Workers, and Deno Deploy evolve independently; the CLI and the code generator have to keep up with all three for the "open deploy" promise to hold.
- Type end-to-end typing depends on oRPC's contract, Drizzle's schema typing, and the client's TS config staying in sync; a breakage in any one of them could silently void the "fully typed" claim.
- Built-in auth is `better-auth`; if better-auth's API or scope changes, Typebase's auth story changes with it. The library is one layer above a chosen dependency, and that dependency's trajectory is not Typebase's to control.
- "Generate code for any deploy" risk. If the generated output drifts from the platform-native shape, users get a worse experience than the supported three. Keeping the generated shape close to the supported paths is an ongoing cost.
