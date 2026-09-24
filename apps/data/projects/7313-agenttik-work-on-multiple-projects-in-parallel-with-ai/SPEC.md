# SPEC.md — Agenttik – work on multiple projects in parallel with AI agents

## Problem

Hi! I&#x27;ve been reading HN daily for almost 16 years. Really glad this community
exist. This is my first Show HN, so I hope you find this tool useful&#x2F;interesting.<p>During my summer holidays I started playing with latest AI models on personal
projects. At one point I started working in parallel with the same project and
tried different approaches. The one that worked best for me was to clone the
repo and distribute work among different AI workers, work in parallel but with
different branches &amp; folders. This allowed me to review and merge work
afterwards.<p>The thing is, spawning several agents in parallel was challenging. I could work
on multiple features and bugfix at once, but it was hard to keep track what I
was working on. I was jumping from one thing to another, and back; from one
window to another. Switching tasks like this was mentally exhausting.<p>Holidays were over, and after returning to my day to day work, I continued
working using a similar approach not on one, but also on multiple projects, but
I still could not find how to work in a more organized way without the mental
toll.<p>This space is growing really fast, and I haven&#x27;t been able to find the right
tool for myself, so I decided to build my own.<p>I wanted a tool that would help me manage multiple projects at once, work with
multiple agents, even from different providers, where I could chose between my
personal and work subscriptions depending on the project, where I could easily
review changes without leaving the tool if I wanted, or go all in and delegate
fully to agents; one where I had quick shortcuts to move around, where I could
schedule work or enqueue work for later so agents could work on one task after
another.<p>agenttik is my way of tackling this problem to work on multiple projects in
parallel, while allowing myself to be on the driver seat. I can give as much
autonomy as I want to the agents while keeping things organized in my head.<p>I&#x27;ve been hesitating for hours on whether to submit or not, but hey<p>&quot;if you are not ashamed of your project, you are shipping too late&quot;<p>Honestly, this project has exactly one week of development, started from
scratch, and even though it is still early on, it has been extremely useful for
me. I&#x27;ve built in a week things that would have taken me months, not only built
the tool itself but other projects as well (most of the merit is still on the
models used, but would have had no way of distributing all the work, though).<p>Feel free to try. Here&#x27;s how I would get started:<p>- Open a project you already have<p>- Add some general prompt (in the project area) or add to your
  AGENTS.md&#x2F;CLAUDE.md (to instruct it to do regular commits and&#x2F;or work with branches, and also instructions on how to build effective tests so that it can self-correct).<p>- Chose your subscriptin of choice: Claude Code &#x2F; Open AI subscription &#x2F; ...<p>- Pick big models (Opus High to Max &#x2F; Fable Medium to Max &#x2F; Astra Medium to Max)
  for bigger autonomy and try not to do hand-holding<p>Finally, start sending&#x2F;enqueuing tasks on all the features you want your product
to have, bugfixes, ... use a new prompt per task (Ctrl+T &#x2F; Cmd+T), I recommend
using big models to avoid investing your own time reviewing, and then once LLM
is done, review and archive that task or continue iterating. Keep adding tasks
as you think on them.<p>Add more projects as you start feeling comfortable.<p>It has been really addictive for me to see the speed of development when working
like this. I got totally hooked. Speed of iteration is insane.<p>Happy to discuss any feedback you have even if it is about other tools or ways
of working with AI these days! I hope you like it!!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49720222)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T23:24:53Z

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
