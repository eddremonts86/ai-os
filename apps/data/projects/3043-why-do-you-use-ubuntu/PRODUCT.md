---
id: "3043"
slug: why-do-you-use-ubuntu
title: Why do you use Ubuntu?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49445382"
category: ask-hn
date: "2026-08-26"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Why do you use Ubuntu?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I think Ubuntu is one of the worst quality distros that exists. They try to do everything in their own way, and usually seem to put very little effort into "their own" way, and seem to lack understanding of why things were done in another way by other distros, resulting in something which is really painful to use.I use Ubuntu because I need intune, and M$ seems to have recognized like for like and decided that if they limit support to one the worst quality Linux distro then they can keep market share for longer as people will have a conception of Linux as something low quality and poorly built which mirror's Microsoft's own products.Just some specific problems:- I have never had a release update work on Ubuntu- Ubuntu used poorly wrapped SysV init scripts as their backing for Systemd units for years, resulting in silent failures when the SysV init script errored out, as the errors were not properly recongized by systemd because whoever wrapped the SysV init scripts did not know what they were doing.- I have rarely used something via snapd without having some problems. Most recently was with a colleague who used snapd to install docker but the result was a docker installation which did not read the docker config file from their home directory.Fedora is better in almost every way. Fedora is not more difficult to use, it goes wrong a lot less often.So why do people still use Ubuntu?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49445382) · **Category:** ask-hn · **Tags:** Ask HN,Problem
