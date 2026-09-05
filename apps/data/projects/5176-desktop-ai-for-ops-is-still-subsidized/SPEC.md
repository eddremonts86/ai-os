# SPEC.md — Desktop AI for ops is still subsidized

## Problem

I&#x27;d like to share an opinion on the current situation in AI ops, not the coding&#x2F;tech side.<p>Right now the market has a pretty clear pattern. Big labs like OpenAI, Anthropic and xAI are building their own desktop AI and computer-use apps. The trick is they still treat this segment as Growth. Maturity is far away. So the biggest players burn money acquiring customers and giving them huge subsidies on tokens vs real cost.<p>Today the world is getting a huge AI bill, mostly paid by investors. We&#x27;re running on debt. If there is no real breakthrough, math doesn&#x27;t lie, there will have to be a cost-effective compromise. Using heavy models for coding is justified. Using them for the simplest things in operations is not, economically.<p>Tests: open source models like GLM or Kimi, hosted by big US inference providers, do fine on day-to-day work and are sometimes 5x-7x cheaper (depends on config and model).<p>My bet is simple. The AI bill will move from investors to users (mostly B2B). Companies will need an app like GPT Desktop, Claude Desktop, Grok Bot, with enterprise-grade integrations, but with the option to use open source and self-hosted models. The big labs can&#x27;t really agree to that, they lose the token margin.<p>Worth mentioning Cursor here. Building a BYOK software wrapper without your own lab is an endless chase for margin, walking a thin line. Even at their scale it ended with an acquisition by a lab.<p>I think it was a brilliant move by xAI&#x2F;SpaceX. They got the data and the distribution, which in their case will be priceless.<p>Building this kind of software for daily ops work is not easy. Nobody said it was impossible.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49574780)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-05T09:23:39Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
