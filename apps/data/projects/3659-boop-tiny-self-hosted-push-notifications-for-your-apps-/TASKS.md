---
id: "3659"
slug: boop-tiny-self-hosted-push-notifications-for-your-apps-
title: "Boop – tiny, self-hosted push notifications for your apps built in Go"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482939"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Go, SvelteKit, SQLite, APNs HTTP/2, iOS (SwiftUI), Node client library, Elixir client library]
---
# Boop – tiny, self-hosted push notifications for your apps built in Go

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3659-boop-tiny-self-hosted-push-notifications-for-your-apps-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Go HTTP ingestion endpoint with API key auth and arbitrary JSON event bodies
- [ ] Implement the SQLite inbox store with configurable retention and a sane default
- [ ] Implement APNs HTTP/2 delivery with provider key handling, topic, expiration, and collapse-id
- [ ] Embed the SvelteKit admin UI in the Go binary with device token, inbox retention, and API key configuration
- [ ] Measure and publish the server memory footprint on a reference machine so the 8 MB claim is anchored
- [ ] Build the SwiftUI iOS inbox app with push registration, event list, detail view, and archive action
- [ ] Write the step-by-step APNs private-push recipe so the iOS app can be built and installed without App Store distribution
- [ ] Publish the Node client as a small npm package with timeout, retry, and batching defaults
- [ ] Publish the Elixir client as a small Hex package and build the ErrorTracker integration as the canonical third-party pattern
- [ ] Audit and reject features that would make Boop an observability platform, and publish the rejected list
- [ ] Document the self-hosting story: single binary, single data file, auth model, and inbox retention default

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
