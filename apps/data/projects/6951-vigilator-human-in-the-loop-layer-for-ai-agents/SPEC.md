# SPEC.md — Vigilator – human-in-the-loop layer for AI agents

## Problem

Hi - I&#x27;m Noah, a student working out of the UK &amp; I&#x27;ve been building Vigilator for the past couple of months, Vigilator provides an agnostic solution for handling interrupts and observing agents as they work.<p>I was inspired to build Vigilator after I realised as teams roll out AI agents across organisations there&#x27;s no consistent way to interrupt an agent mid-task, get a
human decision, and resume - especially when multiple people can be responsible for weighing in on the decisions.<p>Vigilator provides a dashboard, where you and your teammates can join a virtual organisation - from here you can use our Py&#x2F;TS SDK or simply make API calls yourself - then from here tool calls can be approved&#x2F;reviewed&#x2F;denied and agents can be monitored as they work. We provide a workload management system meaning that you can have multiple team members at once handling interrupts and watching agents as they work.<p>Vigilator is still early, while Vigilator is framework agnostic I&#x27;ve primarily focused on adding support and examples for Mastra, Langchain Deep Agents and Langgraph - and I would love feedback, particularly from people running agents in production at scale.<p>try it: <a href="https:&#x2F;&#x2F;vigilator.ai" rel="nofollow">https:&#x2F;&#x2F;vigilator.ai</a><p>Docs: <a href="https:&#x2F;&#x2F;docs.vigilator.ai" rel="nofollow">https:&#x2F;&#x2F;docs.vigilator.ai</a> (conceptual overview: <a href="https:&#x2F;&#x2F;docs.vigilator.ai&#x2F;concepts" rel="nofollow">https:&#x2F;&#x2F;docs.vigilator.ai&#x2F;concepts</a>)<p>If you would like to get in contact feel free to shoot me an email at noah@vigilator.ai

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49695678)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T12:24:37Z

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
