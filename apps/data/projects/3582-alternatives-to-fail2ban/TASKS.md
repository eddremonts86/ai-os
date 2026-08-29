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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Pick the license (a permissive OSS license aligned with a single-binary distribution)
- [ ] Set up the Go module with packages: `config`, `logsource`, `parser`, `window`, `banstore`, `fw`
- [ ] Define the config schema: `threshold`, `window`, `ban_duration`, `allowlist[]`, `log_source`, `firewall_backend`
- [ ] Stand up a Systemd unit (`failban.service`) and a packaging note for the single static binary
- [ ] Decide on TOML vs. YAML for the config; pick one and ship a config sample
- [ ] Validate the allowlist-at-startup rule: an empty allowlist must refuse to start

## Phase 1: Core

- [ ] Implement the SSH auth log file reader (tail-style, configurable path, distro-agnostic)
- [ ] Implement the systemd journal reader (sd-journal streaming for `sshd` unit)
- [ ] Implement the parser: extract source IP from `Failed password` and `Invalid user` lines, both IPv4 and IPv6
- [ ] Implement the sliding-window counter per source IP, keyed off the configured window length
- [ ] Implement the threshold logic: IP over the threshold within the window becomes a ban
- [ ] Implement the iptables backend: dedicated chain, ban rules with `-m comment`, clean shutdown
- [ ] Implement the nftables backend: dedicated table, equivalent semantics, clean shutdown
- [ ] Implement ban expiry: a background goroutine removes the rule after `ban_duration`
- [ ] Implement the allowlist enforcement: allowlisted CIDRs are never banned; empty allowlist fails startup
- [ ] Add structured logs for ban events, unban events, and config-load failures
- [ ] Unit tests for the parser, the sliding-window counter, and the chain management
- [ ] Integration tests that replay a representative SSH-dictionary-attack trace against a fake journal
- [ ] End-to-end test on a real host: start the binary, run a dictionary attack from a known IP, observe the ban

## Phase 2: Deploy

- [ ] CI builds static binaries for `linux/amd64` and `linux/arm64`; checksums published on the release page
- [ ] GitHub release with the binary, the Systemd unit, the config sample, and the README
- [ ] README that explains the exact install path: copy the binary, drop the unit, fill in the allowlist, enable the service
- [ ] A documented uninstall that removes the Systemd unit, the binary, and the dedicated firewall chain — leaving the host's firewall ruleset untouched
- [ ] Honest note in the README on firewall-rule persistence across reboots (the operator's responsibility)
- [ ] First three operators onboarded on real hosts (one Debian-family, one RHEL-family, one journal-only); collect feedback on log-path coverage and false-positive rate
