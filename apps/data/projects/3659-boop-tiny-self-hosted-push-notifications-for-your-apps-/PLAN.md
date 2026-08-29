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

## Tech Stack

- **Go** for the server, as stated in the post: the 8 MB footprint is the headline technical claim and Go's runtime and standard library support that target.
- **SvelteKit** for the admin UI, as stated in the post: "Go and Svelte felt like a good combo", and SvelteKit keeps the admin surface small and embeddable in the same binary.
- **SQLite** for the inbox store on the server, because a single binary plus a single data file is the self-hosting story and SQLite fits it.
- **APNs HTTP/2** for the iOS push delivery path, with the provider key handling explicit and a documented private-push recipe for developer devices.
- **SwiftUI for the iOS app** so the inbox UI is a native iOS surface and the push handling uses the platform-native APIs.
- **A Node client library** published as a small npm package so Node applications can send events without writing HTTP.
- **An Elixir client library** published as a small Hex package so Elixir applications can send events, and as the basis for the ErrorTracker integration.

## Architecture

The server is a single Go binary with three responsibilities: receive events over HTTP, persist them in the SQLite inbox store, and forward them as APNs push to the configured device. The HTTP ingestion endpoint is the public surface; auth is by an API key the operator generates through the admin UI and rotates at will. The endpoint accepts arbitrary JSON event shapes because the post names use cases (failed jobs, deployments, signups, payments, low disk space) that have nothing in common beyond "an event worth knowing about"; forcing a fixed schema would force every client into a translation layer it does not need.

The APNs delivery path is the most operationally sensitive piece. The server holds the APNs provider key in a configuration the operator controls; push payloads are built per Apple's HTTP/2 spec with proper topic, expiration, and collapse-id handling so the inbox does not fill with duplicates when an event fans out. The private-push path for developer devices is documented step by step: the operator generates an APNs key, registers a bundle id against their own Apple developer account, builds the iOS app from source with that configuration, and installs it via Xcode or sideloading. The post is explicit that the user does not need to release through the App Store, and the architecture treats that path as part of the product rather than as a workaround.

The iOS app is a SwiftUI inbox: a list of received events, each with the title and body the server pushed, a tap-through to a detail view that shows the full payload, and a clear "mark read" or "archive" action. The inbox is the surface. There is no chat, no feed, no comment thread — events arrive, the user reads them, the inbox retention policy keeps the list bounded. Retention is configurable with a sane default (the post does not name one, so the plan sets a default of N events or N days and makes it visible in the admin UI).

The ErrorTracker integration is the canonical third-party pattern. ErrorTracker remains the system of record; the Boop integration is a small Elixir package that subscribes to ErrorTracker's event stream and POSTs each event to Boop. The same pattern — "source system stays the system of record, Boop is the notifier" — applies to any future third-party integration. Scope is held by drawing the line at receive / persist / push / inbox; queries, dashboards, alerting rules, and aggregation are explicitly out of scope.

The Node and Elixir client libraries are thin HTTP wrappers with sensible defaults (timeout, retry, batching) so application authors do not write the same boilerplate per source. The admin UI is served by the same Go binary, with the SvelteKit build embedded so a deploy is one artifact. The 8 MB memory target is a measured and published number, and the architecture is reviewed against it as features are added.

## Milestones

1. **M1 — Server core** — Go HTTP ingestion, SQLite inbox store, API key auth, and APNs delivery, with the 8 MB footprint measured and published.
2. **M2 — Admin UI** — SvelteKit build embedded in the Go binary, with device token, inbox retention, and API key configuration.
3. **M3 — iOS app** — SwiftUI inbox with push registration, event list, detail view, and archive action; published build-from-source instructions.
4. **M4 — Private-push docs** — a step-by-step APNs recipe for developer devices so the iOS app can be installed without App Store distribution.
5. **M5 — Node client** — a small npm package so Node apps can send events without writing HTTP.
6. **M6 — Elixir client and ErrorTracker integration** — a Hex package plus the ErrorTracker forwarder, demonstrating the canonical third-party pattern.
7. **M7 — Self-hosting story** — a single-binary deploy guide, an inbox retention default with a published rationale, and an auth model the operator can reason about.
8. **M8 — Scope audit** — a published review of features considered and rejected because they would make Boop an observability platform.

## Risks

- **Footprint drift** — the 8 MB target is easy to lose by adding a logging library or a JSON parser with deep allocations; the memory budget has to be measured as features land.
- **APNs key handling** — a leaked provider key is a push-spoofing incident; the key handling has to be explicit and the rotation story documented.
- **Scope creep into observability** — every "can we also" question is a chance to make Boop what it is not; the scope line has to be held in public.
- **Inbox retention surprise** — a default that is too generous turns the inbox into a chat history; a default that is too aggressive loses events the user wanted to read.
- **ErrorTracker API drift** — third-party systems change; the integration has to be pinned to a version or to a documented API surface.
- **Private-push fragility** — Apple changes the APNs key and bundle-id rules; the documented recipe has to be kept current or the build-from-source path stops working.
- **Open relay risk** — a misconfigured Boop with no auth is an open HTTP endpoint on the internet; the default has to be "API key required" and the docs have to make the failure mode visible.
