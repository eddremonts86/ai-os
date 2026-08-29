---
id: "3660"
slug: hi-agent-run-npx-microfeedcli-manage-to-deploy-cms-on-c
title: "Hi agent – run `npx microfeed/CLI manage` to deploy CMS on Cloudflare"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482843"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js CLI, Cloudflare Workers, Cloudflare Pages, D1 (SQLite on Cloudflare), R2 object storage, Wrangler]
---
# Hi agent – run `npx microfeed/CLI manage` to deploy CMS on Cloudflare

## Problem

The capture for this plan is a link to a docs page (https://docs.microfeed.org/start-here/) and a title; there is no prose body, so the implementation details are unstated and have to be scoped honestly from the title alone.

The title is unusual and worth noting: it addresses the AI agent directly ("Hi agent") and pitches a CLI-driven deploy as the agent-friendly path (`npx microfeed/CLI manage`). That framing is the architectural commitment. Most CMSes are designed for a human operator clicking through a hosted admin UI; Microfeed is designed for an agent (or a developer) running a CLI that provisions the CMS on Cloudflare and then operates it. The agent-as-user story is the differentiator and has to be honored in the plan: the CLI has to be safe to run unattended, the deploy has to be idempotent, and the configuration surface has to be something a model can read and write.

The capture does not name what kind of content the CMS hosts (posts, podcasts, newsletters, video — the word "microfeed" suggests small, frequent content), the supported data shapes, the auth model, the publishing flow, or the multi-site story. The plan therefore scopes the shape from the title and the docs URL, and treats the unsaid as design choices to be made rather than facts to be asserted.

## Objective

Ship a CMS whose deploy is driven by a single CLI command (an agent-friendly `npx microfeed/CLI manage`) and whose runtime lives on Cloudflare, so an AI agent or a developer can provision, configure and operate the CMS without going through a hosted admin UI.

## Target Users

- AI agents (or agent-style automation) that need to stand up and operate a CMS as part of a larger workflow — content publishing, podcast hosting, newsletter archives — without a human in the loop.
- Developers who prefer CLI-driven deploys over dashboard clicks and want a CMS that fits a Cloudflare-native stack.
- Solo writers and small publications who want a CMS that runs on Cloudflare's free tier and does not require managing a server.
- Operators who want idempotent deploys so the same command can be run repeatedly without breaking the site.
- Teams who want the CMS configuration to live in a file they can version-control and review rather than in a hosted admin panel.

## MVP Scope

- A `manage` CLI that wraps the full deploy and configuration lifecycle: provision Cloudflare resources, deploy the worker, configure the CMS, and tear down.
- A Cloudflare Worker runtime that serves the CMS, with Pages for the static site if the design separates them.
- D1 (SQLite on Cloudflare) for the content store, so the runtime stays on Cloudflare's free tier without an external database.
- R2 for any binary assets (images, audio files) the CMS hosts.
- A content model that supports what "microfeed" plausibly covers: posts with timestamps, optionally enclosures for podcasts, and tags or categories.
- A publishing flow that an agent can drive: write content as data, run the CLI, and have the site reflect the change.
- An idempotent deploy: running `npx microfeed/CLI manage` twice produces the same result, with no orphaned resources and no duplicate routes.
- A configuration file the agent or developer can read and write, with the full deploy state described in one file.
- A documented destroy path so a test or experiment can be torn down without orphaning Cloudflare resources.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture is URL-only, so content model, supported post types, and auth model are scoped as plausible defaults rather than asserted as facts.
- The CLI is designed to be run by an agent, so it has to be safe to run unattended: no interactive prompts by default, idempotent operations, and explicit confirmation flags for destructive actions.
- Cloudflare's free tier is the architectural commitment, so the runtime has to fit within Workers, D1 and R2 limits without an external database or a paid plan.
- Idempotency is a load-bearing claim; an agent that runs the same command twice must get the same result, with no state drift between runs.
- The CMS configuration has to be in a file an agent can read and write, not buried in a hosted admin UI, or the agent-friendly story collapses.
- The CLI has to handle authentication with Cloudflare in a way that works for both a developer (interactive login) and an agent (token-based, in env or config).
- D1 and R2 are the data surfaces; the architecture has to respect their consistency and size limits rather than pretending they are a general-purpose database.
