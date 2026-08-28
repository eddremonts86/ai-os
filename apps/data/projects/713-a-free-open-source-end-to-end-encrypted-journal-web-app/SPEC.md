---
id: "713"
slug: a-free-open-source-end-to-end-encrypted-journal-web-app
title: A Free Open Source End to End Encrypted Journal Web App
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxuk6/a_free_open_source_end_to_end_encrypted_journal/"
category: saas
date: "2026-08-16"
---
# A Free Open Source End to End Encrypted Journal Web App

## Problem

A Reddit launch post for a free, open-source, end-to-end-encrypted text journal web app. The goal stated by the poster is "to make journaling as simple as possible". The entire text-based journal is free with no limits. Entries are encrypted on the client before being stored, so the server never receives plaintext journal content. The project is open source on GitHub (github.com/MrSheerluck/smbl-journal) and built with SvelteKit, Rust, and SQLite.

## Objective

Provide a free, unlimited, end-to-end-encrypted text journal where the server never sees plaintext, so journaling is as simple as possible without the operator being able to read user entries.

## Target Users

- Primary: people who want to journal privately without trusting a server-side operator with the content of their entries.
- Secondary: privacy-conscious users who want a free, no-tier, no-upsell text journal.

## MVP Scope

- Text journaling (no stated media support beyond text).
- Client-side encryption before the entry leaves the browser.
- Server stores only ciphertext.
- Open source on GitHub.
- No tier, no limit, no pricing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster's stack is SvelteKit + Rust + SQLite — stated, not optional.
- E2EE is non-negotiable: the server must not be able to read plaintext entries. Any change that breaks that is a regression.
- Free / open source / no-limit is the explicit product frame.
- No stated user count, retention metric, or conversion goal.
- No media support (images, audio) is mentioned in the source.
