---
id: "439"
slug: the-build-step-is-easy-now-the-deploy-step-is-where-eve
title: "The build step is easy now, the deploy step is where every small tool dies"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0mio/the_build_step_is_easy_now_the_deploy_step_is/"
category: saas
date: "2026-08-14"
tech: [Vite, TypeScript, Node.js (Hono), Docker, Caddy, Hetzner, GitHub Actions]
---
# The build step is easy now, the deploy step is where every small tool dies

## Tech Stack

Chosen for this problem:

- Vite
- TypeScript
- Node.js (Hono)
- Docker
- Caddy
- Hetzner
- GitHub Actions

## Architecture

Single Go binary on a Hetzner VPS; Caddy reverse proxy with auto-TLS; systemd unit per deployed service; GitHub Actions for upstream build.

## Milestones

- CLI binary that takes a Git URL + domain + port and produces a running service
- Caddy integration with auto-TLS
- systemd unit generation and install
- Health check + log rotation defaults

## Risks

- Multi-language build support is the main risk
- VPS hardening is left to the user
