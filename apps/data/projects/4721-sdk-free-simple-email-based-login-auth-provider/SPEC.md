---
id: "4721"
slug: sdk-free-simple-email-based-login-auth-provider
title: "SDK-free, simple, email-based login/auth provider"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49543502"
category: ask-hn
date: "2026-09-02"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# SDK-free, simple, email-based login/auth provider

## Problem

Hi HN,I built Éclat Blue One-Click Auth (https://eclatblue.com/oneclickauth) because I was frustrated by how mainstream authentication providers handle public clients. Most of them force heavy, complex client-side SDKs down your throat or require managing static client secrets that shouldn't be exposed on the frontend anyway.Éclat Blue functions as a lightweight, fully OpenID Connect (OIDC)-compliant identity provider. It enforces strict authorization code flows with PKCE protocols natively, allowing you to secure your frontend apps directly through native browser APIs without importing bulky external code libraries.The tool is currently ready for small-scale beta use.I know the general consensus here is to avoid mandatory sign-ups for testing dev tools, so you can inspect our integration flow and endpoints directly on the homepage without needing an account. Please use the Try Me link at https://eclatblue.com/oneclickauthI’m looking for feedback from the community.Thank you !

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
