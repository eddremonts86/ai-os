# SPEC.md — ColliePWA a mobile interface for AI agents in herdr/tmux/zellij

## Problem

Sharing the PWA[1] I built over the last couple of weeks to access my terminal sessions&#x2F;agents when not in front of my computer. This started off as a weekend experiment right when herdr[2] (terminal multiplexer) released the functionality to write custom plugins and it&#x27;s been quite helpful to me ever since. The general idea is that this runs a web app on the host machine which is then exposed through a front door implementation like tailscale&#x2F;netbird&#x2F;cloudflare tunnels etc.<p>A lot of devs&#x2F;teams are building sth very similar to this right now so there are many options out there already but I wanted: A PWA (no app store dep), better keyboard support than termux, the ability to manage multiple machines and easy integration with my existing tailnet via headscale.<p>Some of the other features
- Push notifications
- Support for tmux and zellij (experimental).
- Voice transcriptions (Codex sub or API)
- Custom commands<p>You can check out a live demo with dummy data on the website[1] or look at the implementation on Github[3] (PRs welcome).<p>Looking forward to receiving some feedback or learning more about how people access&#x2F;work with their agents on the go. Also if you encounter any bugs please report them on Github, if a feature is missing you&#x27;d really want to see, open a discussion.<p>[1] <a href="https:&#x2F;&#x2F;colliepwa.dev" rel="nofollow">https:&#x2F;&#x2F;colliepwa.dev</a>
[2] <a href="https:&#x2F;&#x2F;herdr.dev">https:&#x2F;&#x2F;herdr.dev</a>
[3] <a href="https:&#x2F;&#x2F;github.com&#x2F;AltanS&#x2F;collie" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;AltanS&#x2F;collie</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49630842)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T18:11:46Z

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
