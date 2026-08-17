---
id: "2460"
slug: ive-built-and-open-source-p2p-chat-without-back-end
title: Ive built and open source P2P chat without back end
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49261928"
category: ask-hn
date: "2026-08-11"
tags: [Ask HN, Problem]
---
# Ive built and open source P2P chat without back end

## Problem

Is this even something people want?
A friend and I built a fully secure p2p end-to-end encrypted chat messenger with groups 1:1 chats and calls, every message is fully encrypted and sent directly to the other person.
The only backend existing is a directory server which lists users by their public id (the fingerprint of a Ed25519/Curve25519 keypair) and name. There is also a relay which is only used tho if the user is behind a NAT, or firewall.More infos and the src is here https://github.com/Emn4tor/SealIs this project like even needed or is it something that ive built for fun and can leave alone, does anyone see a real use case for this?

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
