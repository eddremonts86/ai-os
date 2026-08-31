---
id: "3828"
slug: delete-yourself-from-data-brokers-without-a-subscriptio
title: Delete yourself from data brokers without a subscription
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493881"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Structured removal playbooks per broker, agent task instructions, request templates, verbose action logging, removal status dashboard, open-source repo distribution]
---
# Delete yourself from data brokers without a subscription

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the trigger (failed paid service) and the data types (phone, addresses, vehicles)
- [x] Write SPEC.md (this document)
- [x] Define the playbook format: one structured removal playbook per broker
- [x] Write the first playbooks covering the named data types

## Phase 1: Core

- [ ] Make playbooks agent-executable with step-by-step task instructions
- [ ] Add verbose logging so every action leaves a trace
- [ ] Support custom removals for brokers outside the shipped list
- [ ] Build the removal status dashboard from the action logs
- [ ] Test end-to-end: an agent runs a full removal sequence against a broker

## Phase 2: Deploy

- [ ] Publish the repo with clear setup and contribution docs
- [ ] Collect community playbooks for more brokers and jurisdictions
- [ ] Set a maintenance cadence for keeping broker instructions current

---

_Generated automatically by Lúa on 2026-08-30_
