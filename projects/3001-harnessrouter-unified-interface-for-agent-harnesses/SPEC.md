---
id: "3001"
slug: harnessrouter-unified-interface-for-agent-harnesses
title: "HarnessRouter: Unified interface for agent harnesses"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49335595"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# HarnessRouter: Unified interface for agent harnesses

## Problem

Hey HN! We are building HarnessRouter, a canonical API for running Codex, Claude Code, Hermes, and other managed agent harnesses as your product backend.Before building HarnessRouter, I used to build our own agent harness for our products. I tried LangGraph, agent SDKs from different vendors, pydantic, LLM tool use / function call, and so on. It's a very heavy lifting engineering effort, and I am disappointed about the agent deliveries compared to what Codex, CC can deliver. That changed my mindset. The frontier labs and famous open source communities are already putting so much engineering effort to build the world's best harnesses, why not leverage them directly instead of building our own, just like how we call LLM chat completion endpoints instead of training our own models?We provide a docker image to run HarnessRouter locally.----------Quickstart: docker pull harnessrouter/harnessrouter

 docker run -d --name harnessrouter -p 127.0.0.1:3000:3000 -v harnessrouter:/data harnessrouter/harnessrouter

 docker logs -f harnessrouter

 Wait for the "ready on :3000" show up, then open the browser at http://localhost:3000.
 Default username/password is harnessrouter/harnessrouter

 Then in Integrations page, add your model provider credentials or API keys.
 In Harnesses tab, as of today we provide routing to Codex, Claude Code, and Hermes as base harnesses.
 You can customize any of them and configure harness instruction, MCP tools, and skills.

 Then go to Tasks and let them do jobs.

----------Every harness has its own request/response format and incompatible with each other. We propose Unified Harness Procotol [1] to standardize how an application talks to an agent harness. It covers harness selection and configuration, task execution, event streaming, sessions start cancel and resume, artifact management and delivery, and failure handling. It's similar idea like LiteLLM, but for harnesses rather than models.HarnessRouter implements UHP. We provide an AGENTS.md [2] and your coding agent can follow it to integrate your application with the harnesses available.We also provide starter kits [3] to demonstrate some types of agentic products that can be built on HarnessRouter. It currently includes PPT agent, Spreadsheet agent, BI Dashboard agent, and Video generation agent.Can't wait to hear what you think![1] https://unifiedharnessprotocol.org[2] https://harnessrouter.ai/agents.md[3] https://github.com/harnessrouter/starter-kit

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
