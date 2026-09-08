---
id: "3896"
slug: bolnee-chat-self-hosted-chatbot-integration-in-your-bus
title: Bolnee-Chat – Self Hosted Chatbot Integration in Your Business Website
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

## Tech Stack

- **Docker:** one-command self-hosted deployment.
- **WebSocket chat server:** real-time conversation.
- **Embeddable JavaScript widget:** minimal footprint on the site.
- **LLM API adapter:** operators plug in the model they prefer.
- **SQLite:** conversation history on the operator's machine.
- **Admin dashboard:** chat review and configuration.

## Architecture

- The widget opens a WebSocket to the self-hosted server.
- The server routes each message through the LLM adapter.
- Conversations and metadata persist to local storage.
- The admin dashboard reads the same store for review and settings.
- Deployment is a Docker image the operator runs behind its own reverse proxy.

## Milestones

1. **M0 — Scaffold:** server skeleton, widget stub, Docker build, repo hygiene.
2. **M1 — The loop:** widget connects, messages flow to the LLM adapter and back.
3. **M2 — Operations:** conversation history, admin view, config for model and prompts.
4. **M3 — Distribution:** polished Docker deploy, docs, a demo site with the widget live.

## Risks

- Operator burden is the adoption killer for self-hosted products; docs must carry the product.
- Model-agnostic adapters rot when APIs change.
- No monetization story in the capture; costs are the operator's.
- Security: a self-hosted chat server on a business site is an attack surface the operator must maintain.
