# SPEC.md — MCUHex – Flash and Live Monitoring for STM32 Devices over SWD

## Problem

I built MCUHex for monitoring  global&#x2F;static variables and flashing Arm Cortex-M devices over SWD protocol.<p>Connect ST-Link debug probe and drop .elf&#x2F;.out file. It parses the debug info into a tree of global&#x2F;static variables with types and addresses. You can read&#x2F;write addresses in the memory and watch them live in chart view. It can also flash .elf&#x2F;.hex&#x2F;.bin files.<p>I am considering to expand features such as; compiling, debugging, adding serial communication + RTT console, high rate frequency sampling for scope like visualization, shared workspaces, and firmware version management.<p>This is where I am kind of stuck and don&#x27;t want to invest more of my time just to create web version of what STM already does with its own tool set.<p><i>How much of your day is spent in STM environment, and what would you move to a browser tool like this product? What is missing on this so you end up not visiting&#x2F;using it anymore?</i><p><i>To be more spesific about how it actually works</i>; a tiny app that runs Python server built on pyOCD, holds the probe and talks to mcuhex over localhost. Distributed binaries for Windows &amp; MacOS are not signed, in case you want to avoid running unsigned binaries, this server can run from the console with Python these platforms including Linux. Application is just the compiled version of the mcuhex-sdk repository.<p>SDK: <a href="https:&#x2F;&#x2F;github.com&#x2F;omrdk&#x2F;mcuhex-sdk" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;omrdk&#x2F;mcuhex-sdk</a><p>It is completely free right now as it is in beta.<p>Happy to answer any questions and hear out your inputs. Thanks in advance.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49702621)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T19:30:49Z

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
