# SPEC.md — Authorizer – open-source auth for enterprise apps and agents

## Problem

I&#x27;m Lakhan, the creator and maintainer of Authorizer. I&#x27;ve been working on it for a few years.<p>Authorizer is an open-source authentication and authorization server that can be self-hosted.<p>The project started around authentication for applications and users. Over time, I started running into a broader set of problems involving services, workloads, and agents making requests.<p>That&#x27;s a big part of what led to the work in 2.4.<p>One area I spent a lot of time on was delegation. An agent can need to act on behalf of a user and then call another service or agent. Passing the user&#x27;s original access token through every step makes it difficult to keep the user&#x27;s permissions separate from the permissions of the agents acting on their behalf.<p>Authorizer 2.4 adds OAuth token exchange using RFC 8693 for this. Delegated tokens carry an actor chain, and the effective scope is attenuated based on the subject token, the agent&#x27;s allowed scopes, and the requested scope.<p>The release also adds service accounts using OAuth client credentials for machine-to-machine authentication. Service accounts can authenticate using JWT bearer assertions, SPIFFE JWT-SVID, or Kubernetes TokenReview when workload identity is configured.<p>Another significant part of the release is MCP. Authorizer can expose its MCP surface over Streamable HTTP and protect it as an OAuth 2.1 resource server. It implements protected resource metadata, Dynamic Client Registration, Client ID Metadata Documents, and RFC 8707 audience binding for the MCP endpoint.<p>The release also adds a number of enterprise identity features: SAML 2.0 and OIDC federation, SCIM 2.0 user and group provisioning, organizations, WebAuthn&#x2F;passkeys, and relationship-based authorization using an embedded OpenFGA engine.<p>Service accounts can also be represented as first-class subjects in the authorization model, so authorization can distinguish between a user and an autonomous workload.<p>I wanted Authorizer to remain self-hostable. There are good hosted authentication services, but some teams need to run their identity infrastructure themselves or want control over where it runs.<p>If you want to try Authorizer, there is a Railway deployment template:<p><a href="https:&#x2F;&#x2F;railway.com&#x2F;deploy&#x2F;authorizer-1?referralCode=FEF4uT&amp;utm_medium=integration&amp;utm_source=template&amp;utm_campaign=generic" rel="nofollow">https:&#x2F;&#x2F;railway.com&#x2F;deploy&#x2F;authorizer-1?referralCode=FEF4uT&amp;...</a><p>The source is here:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;authorizerdev&#x2F;authorizer" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;authorizerdev&#x2F;authorizer</a><p>Getting started:<p><a href="https:&#x2F;&#x2F;docs.authorizer.dev&#x2F;getting-started&#x2F;" rel="nofollow">https:&#x2F;&#x2F;docs.authorizer.dev&#x2F;getting-started&#x2F;</a><p>The complete 2.4.0 changelog:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;authorizerdev&#x2F;authorizer&#x2F;blob&#x2F;main&#x2F;CHANGELOG.md#240---2026-08-19" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;authorizerdev&#x2F;authorizer&#x2F;blob&#x2F;main&#x2F;CHANGE...</a><p>I&#x27;m particularly interested in how other teams are handling identity and delegation when agents need to call multiple services or act on behalf of users.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49536219)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T13:50:25Z

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
