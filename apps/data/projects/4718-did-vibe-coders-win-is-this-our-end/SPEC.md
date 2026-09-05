# SPEC.md — Did Vibe Coders win? Is this our end?

## Problem

As much as I hate writing this, this has been bothering me for a while.<p>I keep seeing experienced software engineers, people who have been coding for 20 or 30 years, saying that software engineering isn’t going anywhere and that AI replacing engineers is nowhere close to reality.<p>I really want to believe them.<p>But a lot of the arguments sound familiar.<p>Two or three years ago, people said AI couldn’t really code. It couldn’t maintain context, understand large codebases, work sequentially, debug its own mistakes, or make changes across an entire repository.<p>And then coding agents happened.<p>They’re obviously not perfect, but in an incredibly short amount of time, many of those problems have gotten dramatically better.<p>So what makes the remaining problems fundamentally different?<p>The argument I hear now is that someone still needs to review the code, design the architecture, think about security, test everything, and supervise the agents.<p>But why does that “someone” necessarily have to be human?<p>Why couldn’t we have one agent writing code, another reviewing it, another handling architecture, another checking security, another testing, with a higher-level agent coordinating all of them?<p>We put enormous resources into making AI good at coding. What happens when we put the same effort into everything surrounding coding?<p>That’s what scares me.<p>I can imagine a future where you tell one agent what you want to build. It coordinates the other agents, builds the application, tests it, reviews it, checks security, and fixes problems.<p>Maybe you don’t even open the code anymore.<p>You open the application and say:<p>“This page is too slow.”<p>“This button should work differently.”<p>“Add this feature.”<p>And the system handles everything underneath.<p>At that point, what stops someone with zero traditional coding knowledge from building serious software?<p>We make fun of “vibe coders” today because eventually they hit a wall. They run into security issues, bad architecture, bugs, scaling problems, deployment problems, and all the other things that require actual engineering knowledge.<p>But how long does that wall stay there?<p>How long until another agent catches those problems?<p>Maybe there’s some fundamental limitation I’m missing. I genuinely hope there is.<p>Because I love coding.<p>I didn’t learn programming just because it was a good career. I genuinely love working through huge codebases, finding difficult bugs, understanding complicated systems, and building things piece by piece.<p>I love the craft itself.<p>And now I’m wondering whether coding eventually becomes something like mathematics: still incredibly valuable to understand, still practiced deeply by specialists and people who love it, but no longer something most people need to manually do to accomplish their goals.<p>Maybe even great engineers eventually spend most of their time talking to agents rather than writing code.<p>People say we’re living through one of the most exciting periods in technology, and I understand why.<p>But I’m having a hard time experiencing it that way.<p>I’m attached to this craft and to the skill I spent years developing. And I’m watching machines become better at it much faster than I expected.<p>Maybe I’m extrapolating too much. Maybe we’re about to hit a massive wall.<p>I genuinely don’t know.<p>But every time someone says, “AI can code, but it can’t do X,” I think about all the things people confidently said AI couldn’t do just two years ago.<p>That’s the part that scares me.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49543923)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-02T23:18:07Z

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
