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

## Problem

The author built Boop because he wanted application events sent directly to his phone without paying for another service and without routing everything through Slack or Telegram. The post is unusually specific about the design intent and the architecture, and several pieces of it are load-bearing.

Boop is a small open-source server paired with an open-source iOS app. The server uses around 8 MB of memory on the author's machine. The author is explicit that Boop is not an observability platform and not a Sentry replacement — it receives events from applications, sends native push notifications, and keeps them in a purpose-built mobile inbox. Because the author uses Elixir, he built an ErrorTracker integration where ErrorTracker still captures and stores the errors and the plugin forwards them to Boop so he can see them on his phone. There are also a general Elixir client and a Node client. The iOS app can be built and installed locally with instructions for configuring private push notifications for the author's own device, so he does not need to release anything through the App Store. Use cases named in the post are failed jobs, deployments, signups, payments, low disk space, or anything else the application can send. The server is built in Go because the author wanted to save memory on a self-hosted machine, and Go plus Svelte felt like a good combo.

The architectural pieces the plan has to honor: a tiny Go server (the 8 MB number is a real asset, not a marketing line), an open-source iOS app with a documented private-push path so anyone can use it without App Store distribution, an inbox model on the phone (not a chat, not a feed, a purpose-built inbox), an ErrorTracker integration pattern where ErrorTracker remains the system of record and Boop is the notifier, and the deliberate exclusion of "observability platform" scope. The capture does not name the push provider (APNs for iOS), the auth model for the iOS app, the inbox retention policy, or the multi-device path, so those are scoped as design choices rather than facts.

## Objective

Ship a tiny, open-source, self-hosted notification server paired with an open-source iOS app that receives application events, delivers them as native push to a phone, and keeps them in a purpose-built mobile inbox — without becoming an observability platform, without forcing App Store distribution, and without routing through Slack or Telegram.

## Target Users

- Solo developers and small teams who want application events on their phone without paying for a hosted notification service.
- Self-hosters with limited memory on their box for whom the 8 MB footprint is a real constraint, not a curiosity.
- Elixir developers using ErrorTracker who want their errors forwarded to their phone without leaving the ErrorTracker workflow.
- Node developers using the published client to wire any event source into Boop.
- Operators who want native push (not a Slack/Telegram redirect) because push reaches them when Slack does not.
- Developers who refuse App Store distribution for a personal tool and want a documented private-push path so they can build and install the iOS app themselves.

## MVP Scope

- A small Go server that receives events over HTTP, persists them, and forwards them as APNs push to a configured device.
- An open-source iOS app built in SwiftUI that registers for push, receives events, and renders them in a purpose-built inbox UI.
- Documented instructions for configuring APNs private push for the user's own device so the iOS app can be built and installed without App Store distribution.
- A Svelte-based admin UI served by the same Go process (the post names Go plus Svelte as a good combo) for the server configuration: the device token, the inbox retention, the API key.
- A Node client library for sending events from a Node application.
- A general Elixir client library for sending events from an Elixir application.
- An ErrorTracker integration package that forwards ErrorTracker events to Boop while leaving ErrorTracker as the system of record.
- An inbox retention policy with a default that is bounded, so the inbox on the phone does not grow without limit.
- A self-hosting story that respects the 8 MB memory target and explains what to expect on a small box.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The 8 MB memory footprint is the author's stated number on his machine; the architecture has to be designed to keep it there rather than drift upward as features are added.
- Boop is deliberately not an observability platform and not a Sentry replacement, so the scope has to stop at "receive event, send push, keep in inbox" and resist the pull to add queries, dashboards, or alerting rules.
- The ErrorTracker integration is the canonical pattern for how third-party systems forward to Boop: the source system stays the system of record, Boop is the notifier, and the inbox is a copy the user can read.
- APNs private push is the iOS delivery path the post names; the documented build-from-source path is part of the product, not a workaround.
- The post names "failed jobs, deployments, signups, payments, low disk space" as use cases; the schema has to accept arbitrary event shapes without forcing a fixed event taxonomy.
- Native push is the contract: routing through Slack or Telegram is the failure mode Boop is built to escape, so the iOS app must receive events as push, not by polling a chat.
- Self-hosting means the server has to run on a small machine; the deploy story has to fit a single binary plus a small data file, not a multi-service stack.
