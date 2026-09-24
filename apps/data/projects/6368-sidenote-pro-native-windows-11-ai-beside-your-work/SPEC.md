# SPEC.md — SideNote Pro – Native Windows 11 AI beside your work

## Problem

I have been using ChatGPT (mainly) as my main AI tool, but sometimes also DeepSeek and other AI providers.<p>But with repetitive tasks, it became annoying for me to switch tabs and navigate to the ChatGPT tab in the web browser, leaving the Excel document and my focus behind just for a quick question, some text processing, or image identification.<p>This is how I came up with the idea of having an assistant right beside the workspace that can be pinned and docked to the side of the display. On today&#x27;s wide displays, it fits really well.<p>It has a visible handle&#x2F;leash on the right side of the display and can be invoked via a keyboard shortcut.<p>I find myself using it often because a question in Photoshop or Premiere Pro doesn&#x27;t require me to leave to open the browser; I can just invoke it and get the response quickly.<p>So, it started to become more than a simple chatbox, adding features such as file indexing in a selected folder. It also supports uploading images or screenshots, or directly pasting image crops into the composer.<p>Also, a nice feature I like a lot is that you can assign a prompt&#x2F;action to a global shortcut and run it on the selected text.<p>For instance, it can translate a paragraph by selecting the paragraph and pressing the keyboard shortcut Ctrl+Shift+T; the assistant will appear and stream the answer.<p>It supports BYOK (bring your own key) and OpenAI-compatible AI providers, as well as local ones such as Ollama, making it an easy frontend for a locally running LLM.<p>It is built natively for Windows 11 in C# and is available for download from the Microsoft Store.<p>I am very interested to hear whether you find switching tabs annoying and whether such a tool could help.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49654117)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T06:06:43Z

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
