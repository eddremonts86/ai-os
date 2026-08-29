---
id: "3684"
slug: substack-and-x-and-reddit-and-crypto-pow
title: Substack and X and Reddit and Crypto = POW
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485378"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [SvelteKit, TypeScript, PostgreSQL, Drizzle ORM, Nostr relays, eCash (XEC) node integration, Coolify, Docker]
---
# Substack and X and Reddit and Crypto = POW

## Problem

The poster's "Show HN" headline asserts that Substack (long-form publishing), X (microblogging), Reddit (community discussion), and a crypto token together equal "POW" — Proof Of Writing — and links to https://www.proofofwriting.com/. The site that the URL resolves to is a content community where members publish article-length posts, embed short-form discussion, run weekly leaderboard games (eFlappy Bird, fantasy football) and tip each other in XEC (eCash) tokens; the platform monetises posting through per-post fees and runs a 100K XEC bug bounty. The pain this surfaces is that a writer who wants long-form reach (Substack), short-form amplification (X), threaded discussion (Reddit), and an on-platform incentive economy (token tips) currently has to assemble four disconnected tools and reconcile their audiences by hand.

## Objective

Ship a single web app that bundles the three content shapes the poster names (long-form article, microblog, threaded discussion) with a token reward system, so a writer can publish once and reach long-form readers, microblog followers, and community commenters inside one product, and so tips paid in a small-denomination crypto token can route from reader to writer without leaving the platform.

## Target Users

- Primary: independent writers and small newsletter operators who today publish on Substack and amplify on X but cannot easily reward commenters or run community games on the same surface.
- Secondary: crypto-native micro-communities that already use XEC / eCash tips and want a low-friction content surface tied to their existing token economy rather than a generic WordPress.
- Tertiary: readers who want a single feed of long-form posts, short posts, and discussion threads instead of three separate apps.

## MVP Scope

- Three post types in one editor: article (Substack-style long-form), microblog (X-style 280-char post), and thread (Reddit-style nested replies on any other post).
- One unified feed per user, sortable by Latest, Top (token tips weighted), and Following.
- XEC token wallet per account, custodial in v1, with deposit address shown and tip button on every post; tip modal records on-chain txid and shows confirmation after one block.
- Per-post fee in XEC, set by the poster; the platform's treasury takes a fixed bps cut of tips (not of the posting fee).
- Weekly leaderboard surface for any opt-in community game (eFlappy Bird-style), with 25K XEC prizes for the top 10 — implementing the leaderboard loop the source site already runs, not the game itself.
- Single-user account model, no multi-tenant orgs in v1; the same identity writes articles, microblogs, comments, and tips.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The token is fixed at XEC (eCash) — switching to a different UTXO chain would invalidate the existing tip flow and is out of scope.
- Onboarding must work for users who already hold XEC elsewhere; deposit flow must show the eCash address and accept any standard XEC transaction.
- Posting fees must be charged in XEC, not in fiat, to keep the unit of account consistent with tips.
- Self-host on a single Coolify instance with PostgreSQL; no managed Postgres in v1 because the custodial wallet is the load-bearing piece and it should live next to the wallet service for audit clarity.
- No fiat on-ramp in v1 — users bring their own XEC, mirroring how the source site operates today.
