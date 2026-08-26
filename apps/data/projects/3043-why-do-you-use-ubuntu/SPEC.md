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

## Problem

I think Ubuntu is one of the worst quality distros that exists. They try to do everything in their own way, and usually seem to put very little effort into "their own" way, and seem to lack understanding of why things were done in another way by other distros, resulting in something which is really painful to use.I use Ubuntu because I need intune, and M$ seems to have recognized like for like and decided that if they limit support to one the worst quality Linux distro then they can keep market share for longer as people will have a conception of Linux as something low quality and poorly built which mirror's Microsoft's own products.Just some specific problems:- I have never had a release update work on Ubuntu- Ubuntu used poorly wrapped SysV init scripts as their backing for Systemd units for years, resulting in silent failures when the SysV init script errored out, as the errors were not properly recongized by systemd because whoever wrapped the SysV init scripts did not know what they were doing.- I have rarely used something via snapd without having some problems. Most recently was with a colleague who used snapd to install docker but the result was a docker installation which did not read the docker config file from their home directory.Fedora is better in almost every way. Fedora is not more difficult to use, it goes wrong a lot less often.So why do people still use Ubuntu?

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
