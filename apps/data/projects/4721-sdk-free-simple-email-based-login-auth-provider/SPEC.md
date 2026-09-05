# SPEC.md — SDK-free, simple, email-based login/auth provider

## Problem

Hi HN,<p>I built Éclat Blue One-Click Auth (https:&#x2F;&#x2F;eclatblue.com&#x2F;oneclickauth) because I was frustrated by how mainstream authentication providers handle public clients. Most of them force heavy, complex client-side SDKs down your throat or require managing static client secrets that shouldn&#x27;t be exposed on the frontend anyway.<p>Éclat Blue functions as a lightweight, fully OpenID Connect (OIDC)-compliant identity provider. It enforces strict authorization code flows with PKCE protocols natively, allowing you to secure your frontend apps directly through native browser APIs without importing bulky external code libraries.<p>The tool is currently ready for small-scale beta use.<p>I know the general consensus here is to avoid mandatory sign-ups for testing dev tools, so you can inspect our integration flow and endpoints directly on the homepage without needing an account. Please use the Try Me link at https:&#x2F;&#x2F;eclatblue.com&#x2F;oneclickauth<p>I’m looking for feedback from the community.<p>Thank you !

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49543502)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-02T22:32:23Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
