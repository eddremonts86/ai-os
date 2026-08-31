---
id: "3812"
slug: n8n-community-node-for-shotium-screenshot-and-og-image-
title: N8n community node for Shotium – screenshot and OG image API
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495905"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [n8n community node, TypeScript, Shotium REST API, headless browser rendering, OG image templates, n8n credential framework]
---
# N8n community node for Shotium – screenshot and OG image API

## Tech Stack

Drawn from the repository contents, which the capture links directly.

- **n8n community node framework:** the nodes/Shotium package structure n8n loads for community nodes.
- **TypeScript:** the node implementation language with n8n's declarative node and credential styles.
- **Shotium REST API:** the screenshot and OG image endpoints the node calls (GET /v1/me for credential tests).
- **n8n credential framework:** declarative credential with a validation endpoint and field-level secrets (API key, signing secret, UID).
- **Binary data output:** n8n's binary item flow for handing images to S3, email, Telegram and disk nodes.
- **MIT license plus npm packaging:** community-node distribution with versioned releases (0.1.0 to 0.1.3).

## Architecture

- **Node definitions:** three operations — Take Screenshot, Generate OG Image, Generate Signed URL — with typed parameters.
- **Credential layer:** Shotium API credential validated against GET /v1/me (free, no credits consumed).
- **Render calls:** screenshot and OG requests to the Shotium API; binary responses become n8n binary items.
- **Signed URL path:** JSON output carrying a url field for downstream CMS or og:image wiring.
- **Release pipeline:** npm publishing for community-node installation.

## Milestones

1. **M0 — Working node.** The three operations run against a real Shotium account on a local n8n instance.
2. **M1 — Credentials and billing behavior.** Declarative validation passes; 429 quota exhaustion and success-only billing surfaces are handled.
3. **M2 — n8n verification.** The node is accepted into n8n's community-node registry — the repo's stated gate.
4. **M3 — Ecosystem reach.** Google sign-in in the main repo plus a blog announcement pointing the no-code audience at the node.

## Risks

- **Verification latency:** n8n review is external; the repo's own docs condition audience reach on it.
- **Quota errors in workflows:** a 429 mid-workflow can break a chain unless documented and retried deliberately.
- **API coupling:** the node's value is the Shotium API; feature or pricing changes upstream land here first.
- **Early maturity:** version 0.1.x with ten commits means the compatibility matrix is thin.
