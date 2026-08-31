---
id: "4002"
slug: anvendor-see-your-competitors-customers
title: "AnVendor – see your competitor's customers"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49501656"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AnVendor – see your competitor's customers

## Problem

Long story short: I found a way to reveal which SaaS any company uses. And estimate how much they pay for it.And now in detail:
I'm a solo entrepreneur – an ML Engineer, a bit of a product manager, and a self-taught marketer.
At some point, I thought it would be nice to detect what services companies use. There are solutions that scan websites for frameworks and APIs used, or that analyze a company's job postings, and others that look at news and website publications. But overall, no single approach can determine what SaaS services are being used right now. Only in the past or in the future.So I created an engine that does this (not right away, of course, but after almost six months of experimentation). Unfortunately, I can't go into detail about how it works; that's the main secret of my service. It's not hacking, cracking, or secret databases. It's just a little ingenuity. And there's absolutely no AI – just engineering and classic ML.The engine itself can only detect the fact of a "subscription" from any company. "Subscription" is in quotation marks because that's not entirely accurate – it's more likely that the company interacts with SaaS. Sometimes it might be a pilot, sometimes a parent or subsidiary company. Nevertheless, it works.To make this product useful for lead generation, I added a second layer – an estimate of how much the company spends on services. This collects service rates, the number of employees, and a bunch of other parameters, plus a cost estimation model. This is a rough estimate, as there are situations like pilots, special negotiating terms, and discounts for enterprises. However, this estimate will improve as more data is accumulated.Currently, I've added ~700 SaaS services that can be detected. And I really need a signal from real users about which services should be added – the service has a free plan, and all service requests are stored in the database.Overall, I'd appreciate any feedback.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
