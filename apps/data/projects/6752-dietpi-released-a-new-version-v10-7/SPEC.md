# SPEC.md — DietPi released a new version v10.7

## Problem

DietPi is a lightweight Debian based Linux distribution for SBCs and server systems, with the option to install desktop environments, too. It ships as minimal image but allows to install complete and ready-to-use software stacks with a set of console based shell dialogs and scripts.<p>The source code is hosted on GitHub: https:&#x2F;&#x2F;github.com&#x2F;MichaIng&#x2F;DietPi
The main website can be found at: https:&#x2F;&#x2F;dietpi.com&#x2F;
Wikipedia: https:&#x2F;&#x2F;de.wikipedia.org&#x2F;wiki&#x2F;DietPi<p>The project released the version DietPi v10.7 on September 12th, 2026.<p>The highlights of this version are:<p>LubanCat 4: New image
ARMv8 Virtual Machines: Images for testing generated
Containers with network: Added support for virtual network, providing images with network stack and SSH server pre-installed
Homebox: New software package, self-hosted home inventory and organisation system
Scrypted: High performance video integration and automation platform
dietpi-network:  New tool, allows to configure multiple Ethernet(-like) and WiFi interfaces
Allwinner SBCs: USB DVB device drivers re-added to the kernel packages
dietpi-banner: Fail2Ban status now also counts bans for whole subnets
dietpi-timesync: &#x2F;boot&#x2F;dietpi&#x2F;func&#x2F;run_ntpd renamed to dietpi-timesync
Chromium: Some flags removed from our config &#x2F;etc&#x2F;chromium.d&#x2F;dietpi
Fixes for Raspberry Pi, Orange Pi 5&#x2F;5B&#x2F;3 LTS, Radxa ROCK 3A, dietpi-banner, Ampache, WiringPi, Roon Bridge, Immich<p>The full release notes can be found at: https:&#x2F;&#x2F;dietpi.com&#x2F;docs&#x2F;releases&#x2F;v10_7&#x2F;

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49683146)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-13T12:15:45Z

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
