---
id: "3229"
slug: are-there-any-pikvm-equivalent-iscsi-usb-gadget-project
title: Are there any PiKVM equivalent iSCSI USB gadget projects?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49463554"
category: ask-hn
date: "2026-08-27"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Are there any PiKVM equivalent iSCSI USB gadget projects?

## Problem

I know plenty of us have read about and then experimented ourselves an iSCSI backed "USB drive" along the lines of [0] making use of Linux USB gadget functionality. That allows using high performance network storage with devices that have no native network storage support, or really bad support, or no native high speed networking, or no native networking at all for that matter. All sorts of devices and OS reliably support simple USB mass storage though. And the capability reminds me a lot of the earlier roll-your-own IP KVM efforts. In that case though both companies and crowd funded efforts have since then run with the idea and produced some really polished and friendly off the shelf products, with a thorough round up by Jeff Geerling getting some attention on HN a few months ago [1, 2]. Those products are quite nice and have helped me sell it to clients who are leery of something that seems overly home cooked.iSCSI USB should be amenable to the same sort of polishing and refinement, and it'd be neat if it was friendlier off the shelf. Plenty of people and orgs have NAS or SAN products from various players in the space that all support iSCSI (and/or NVMoF now I guess), which could be leveraged further. It also seems like a natural fit for various companies like ixSystems that make a business around non-cloud storage. But I haven't been able to find anything, so just curious if that's because there really isn't anything to contribute to yet, or if as is more likely there are efforts that I don't know about?----0: https://matt.olan.me/posts/2020-03-30-making-a-piscsi-usb-drive-part-1/1: https://www.jeffgeerling.com/blog/2026/i-tested-every-ip-kvm/2: https://news.ycombinator.com/item?id=48413072

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
