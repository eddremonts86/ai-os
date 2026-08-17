---
id: "2471"
slug: "2-ask-hn-we-built-a-solution-for-100b-node-p2p-does-any"
title: "2. Ask HN: We built a solution for 100B-node P2P. Does anyone care about this?"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49259055"
category: ask-hn
date: "2026-08-11"
tags: [Ask HN, Problem]
---
# 2. Ask HN: We built a solution for 100B-node P2P. Does anyone care about this?

## Problem

We have developed an architecture and algorithms that enable search in a peer-to-peer network of over 100 billion nodes in under one second, and under half a second in low-orbit satellite networks. The routing requires less than 80 KB of memory per device, allowing the network to run entirely on consumer devices like smartphones.We are two researchers. We spent years trying to build a mathematically protected secret voting system. In the process, we were forced to solve many networking problems that typically prevent a pure P2P network from reaching global scale:— Search: Deterministic, under 1 second, 100B+ nodes, under 80 KB routing memory per device.— Identity: Anonymous authentication without CAs. One person, many devices, no passwords.
— Recovery: Session restoration without passwords or seed phrases.— Subnets: Fully autonomous, isolated networks of any scale.— Anonymization: Traffic analysis resistance built into the protocol.— Integrity: Consensus-based recovery of routing data without trusted nodesand the like.We have a detailed architecture. The core solutions are patent-protected (patents pending). We do not have production code. We are keeping the core closed until we find one engineering co-founder to implement it with us.Our question is not «is this possible?» We already know it is. Our question is: does anyone in the P2P community still care about solving these problems?We haven't seen much discussion of global-scale sovereign infrastructure lately. Maybe the industry has moved on to other priorities. If you're still interested in this class of problem, we'd like to hear from you. If not, we'd like to understand why.Overview & Contact: github.com/ikhrabry-spec/a-p2p-network-architecture-for-100b-nodes akhabry@balloting.net / ikhabry@balloting.net

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
