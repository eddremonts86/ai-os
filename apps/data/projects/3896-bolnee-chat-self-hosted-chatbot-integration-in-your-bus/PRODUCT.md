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

## Value Proposition

A website chatbot your business fully controls. The category's default is a hosted widget where conversations flow through a vendor's cloud; Bolnee-Chat's stated difference is the opposite: the business hosts the chat server itself, so visitor conversations, the model connection and the history all stay on its own infrastructure. For any business that treats customer chats as sensitive, that difference is the product.

**One-liner:** A self-hosted chatbot integration for your business website.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Privacy-sensitive businesses | Visitor conversations never leave their infrastructure. |
| Agencies | One reusable, client-owned chat stack instead of per-client SaaS seats. |
| Cost-conscious operators | No per-seat SaaS markup; they pay only their own compute and model API. |
| Developers | A codebase they can audit, patch and integrate. |

## Jobs To Be Done

1. Add a working chatbot to a website without handing visitor data to a vendor.
2. Run the chat service on infrastructure the business already owns.
3. Review past conversations and tune the bot's behavior.
4. Keep the widget lightweight enough to not slow the site.

## Success Metrics

- Self-hosted deployments started per week.
- Chats served per deployment.
- Time from clone to a live widget on a site, the true onboarding cost of self-hosting.
- Share of deployments that stay active after the first month.

## Pricing & Monetization

None stated. The capture contains no pricing information.

## Competitive Landscape

The capture names no competitors. The category is website chatbots and live-chat widgets, dominated by hosted SaaS products; the title's positioning is the deployment model — self-hosted, in your business website — which is also the axis on which most incumbents are weakest.

## Risks & Open Questions

- [ ] Self-hosting is a feature and a tax: every update, security patch and outage is the operator's problem.
- [ ] The source is a bare URL plus title; the actual project may differ from this MVP.
- [ ] LLM API costs accrue to the operator with no pricing model stated anywhere.
- [ ] Chat quality depends on the model and prompts the operator chooses; the product cannot promise quality.
- [ ] No evidence of production deployments exists in the capture.
