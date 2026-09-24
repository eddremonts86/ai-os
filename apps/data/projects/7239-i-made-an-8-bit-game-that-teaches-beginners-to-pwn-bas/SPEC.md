# SPEC.md — I made an 8 bit game that teaches beginners to pwn basic C programs

## Problem

I&#x27;ve been hosting small CTF for my alma mater high school every summer for the last few years, usually in the form of a sequence of website-based challenges that students could complete in an hour or two. This year, now that LLMs are startingly more capable (and people claiming CTFs are dead), I wanted to see if I could design challenges in a way that would minimize the ability to &quot;drag and drop&quot; them into a simple chat window and have it be solved for you, and at minimum require some intuition and interaction from the players.<p>Seeing how bad frontier models were at the ARC AGI 3 benchmark (this pre-Astra), I thought it would be fun to translate aspects of pwning a program to spatial game-based mechanics and try to have some of the &quot;reasoning&quot; happen in the game world instead of all in code. This resulted in challenges where they have to interact with code to change parameters in the game to solve puzzles.<p>While players do have to read code, the game expects no prior knowledge of C programming specifically, and tries to explain concepts such as structs, byte hex encoding, null-terminated strings, endianness, etc. from scratch. It has 10 rooms and builds up to the player being made to do a buffer overflow to clear the final room. There are items the player acquires to inspect source code, see program memory, and translate raw bytes to unsigned 4-byte ints or ASCII strings.<p>There are still some gaps in the ramp up that could be better filled in and might require more hand-holding for complete beginners (I am thinking of adding an item that explains basic C semantics such as variables, conditionals, loops, I&#x2F;O etc. when you directly hover over the code in the computer). Would love feedback from people here!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49712697)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T14:04:04Z

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
