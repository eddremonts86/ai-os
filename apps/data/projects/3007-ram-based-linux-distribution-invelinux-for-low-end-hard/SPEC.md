---
id: "3007"
slug: ram-based-linux-distribution-invelinux-for-low-end-hard
title: "RAM based Linux distribution Invelinux for low-end hardware, 1.0 Stable"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49431956"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# RAM based Linux distribution Invelinux for low-end hardware, 1.0 Stable

## Problem

Hi, I am sumtas!I want to present a pretty cool project to Hacker News that I have been working on for the last 8 months. It is an independent, initramfs based distribution tailored for older computers that might be going to the landfill. It has a collection of QoL features for power users who want to try this niche operating system on their hardware.1. It saves system configurations (/etc), applications (/bin), user configurations (/usr) into an external drive with a partition named "INVEL_AMPS". These directories can be accessed from the /storage/AMPS directory.
2. To install applications on this persistent drive, Invelinux uses its custom made package manager called AMPS (Automatically Mounted Packaging System). Its syntax and commands are relatively straightforward for beginners since it is also coded in Bash.
3. The system keeps itself minimal with the Toybox userland and the musl C library, and its init system is like SysV inits. As init, systemd is avoided entirely. Invelinux uses Toybox's init with relatively easy to understand shell scripts, a user can add their own scripts inside the /etc/init.d/rc.d directory to manage their systems seamlessly.
4. Due to its minimalistic architecture, this distribution can run on almost any low-end hardware with an amd64 processor.
5. As a window manager (yes there is a window manager), Wayland's reference compositor Weston was chosen due to its lower dependency track and simple customizability using simple .ini scripts, although in the future Lua support could be added for further customization.As a senior year high school student, it isn't the easiest project to maintain and it certainly takes time. If you want to support this project's growth without donating anything, you can star our Codeberg repository or create an issue on a bug you might find while testing out the operating system.You can also just comment by giving feedback that would mean a lot to me and to this project. Thanks!- sumtasCodeberg Repo: https://codeberg.org/sumtas/invelinux
Wiki/Handbook: https://sumtas.codeberg.page/wiki

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
