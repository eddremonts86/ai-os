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

## Tech Stack

- **Binary:** Go, single static binary compiled with `CGO_ENABLED=0`. Go's standard library covers the log tailing, the systemd journal reader (via the small `go-systemd` sdjournal binding), and the HTTP/CLI surfaces; nothing else needs to be installed on the host.
- **Log source:** pluggable reader that handles both the SSH auth log file (Debian-family `/var/log/auth.log`, RHEL-family `/var/log/secure`) and the systemd journal (`journalctl -u sshd -f`), selected by config.
- **Detection:** simple sliding-window counter per source IP keyed off the well-known failure lines (`Failed password`, `Invalid user`, etc.). No external regex engine; the patterns compile at startup.
- **Firewall backend:** `iptables` and `nftables` both supported, configurable. The binary operates on a dedicated chain it creates and removes on startup / shutdown so the host's existing ruleset is untouched.
- **Allowlist:** CIDR list parsed from the config; an empty allowlist fails startup so the operator cannot lock themselves out.
- **Config:** TOML or YAML, single file, with threshold, window, ban duration, allowlist, log source, and firewall backend.
- **Service packaging:** a Systemd unit so the binary runs as a service on a fresh host.
- **Tests:** unit tests for the parser, the sliding-window counter, and the chain management; integration tests that replay a representative attack trace against a fake journal.
- **Release:** statically-linked binaries for `linux/amd64` and `linux/arm64` from CI; checksums published alongside.

## Architecture

The binary starts, reads its config, validates the allowlist (a non-empty allowlist is required), creates its dedicated firewall chain if it does not exist, and opens the configured log source. As SSH authentication failures arrive, the parser extracts the source IP, the sliding-window counter decides whether the IP is over the threshold, and the firewall backend adds a `DROP` (or `REJECT`) rule for that IP. A background goroutine expires the ban after the configured duration and removes the rule.

The log source is the only piece that varies per distro. A config flag picks between file mode (`tail -F` style reading of the SSH auth log) and journal mode (sd-journal streaming). Both modes produce the same parser input so the detection path is identical.

The firewall backend is abstracted behind a small interface with two implementations. `iptables` writes rules into a dedicated chain and uses `-m comment` to mark them so uninstall cleanly removes only its own rules. `nftables` uses a dedicated table with the same intent. Both implementations register a shutdown hook that tears down their chain on `SIGTERM`.

## Milestones

1. **M0 — Log reader + parser.** The binary tails the SSH auth log (file or journal) and emits structured failure events for `Failed password` / `Invalid user` lines.
2. **M1 — Sliding-window counter + threshold.** A source IP that crosses the configured threshold within the configured window is added to a "pending ban" list.
3. **M2 — Firewall backend (iptables + nftables).** A dedicated chain is created on startup, ban rules are added on threshold crossing and removed on expiry; shutdown tears down the chain cleanly.
4. **M3 — Allowlist enforcement.** The allowlist is required; an empty allowlist fails startup. Allowlisted IPs are never banned.
5. **M4 — Single static binary release.** CI builds `linux/amd64` and `linux/arm64`, publishes binaries with checksums, ships a Systemd unit and a config sample.

## Risks

- **Self-lockout** — the most credible failure mode. The allowlist-must-be-non-empty rule is the load-bearing safeguard; a permissive default that does not enforce it would burn the operator the first time they mistype a CIDR.
- **Distro log path drift** — Debian-family vs. RHEL-family put the SSH auth log in different files, and modern distros may run journal-only. A binary that hardcodes one path will silently miss events on the other.
- **Firewall backend correctness** — iptables vs. nftables rules differ, and iptables legacy vs. nft syntax differences on older distros can produce rules the kernel rejects. The MVP must test against both backends on real hosts.
- **Persistence across reboots** — neither iptables nor nftables rules persist by default; the operator must persist them, and the binary must be honest about that in the README.
- **Attack shape evolution** — slow-and-low dictionary attacks stretch the window; the MVP's threshold may need tuning per operator. Make the threshold and window configurable from day one.
