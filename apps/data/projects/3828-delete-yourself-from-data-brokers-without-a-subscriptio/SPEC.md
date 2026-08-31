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

## Problem

The poster paid for a service to get his phone, addresses and vehicles off the public internet — it didn't work. So he built remove-your-data, an open-source repo that tells an AI agent exactly what to do to remove personal information online. The capture is personal and specific: a failed paid subscription as the trigger, an agent as the executor, and an open-source repo as the deliverable — no subscription required.

## Objective

Replace paid data-broker removal services with an open-source, agent-executable playbook: a repo whose instructions an AI agent can follow step by step to submit removal requests for phone numbers, addresses and vehicles, with the user in control and nothing recurring to pay.

## Target Users

- People who paid a removal service and saw no results — the poster's exact position.
- Privacy-conscious users who distrust handing personal data to a third-party service.
- AI agent users who want a repeatable, scripted removal workflow.

## MVP Scope

- A repo with per-broker removal instructions an agent can execute.
- Coverage for the data types the poster names: phone, addresses, vehicles.
- Verbose logging of every action the agent takes.
- Custom removal requests beyond the default broker list.

## Constraints

- The trigger is one person's failed subscription; the post claims no success rate for the repo itself.
- Removal still requires handing personal data to brokers — a commenter on the thread flags this tension.
- The capture names the repo by function, not by broker list or supported jurisdictions.
- Open source means no revenue; the deliverable is instructions, not a service guarantee.

## Design Direction

See `DESIGN.md` for this project's design tokens.
