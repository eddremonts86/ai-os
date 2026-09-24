# SPEC.md — Roled – User and role management across multiple applications

## Problem

Hi HN! I am building Roled (<a href="https:&#x2F;&#x2F;roled.io" rel="nofollow">https:&#x2F;&#x2F;roled.io</a>), an open-source platform for centralized user &amp; role management across multiple applications.<p>At several companies I&#x27;ve worked at, I noticed the same pattern: we built multiple products, and each needed users, roles, and permissions. Eventually we&#x27;d end up building some form of centralized backoffice or user management ourselves.<p>I started Roled because I wondered whether that could simply be infrastructure that we don&#x27;t have to rebuild.<p>One design choice in Roled is that users aren&#x27;t modeled around organizations. Instead, each project has its own users, roles, permissions, and authentication settings. This makes it possible to manage multiple independent applications from one place without requiring them to share the same user base.<p>It provides ready-to-use authentication flows such as sign-up, sign-in, password reset, email verification, and user invitations. The user-management APIs can also be used directly from your backend if you want to build your own flows. Applications integrate with Roled using OAuth2.<p>Roled is open source and can be self-hosted, or you can use the managed version at <a href="https:&#x2F;&#x2F;console.roled.io" rel="nofollow">https:&#x2F;&#x2F;console.roled.io</a>. The documentation is at <a href="https:&#x2F;&#x2F;docs.roled.io" rel="nofollow">https:&#x2F;&#x2F;docs.roled.io</a>.<p>I&#x27;d really appreciate it if you gave it a try, and I am looking forward to any feedback on your experience!<p>I&#x27;m especially interested to know if any of you have a similar experience to mine. How did you solve it? Thanks!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49691404)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T03:01:49Z

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
