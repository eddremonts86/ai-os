---
id: "3206"
slug: ticketping-chat-with-your-visitors-without-leaving-slac
title: Ticketping – Chat with your visitors without leaving Slack
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/ticketping?utm_campaign=startup-184497&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ticketping – Chat with your visitors without leaving Slack

## Problem

Ticketping brings your customer support into Slack so your team can handle tickets where they already collaborate. It routes chat widget messages, support emails, and form submissions into Slack threads, letting you reply, mention teammates, and update status without switching tools. An admin dashboard tracks tickets, roles, and performance. Optional AI answers common questions, suggests responses, and reduces repetitive work while humans handle nuanced issues. View startup

## Objective

Build a support tool that routes chat widget messages, support emails, and form submissions into Slack threads so a small team can reply, mention teammates, and change ticket status from Slack, with an admin dashboard for ticket / role / performance tracking and optional AI that suggests or drafts answers for the repetitive questions.

## Target Users

1. Small support teams that already collaborate in Slack and want customer chat, email, and form submissions to land in the same threads they already work in, instead of opening a separate helpdesk.
2. Founders and team leads who want a dashboard view of tickets, roles, and performance without forcing their team to learn a new support-specific tool.

## MVP Scope

- A Slack app that opens one thread per ticket and routes inbound messages from a chat widget, support email, and web form into it.
- Reply, mention, and status updates from Slack so the agent does not have to switch to a separate UI for the common actions.
- An admin dashboard that lists tickets, manages roles, and shows performance numbers.
- Optional AI that drafts answers to common questions and suggests responses, leaving nuanced replies to humans.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Slack is the primary surface; the dashboard is for management and reporting, not for daily ticket handling.
- Inbound channels the source names are chat widget, support email, and form submissions; adding new channels (phone, SMS) is out of scope for the MVP.
- AI is suggestive, not autonomous — humans stay in the loop on nuanced issues per the source.
- No requirements around payments, billing, or SLAs are stated in the source; those are out of scope until the post or a follow-up says otherwise.
