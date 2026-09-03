# SPEC.md — Dashwise – A customizable all-in-one homelab dashboard

## Problem

I&#x27;ve been building Dashwise, an open-source &quot;all-in-one&quot; homelab dashboard for about a year.<p>One thing that has always bothered me about homelab dashboards is configuration. Many of them look great, but setting everything up through large config files can become tedious. With Dashwise, I&#x27;m trying to make the dashboard itself easy to configure while also keeping integrations flexible.<p>## Built-in apps<p>* *Shortcuts:* A Spotlight-like search for your homelab. Integrations can expose actions and shortcuts directly to the search bar.
* *News:* Subscribe to RSS feeds and group multiple feeds together.
* *Notifications:* Send notifications to Dashwise from Shoutrrr-compatible applications or through plain HTTP requests.
* *Frame:* Turn the dashboard into a customizable smart display&#x2F;screensaver.
* *Links:* Store and organize bookmarks. This is still in an early prototyping phase.<p>## Integrations<p>With many dashboards, creating an integration that feels truly native requires modifying the dashboard&#x27;s code rather than adding plugins.<p>Dashwise integrations are instead defined using YAML. They can fetch data from REST APIs and display it using reusable widget templates.<p>An additional benefit of this approach is that the integration format is simple enough for LLMs to generate integrations fairly easily.<p>## Where it&#x27;s going<p>I&#x27;m planning to keep expanding the integration ecosystem and experiment with more ways for external tools to interact with Dashwise.<p>For example, one thing I&#x27;m planning is a CLI that can report the progress of long-running commands and display it directly inside Dashwise.<p>If you have any feature requests or feedback, let me know!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49522428)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T14:23:25Z

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
