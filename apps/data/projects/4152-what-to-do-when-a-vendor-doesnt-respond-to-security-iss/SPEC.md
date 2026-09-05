---
id: "4152"
slug: what-to-do-when-a-vendor-doesnt-respond-to-security-iss
title: "What to do when a vendor doesn't respond to security issues?"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507259"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# What to do when a vendor doesn't respond to security issues?

## Problem

The poster, based in the EU, found two vulnerabilities in a consumer internet-connected appliance they own: an outdated service reachable unauthenticated from the LAN that allows arbitrary file reads via a known CVE, and a second unauthenticated LAN endpoint that can brick the device with a single GET request (recovery requires disassembly and JTAG). There are no cross-origin checks on either endpoint, so a malicious site could brick visitors' devices with no interaction. The vendor advertises the product as still in active support. The poster's responsible-disclosure attempts failed: the EU support ticket system errored on every attempt, the security-issue form was too short to fit a real write-up, US support replied promptly but the model is not sold there and the promised EU forwarding produced no reply after multiple follow-ups, and three weeks later the EU side is silent. The poster asks two concrete questions: what to do next (is there an EU body that can step in?) and whether publishing the findings would put them at legal risk.

## Objective

Document a credible responsible-disclosure escalation playbook for EU-resident security researchers who hit a non-responsive consumer-vendor, drawing the steps that are real (CVD norms, ENISA contact, national CSIRT, regulator complaints) without inventing any.

## Target Users

Independent security researchers and homelab users in the EU who find a vulnerability in a consumer product, want to disclose responsibly, and cannot get a vendor response. Secondary reader: small vendor security teams who want a checklist of what their inbox looks like when disclosure works well.

## MVP Scope

A written escalation guide: (1) confirm and minimise the repro, (2) capture timestamped evidence, (3) retry the vendor with proof-of-concept that does not weaponise the bug, (4) engage the national CSIRT and ENISA as coordinator, (5) consult a lawyer before any public disclosure, (6) after a defined waiting period, consider coordinated public disclosure. No SaaS, no disclosure portal.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The post does not name the product, vendor, or country, so the guide cannot be tailored to a specific jurisdiction beyond "EU". The guide must label any time-bound claim ("wait N days before going public") as derived from CVD norms, not from the post. The post does not resolve whether the poster can legally disclose, so the guide must present the legal question as a question, not an answer.