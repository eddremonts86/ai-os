---
id: "4280"
slug: dropbox-data-breach
title: Dropbox Data Breach
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49514427"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Dropbox Data Breach

## Problem

I received a security notice from Dropbox today saying that my account was accessed without authorization between August 4 and August 21, 2026, and that Dropbox believes files in the account were viewed or downloaded.According to the email, Dropbox uses Lenovo as an identity provider, allowing users to authenticate to Dropbox with a verified Lenovo ID.Dropbox says:an issue with Lenovo’s email verification process allowed an unauthorized party to register a Lenovo ID using your email address and then use that Lenovo ID to log into the Dropbox account associated with that email address.So, as I understand it, the attack path was roughly:1. Attacker registers a Lenovo ID using the victim’s email address.
2. Lenovo incorrectly treats the email address as verified.
3. Dropbox trusts the Lenovo identity.
4. Attacker gets access to the Dropbox account associated with that email address.Dropbox says it has since expired all sessions authenticated through Lenovo ID and removed the Lenovo link from my account. It also says Lenovo authentication can no longer be used for the account without first entering the Dropbox password.I’ve searched for a public disclosure from Dropbox or Lenovo and haven’t found one yet.Has anyone else received the same notice, or seen any public information about this vulnerability?I’m particularly interested in knowing how broadly the Lenovo ID login mechanism was available and how many Dropbox accounts may have been affected.

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
