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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Boop is a small, open-source notification server paired with an open-source iOS app that sends application events directly to your phone as native push, without routing through Slack or Telegram and without paying for a hosted service. The server uses around 8 MB of memory on the author's machine; the iOS app can be built and installed locally with documented APNs private-push instructions so the user does not need App Store distribution.

Boop is deliberately not an observability platform or a Sentry replacement. It receives events, sends native push, and keeps events in a purpose-built mobile inbox. The ErrorTracker integration shows the pattern: the source system stays the system of record, and Boop is the notifier. Clients exist for Elixir and Node; the Elixir client in particular is what the author uses to forward ErrorTracker events to Boop.

**One-liner:** Boop sends your application's events to your own phone as native push, with no third-party service in the path and an 8 MB self-hosted server you can read end to end.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo developers and small teams | Events on the phone without paying for a hosted notification service. |
| Self-hosters on a small box | The 8 MB memory footprint is a real constraint, not a curiosity. |
| Elixir developers using ErrorTracker | Errors are forwarded to Boop without leaving the ErrorTracker workflow. |
| Node developers | A published client for wiring any event source into Boop. |
| Operators who refuse Slack/Telegram redirect | Native push is the contract; events arrive where Slack does not. |
| Developers who refuse App Store distribution | A documented private-push path so the iOS app can be built and installed locally. |
| People who want an inbox, not a chat | Events land in a purpose-built inbox on the phone, not in a chat history. |

## Jobs To Be Done

1. **Functional job** — Get application events on the phone as native push, not as a Slack or Telegram message.
2. **Functional job** — Forward errors from ErrorTracker (or any other source) to Boop without making Boop the system of record.
3. **Functional job** — Build and install the iOS app without going through the App Store.
4. **Emotional job** — Trust the notification server because it is small enough to read end to end and the footprint is published.
5. **Social job** — Use Boop across the stack — Elixir apps, Node apps, any client that can speak HTTP — without per-source workarounds.

## Success Metrics

- **Server memory footprint** — measured RSS on the author's machine and a published target, because the 8 MB number is the headline technical claim.
- **End-to-end push latency** — median time from an event posted to the server to a push delivered on the phone, since push is the contract.
- **App Store-free installs** — share of installs that complete via the documented build-from-source + private-push path, because that path is part of the product.
- **Inbox retention adherence** — share of installs where the inbox stays within the configured retention, because an unbounded inbox defeats the inbox model.
- **ErrorTracker integration working rate** — share of Elixir apps using the integration where a forwarded ErrorTracker event arrives in Boop, because this is the canonical third-party pattern.
- **Scope adherence** — count of features added that would have made Boop an observability platform; the target is zero, because that is the architectural commitment.

## Pricing & Monetization

The post names no price, no tier and no hosted plan; everything is free and open source. The architecture fixes only the cost shape: cost scales with the volume of events a self-hoster chooses to forward, not with the number of users behind the inbox, because there is only one inbox (the operator's phone) by design.

## Competitive Landscape

- **Hosted notification and error-reporting services** — what Boop is explicitly positioned against; the value is self-hostable, open source, and tiny.
- **Slack/Telegram as a notification sink** — the failure mode the author is escaping; native push reaches the user when Slack does not.
- **Self-hosted observability stacks** — broader in scope and heavier in footprint; Boop is the "just send the event to my phone" answer, not the "let me query this" answer.

The post names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Keep the 8 MB target a measured and published number rather than letting it drift as features are added.
- [ ] Resist scope creep into observability: no queries, no dashboards, no alerting rules; the inbox is the surface.
- [ ] Document and verify the ErrorTracker integration as the canonical pattern for any future third-party integration (Sentry, Honeybadger, etc.).
- [ ] Ship a private-push install path for iOS that works end to end on a developer device, with the APNs key handling explicit.
- [ ] Decide the inbox retention default and the per-inbox override, so the inbox model does not silently grow into a chat history.
- [ ] Decide the multi-device path: one inbox per device, one shared inbox, or one inbox per source — the capture is silent.
- [ ] Publish the auth model for the server endpoint so a misconfigured Boop is not an open relay on the internet.
