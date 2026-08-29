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

## Value Proposition

A single static binary that gives the asker what fail2ban gives them — automatic blocking of dictionary attacks against SSH — without making them ship a Python interpreter to every Linux server they administer. It tails the SSH authentication log (file or systemd journal), counts failed attempts per source IP, and blocks offenders via `iptables` or `nftables` on a dedicated chain. Allowlist configuration protects the operator from locking themselves out. The scope is the asker's stated scope: blocking dictionary attacks against SSH, nothing more.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small-fleet Linux admins with SSH exposed | Use key auth, keep password auth as a fallback, want fail2ban-style protection without Python. |
| Operators who want a single binary to `scp` onto a new host | No per-distro package dependency, no runtime to manage. |
| Small-shop sysadmins | Want a tool that ships as one file, runs as a service, and is gone when they uninstall it. |
| Anyone whose motivation matches the asker | "Blocking dictionary attacks against ssh is all I need." |

## Jobs To Be Done

1. **Functional job** — Watch the SSH auth log, count failed attempts per source IP, and block offenders at the firewall without installing a Python interpreter on the host.
2. **Emotional job** — Stop feeling the friction of "having to install a Python interpreter on every server" while still keeping dictionary attacks off the host.
3. **Social job** — Demonstrate that the asker's "single binary" requirement is met without sacrificing the SSH-attack protection they relied on fail2ban for.

## Success Metrics

- **Single-binary install** — operator ships exactly one file to the host and runs it; no package install, no runtime, no Python.
- **Dictionary-attack block rate** — share of incoming dictionary attacks that result in a ban within the threshold window, measured against a representative attack trace.
- **False-positive rate** — share of legitimate SSH attempts (key auth, the operator's own CIDR) that get banned; the allowlist is the structural guardrail.
- **Uninstall cleanliness** — removing the binary and the Systemd unit leaves the host's firewall ruleset untouched.
- **Boot footprint** — RSS and CPU at idle; the binary should sit quietly on a server with internet-exposed SSH without becoming the noisiest process.

## Pricing & Monetization

The post is silent on pricing. It is an Ask HN asking for an alternative to fail2ban; there is no product, no host, and no pricing model in the source capture. Absent beats invented.

## Competitive Landscape

- **fail2ban** — the alternative the asker explicitly references. Solves the same problem with a Python interpreter, regex filters, and a jail/chain model. The asker is happy with the protection, unhappy with the runtime footprint.
- **sshd's own `MaxAuthTries` and `LoginGraceTime`** — partial mitigation, but server-side only and stops at slowing attempts, not at banning the source.
- **CSF / ConfigServer Firewall** — a broader firewall suite with brute-force detection, but heavier than a single binary and not aligned with the "no Python, no extras" ask.
- **Cloud / VPS provider brute-force protection (AWS WAF, GCP Armor)** — cover the dictionary-attack shape but require the host to sit inside a specific cloud's controls; the asker's framing is a generic internet-exposed SSH server.

## Risks & Open Questions

- [ ] Confirm the host distribution's SSH log location (`/var/log/auth.log` vs. `/var/log/secure` vs. journal-only) and make the binary's log source configurable so it works on Debian-family, RHEL-family, and journald-only setups.
- [ ] Decide whether `iptables` or `nftables` is the primary backend; both exist on modern distros and one is the wrong default depending on the host's age.
- [ ] Self-lockout protection: the allowlist is required, not optional. The MVP must fail loudly if the allowlist is empty so the operator cannot ban themselves.
- [ ] Ban-duration policy: confirm the asker's posture (transient ban vs. long ban) before picking defaults — the post is silent on the exact window.
- [ ] Persistence across reboots: iptables rules are not persistent by default on most distros; the binary must either install a persistence rule or document the operator's responsibility clearly.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49477766) · **Category:** ask-hn · **Tags:** Ask HN, Problem
