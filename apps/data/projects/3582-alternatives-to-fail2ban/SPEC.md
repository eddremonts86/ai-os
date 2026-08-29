---
id: "3582"
slug: alternatives-to-fail2ban
title: Alternatives to Fail2ban?
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49477766"
category: ask-hn
date: "2026-08-28"
tags: [Ask HN, Problem]
tech: [Go, systemd journal, iptables, single static binary]
---
# Alternatives to Fail2ban?

## Problem

The asker administers a small number of Linux servers that run an SSH server exposed to the internet. They connect with a cryptographic key but still leave password authentication enabled "in case of trouble (perhaps I'm being overly cautious)" — a fallback posture they want to keep, not remove.

Fail2ban has worked for them. The specific friction is operational, not functional: "I'm annoyed at having to install a Python interpreter on every server." They want an alternative that is just a single binary. They are explicit about the scope: it does not need every fail2ban feature — blocking dictionary attacks against SSH is all they need.

## Objective

Ship a dependency-free fail2ban alternative as a single static binary that runs on a Linux server with internet-exposed SSH, tails the SSH authentication log (the file or the systemd journal), detects dictionary attacks, and blocks the source IPs at the firewall. The buildable artifact is one binary; the host does not need a Python interpreter, a package manager of any specific ecosystem, or a runtime. The MVP scope is the SSH-dictionary-attack case the asker named, not a general-purpose intrusion-response system.

## Target Users

- Operators of a small fleet of Linux servers with SSH exposed to the internet who use key auth but keep password auth enabled as a fallback.
- People who like what fail2ban does but dislike having to ship a Python interpreter to every host they administer.
- Small-shop sysadmins who want a single-binary tool they can `scp` onto a new host and run, with no per-distro package dependency.
- Anyone whose motivation matches the asker's wording: "blocking dictionary attacks against ssh is all I need."

## MVP Scope

- A single static binary, no Python runtime, no runtime dependencies beyond libc and the kernel.
- Tails the SSH authentication log: the file (`/var/log/auth.log` or `/var/log/secure` depending on distro) and the systemd journal; either input is acceptable, configurable per host.
- Detects SSH dictionary attacks using the standard failure-pattern log lines (e.g. `Failed password`, `Invalid user`) the asker implicitly relies on.
- Counts failed attempts per source IP over a sliding window and applies a configurable threshold (the asker's "blocking dictionary attacks" use case).
- Blocks the source IP at the firewall using `iptables` (and/or `nftables`, configurable) on a separate chain so the binary does not own the host's full firewall ruleset.
- Unblocks IPs after a configurable ban duration so the policy does not become permanent.
- Allowlist for the operator's own IPs (and any CIDR ranges they configure) so the operator never locks themselves out.
- Config file in a small, readable format (TOML or YAML), with threshold, window, ban duration, allowlist, log source, and firewall backend.
- Systemd unit so the binary runs as a service on a fresh host.
- Out of scope for MVP: support for protocols other than SSH, web dashboards, distributed / multi-host coordination, log enrichment beyond what the SSH log itself contains.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49477766` follows the constraints in `3582-.../SPEC.md` and the chosen stack (Go, systemd journal, iptables, single static binary). The asker's framing is utilitarian: "is there an alternative to fail2ban that is just a single binary?" The visual surface is therefore a CLI binary, a small config file, and a Systemd unit. There is no dashboard, no UI, no web layer.

For ask-hn category, the defaults lean toward a tool-first surface: a binary on the release page, a config snippet, and a README that explains how the binary replaces the Python interpreter dependency, since that is the asker's stated pain.

**Color** — terminal defaults; one accent for the "banned" event line, one muted accent for the "unbanned" line. No UI, no gradients.

**Type** — one mono family, used everywhere (CLI, config samples, log lines). The product is a daemon; the type system serves the terminal.

**Density** — tight, table-shaped output for the status command; generous spacing in the README so a new operator can wire it in five minutes.

**Motion** — none. The product is a daemon; motion lives in logs and ban events.

## Constraints

- Single static binary: the asker is explicit that they do not want to install a Python interpreter. The MVP must not require a Python runtime, a JVM, a Node runtime, or any package-manager-driven dependency at runtime.
- Blocking dictionary attacks against SSH is the asker's stated scope; do not widen the MVP to other services, other protocols, or other log shapes.
- Linux is the only supported host family. The binary may target `linux/amd64` and `linux/arm64`.
- The binary must not own the host's full firewall ruleset — it operates on a dedicated chain it creates and removes, so uninstalling the binary leaves the host's firewall untouched.
- The binary must not lock the operator out. Allowlist configuration is required (not optional) so the asker can protect themselves from a self-imposed ban.
- The host already has key auth enabled; password auth stays on as a fallback. The binary's job is to keep that fallback usable, not to remove it.
