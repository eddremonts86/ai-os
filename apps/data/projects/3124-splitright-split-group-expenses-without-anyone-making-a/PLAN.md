---
id: "3124"
slug: splitright-split-group-expenses-without-anyone-making-a
title: Splitright – split group expenses without anyone making an account
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450300"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Splitright – split group expenses without anyone making an account

## Tech Stack

Not stated by the source. The App Store listing implies an iOS client; the backend likely stores expenses and serves a shareable web view per recipient. Specifics are TODO.

## Architecture

A mobile app (creator side) plus a lightweight web view that recipients open from a shared link to see and confirm their share. No account system for recipients.

## Milestones

- [ ] The App Store listing installs and runs on iOS.
- [ ] Creating an expense and sharing a link to a non-account holder works.
- [ ] Anything beyond expense + share (bank sync, settlement rails, multi-currency) is not implied by the source.

## Risks

Without accounts, the app cannot reliably notify or remind participants; this is the structural risk of the model.
