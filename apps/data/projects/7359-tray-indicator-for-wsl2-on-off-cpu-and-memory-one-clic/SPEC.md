# SPEC.md — Tray indicator for WSL2: on/off, CPU and memory, one-click shutdown

## Problem

When using my PC for private stuff like gaming or video editing I wanted an direct way (without calling wsl --shutdown) of turning WSL2 off. Created (with a help of Claude, it is 2026...) a small tray tool which barely uses resources and provides also resources usage info.<p>Grey means the VM is off. Green, orange or red means it is running, coloured by the higher of its CPU and memory share of the machine. Hover for the numbers, menu entry to shut it down.<p>Two things that were not obvious:
* Presence is the vmmemWSL process existing. WSL reports on distributions, not on the VM.
* CPU and memory come from NtQuerySystemInformation(SystemProcessInformation). vmmemWSL runs as SYSTEM, so OpenProcess is denied to a normal user and GetProcessTimes is out. A snapshot of ~250 processes takes 3.8 ms and needs no handle.<p>Rust, windows-sys only. 282 KB exe, 3.9 MB private memory after half an hour, one thread while idle. Working set is 10 to 19 MB, mostly shared DLLs.<p>Targeted for Windows 11. Older Win10 builds call it vmmem (Use -process flag). Shutdown asks for confirmation. BSD 3-Clause.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49724577)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T10:48:15Z

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
