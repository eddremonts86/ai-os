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

## Problem

The poster tried Supabase and liked how fast it is to spin up a database and auth, but disliked using RLS and SQL for authorization. They tried Convex and loved how the server "lives" in your code, but disliked the database model and the realtime-first defaults. Typebase is the poster's attempt to combine the two: Convex-shaped DX with Supabase-shaped openness.

Concretely, with Typebase you create a `typebase/` folder in your existing repo and write TypeScript files there: `schema.ts` defines database tables and exported server functions that the frontend calls like local functions, fully typed. Auth is built in. One CLI command uploads the server to Vercel, Cloudflare Workers, or Deno Deploy (with Neon as the database), or it generates the code so you can deploy it wherever you want. The library is built on top of oRPC, Drizzle, and better-auth.

## Objective

Give a TypeScript developer a back-end surface that is one folder in their existing repo, with schema and server functions written in TS, end-to-end typing between client and server, and built-in auth — deployable to the edge platform they already use, without locking them into a specific database or runtime. The target is the DX that Convex users like without the parts of Convex (and Supabase) they do not.

## Target Users

- TypeScript frontend developers who want a typed back end in the same repo without standing up a separate service.
- Developers who tried Supabase and bounced off RLS / SQL for authorization.
- Developers who liked Convex's "server lives in your code" shape but want a different DB model or do not want realtime defaults.
- Indie / small-team developers who already deploy to Vercel, Cloudflare Workers, or Deno Deploy and want their back end to live there too.

## MVP Scope

- A `typebase/` folder convention: `schema.ts` for tables, server functions exported as TS that the frontend imports and calls like local functions.
- End-to-end TypeScript typing between client and server (the poster's claim is "fully typed").
- Built-in auth (the library is built on `better-auth`, which is the integration surface).
- A CLI command that uploads the server to Vercel, Cloudflare Workers, or Deno Deploy, with Neon as the database; a second mode that emits the code for a custom deploy target.
- Library foundations: oRPC for the server function wire shape, Drizzle for the database layer, better-auth for auth.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- TypeScript end-to-end is the bar. If a `typebase/` server function call from the client is not fully typed, the library has failed its own pitch; the constraint is that the types must round-trip without manual casting.
- Multi-platform deploy is the openness promise. Vercel, Cloudflare Workers, and Deno Deploy are named as targets; the "generate code for any deploy" mode has to keep working as those targets evolve, so the generator cannot be tightly coupled to one platform's runtime.
- Built-in auth, not bolted-on. `better-auth` is named as the integration surface; if Typebase ships a custom auth layer instead, the constraint is violated and the design pitch changes.
- Database is Neon in the default deploy. The poster names Neon specifically for the hosted deploy path; the open-source / generate-code path must not lock the database engine.
