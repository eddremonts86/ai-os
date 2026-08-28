---
id: "3126"
slug: neoswarm-neovim-for-controlling-ai-agents
title: Neoswarm – Neovim for controlling AI agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450219"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Neoswarm – Neovim for controlling AI agents

## Problem

The Show HN post links to https://neoswarm.dev/ but the scraper captured only the link. From the title alone, Neoswarm is a Neovim-based interface for driving and supervising AI agents.

## Objective

Let a developer steer multiple AI agents from inside their existing Neovim workflow, rather than from a separate web UI or terminal session.

## Target Users

Developers who already live in Neovim and who use AI coding agents (Claude Code, Codex, Aider and similar) regularly enough to want a unified control surface.

## MVP Scope

A Neovim plugin that surfaces one or more running AI agents in buffers or a sidebar, with commands to send prompts, view output and steer the agent.

## Constraints

The source provides no detail on which agent runtimes are supported, whether Neoswarm is a wrapper or a UI, or how multi-agent coordination works; everything beyond the title is TODO.
