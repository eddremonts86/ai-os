---
id: "4150"
slug: which-self-hosted-docker-uis-support-rootless-mode
title: Which self-hosted Docker UIs support rootless mode?
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508552"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Which self-hosted Docker UIs support rootless mode?

## Tech Stack

Static documentation page rendered with the existing TanStack Start stack. No backend, no database, no auth. Markdown source for the body so the comparison table can be updated as UIs release new versions.

## Architecture

One page, one document with one table. Rows for each UI named in the post (Portainer, Dockge, Dockhand, Arcane, Dokploy, Coolify, Komodo, Runtipi, Rancher, Stacker), columns for documented rootless support and known caveats. Each row links to the docs or release note that backs the claim.

## Milestones

Open the docs for each of the ten UIs, capture any explicit rootless claim or caveat, populate the table, write the page header (the question, the scope, the date stamp), publish the page, link it back to the HN thread.

## Risks

Risk of stale data: rootless support is a moving target. Mitigate with a date stamp and an "as of" header. Risk of misrepresenting a UI's position: every row must link the doc or release note it came from so a maintainer can correct it.