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

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the server, widget and Docker build
- [x] Choose the first LLM adapter and document the plug-in point

## Phase 1: Core

- [ ] Connect the widget to the server over WebSocket
- [ ] Route messages through the LLM adapter and stream replies
- [ ] Persist conversations to local storage
- [ ] Add basic operator settings for model and prompt

## Phase 2: Deploy

- [ ] Build the admin dashboard for conversation review
- [ ] Polish the Docker deploy and reverse-proxy docs
- [ ] Ship a live demo site with the widget embedded
- [ ] Collect deployment feedback from self-hosters
