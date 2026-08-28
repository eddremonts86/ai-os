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

## Tech Stack

- TypeScript as the surface language for both schema and server functions.
- oRPC for the server-function wire shape (the poster names it as a foundation).
- Drizzle for the database layer / ORM.
- better-auth for the built-in auth.
- A CLI that ships Typebase to Vercel, Cloudflare Workers, or Deno Deploy, with Neon as the default managed Postgres.
- A code-generator path for users who want to deploy elsewhere.

## Architecture

A user creates a `typebase/` folder in their existing TypeScript repo and writes `schema.ts` plus server functions in TS. The CLI bundles those into a deploy target (Vercel, Cloudflare Workers, or Deno Deploy) paired with a Neon database, or emits the code so the user can deploy to a target the CLI does not support. Client-side TS imports the server functions and gets fully typed calls; the wire layer is oRPC, the DB layer is Drizzle, and auth is better-auth.

The library is an opinionated assembly of three named dependencies — oRPC, Drizzle, better-auth — wrapped in a folder convention and a deploy CLI. There is no Typebase-hosted runtime; the deploy target is the user's.

## Milestones

- Ship the `typebase/` folder convention with schema and server-function exports.
- Wire the oRPC / Drizzle / better-auth integration so server-function calls are end-to-end typed.
- Land the CLI for at least Vercel, Cloudflare Workers, and Deno Deploy with Neon as the database.
- Add the code-generation path for unsupported deploy targets.
- Validate against the Convex / Supabase framing the poster uses: confirm the DX is competitive in a small, real app on each of the three named deploys.

## Risks

- Multi-platform deploy drift. Vercel, Cloudflare Workers, and Deno Deploy each evolve; the CLI has to keep the deploy path working on all three for the "open deploy" story to hold. If one platform breaks, the user's choices narrow silently.
- Type end-to-end is fragile. The "fully typed" claim depends on oRPC's contract, Drizzle's schema types, and the user's TS config staying aligned; a breakage in any of them can void the claim without throwing.
- better-auth as the auth layer. Typebase's built-in auth is whatever better-auth is; changes to better-auth's API or scope propagate into Typebase.
- "Generate code" parity. If the generated output drifts from the platform-native path on Vercel / CF / Deno, users on unsupported targets get a worse experience than users on supported ones. Keeping the two paths aligned is ongoing work.
