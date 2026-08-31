---
id: "3885"
slug: "self-hosted-mobile-friendly-web-ui-for-herdr-agents"
title: "Self-hosted mobile-friendly web UI for Herdr agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497870"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Self-hosted web server, Mobile-friendly UI, Real terminal streaming, Push notifications, File transfer, Agent monitoring API]
---
# Self-hosted mobile-friendly web UI for Herdr agents

## Problem

The capture is a URL-only Show HN post pointing at github.com/luiscleto/shepherdr; the product claim is the title — a self-hosted, mobile-friendly web UI for Herdr agents — and the repository describes shepherdr as a phone-friendly web interface for Herdr: monitor agents, receive notifications, open real terminals, and send files. The capture itself contains no post body beyond the title and URL.

## Objective

Ship shepherdr as the phone-friendly front door for Herdr agents: a self-hosted web UI where a user monitors agents, gets notifications, opens real terminals and sends files from a mobile browser. The MVP is the working interface covering those four interactions, self-hosted on the user's own infrastructure.

## Target Users

- Herdr users who want to keep an eye on their agents away from a laptop, from a phone.
- Self-hosters who prefer a web UI on their own box over a hosted dashboard.
- Operators who need to reach an agent's real terminal or push files to it while mobile.

## MVP Scope

- Agent monitoring in a mobile-friendly web UI.
- Notifications about agent activity delivered through the interface.
- Real terminal access to agent sessions from the browser.
- File sending to agents.

## Constraints

- Self-hosted by requirement; the UI ships with the user's own deployment.
- The phone form factor drives every design decision: the interface must be usable on a small screen.
- Herdr is the agent harness this plugs into; the capture does not describe Herdr itself.
- The capture is a title plus repository description; no usage numbers exist.

## Design Direction

See `DESIGN.md` for this project's design tokens.
