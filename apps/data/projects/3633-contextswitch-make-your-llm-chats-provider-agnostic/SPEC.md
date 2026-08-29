---
id: "3633"
slug: contextswitch-make-your-llm-chats-provider-agnostic
title: ContextSwitch – Make your LLM chats provider agnostic
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481375"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Manifest V3, TypeScript, Vite, chrome.storage.local, Playwright (dev-time selectors), Vitest]
---
# ContextSwitch – Make your LLM chats provider agnostic

## Problem

The capture for this plan is a single URL — contextswitch-blue.vercel.app — and the title "ContextSwitch – Make your LLM chats provider agnostic." The page itself is more specific: it is a browser extension that lets a user copy a thread from one LLM provider and paste it into another, so a conversation started on ChatGPT can be continued on Claude or Gemini without retyping. The site's three-step framing is the spec: extract the current chat, pick a destination, and the extension opens the destination provider and pastes the thread into the composer for the user to send themselves.

The site states the privacy posture verbatim and that statement is load-bearing: "ContextSwitch does not send conversations to a ContextSwitch server." Transfer reads the current page and inserts text into the destination composer, and the extension only requests access to ChatGPT, Claude and Gemini. The "local-first" label in the page footer is the same claim restated. Anything that would imply a server-side hop between extraction and paste breaks the contract the source makes with the user, and the plan is built to honour that.

The title's framing — "provider agnostic" — describes the user-facing abstraction rather than a wire-protocol claim. ContextSwitch does not speak any provider's internal API; it operates at the level of the rendered page, reading the conversation from the DOM and writing into the destination composer. That has two consequences the plan respects: first, the extension is fragile to site redesigns, which the page's contact section calls out by inviting reports of "a selector that broke after a site redesign"; second, the user remains the one who clicks send, which the page makes explicit ("You send the message yourself"). Both are constraints, not bugs.

The destination amount is also in the source: the user chooses between the full conversation, the last 10 messages or the last 20. Anything finer-grained than that is not promised by the page and is not invented by this plan. The extension is for Chrome and Edge, listed on the Chrome Web Store and Edge Add-ons when the review process finishes, which is the realistic distribution surface.

## Objective

Ship a Chrome and Edge browser extension that reads a conversation from ChatGPT, Claude or Gemini in the user's current tab and pastes it into another provider's composer, with three context-size options (the full conversation, the last 10 messages, or the last 20). The transfer happens entirely on the client; no ContextSwitch-operated server receives the conversation. The extension only requests the host permissions it needs to read those three providers and to write into the destination composer. The user clicks send themselves, and the extension never auto-sends.

## Target Users

- Users who started a conversation on one LLM provider and want to continue it on another without retyping the thread.
- People who deliberately compare providers on the same prompt and who need a way to move a conversation between them without losing context.
- Privacy-first users who refuse to send conversation content to a third-party "migration" service and want a tool that runs only inside their own browser.
- Power users on multiple providers who treat any single one as a context-window-bounded tool and switch as windows fill.
- Edge and Chrome users who want an extension rather than a bookmarklet, so the operation is one click away.
- Users who care about cost or rate limits on one provider and want to move a long thread to a different provider without paying to re-type it.
- People who lost access to a provider (for example, after a price change) and want their past threads moved somewhere they still pay.

## MVP Scope

- A Manifest V3 browser extension for Chrome and Edge, installable from the Web Store and Add-ons once review completes.
- Three supported source providers — ChatGPT, Claude and Gemini — each with a content-script that extracts the conversation from the current page DOM.
- Three supported destination providers — the same three — with a content-script that pastes the chosen slice into the destination composer.
- A user-facing UI offering three context-size options: the full conversation, the last 10 messages, or the last 20.
- A flow that opens the destination provider in a new tab and inserts the chosen slice into the composer, where the user clicks send themselves.
- Permissions scoped to the three providers' origins only; no broad host permissions and no remote-script permissions.
- No network endpoint on a ContextSwitch-operated server; the extension reads the page, writes into the composer, and stops.
- A contact path for reporting selectors that broke after a site redesign, since site changes are the realistic failure mode.
- Local state for the most recent transfer (for re-run or audit) stored in chrome.storage.local so it stays on the device.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The page states "ContextSwitch does not send conversations to a ContextSwitch server"; any feature that would require a server-side hop breaks the stated contract.
- The extension only requests host permissions for ChatGPT, Claude and Gemini; broader host permissions would violate the page's privacy posture.
- The three context-size options in the source are the full conversation, the last 10 messages, or the last 20; finer granularity is not promised and is not invented here.
- The user clicks send themselves; auto-send would change the tool's character and is not in the stated flow.
- Site redesigns break selectors, which the page's contact section acknowledges; the selector strategy has to be resilient enough that small layout changes do not silently lose content.
- Manifest V3 imposes constraints on background scripts, remote code and host permissions that the extension has to respect; older MV2 patterns are not a fallback.
- Browser store review processes gate the public listing, so the deployment story is gated on reviews finishing rather than on shipping the binary.
- The local-first claim means the extension cannot depend on a ContextSwitch-side analytics endpoint, a remote update channel or a crash-reporting service that transmits user content.
