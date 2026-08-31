---
id: "3896"
slug: bolnee-chat-self-hosted-chatbot-integration-in-your-bus
title: "Bolnee-Chat – Self Hosted Chatbot Integration in Your Business Website"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497227"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Docker, WebSocket chat server, embeddable JavaScript widget, LLM API adapter, admin dashboard, SQLite]
---
# Bolnee-Chat – Self Hosted Chatbot Integration in Your Business Website

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://github.com/AniketWathore/bolnee-chat. The product claim carried by the title is Bolnee-Chat, a self-hosted chatbot that a business integrates into its own website — meaning the company runs the chat service on its own infrastructure rather than paying a hosted SaaS. The capture states nothing further: no supported models, no feature list, no deployment notes and no pricing.

## Objective

Build the MVP matching the title: a business drops a small widget into its site, points it at a self-hosted chat server it runs, and visitors get a working chatbot with conversation history stored on the business's own infrastructure. The MVP must make self-hosting the default path, not an afterthought.

## Target Users

- Small and medium businesses that want a website chatbot without third-party data sharing.
- Agencies and freelancers who run chat support for clients on their own servers.
- Privacy-sensitive sectors (health, legal, finance) that cannot send visitor chats to a SaaS vendor.
- Developers who prefer owning the stack and the data over a managed widget.

## MVP Scope

- An embeddable chat widget that drops into any website.
- A self-hosted server (Docker deploy) that brokers conversations.
- Connection to an LLM for responses.
- Conversation history and a basic admin view for the business operator.

## Constraints

- The source is a bare URL plus title; every feature decision below is ours, not the author's.
- Self-hosting means the operator carries deployment, updates and LLM API costs; the MVP must keep that burden small.
- The capture names no specific LLM or model; the MVP must be model-agnostic at the adapter layer.
- No pricing or user counts exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
