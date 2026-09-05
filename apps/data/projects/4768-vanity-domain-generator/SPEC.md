# SPEC.md — Vanity Domain Generator

## Problem

When each of my kids got to the age that they started using email and having an online presence, I got them their own vanity domain by going to a &quot;fake word generator&quot; and then taking the best-looking fake words and doing a registrar search for it.<p>With my youngest son starting the process, I thought &quot;I&#x27;ll save time going back and forth and integrate the process.  Surely it can&#x27;t be that hard.&quot;  Making it happen was easy.  Making it something I would share was harder.<p>It&#x27;s implemented as a single-page app at <a href="https:&#x2F;&#x2F;vanitydomain.net" rel="nofollow">https:&#x2F;&#x2F;vanitydomain.net</a>, with all of the logic on the client side.  It takes the top 10k words in your language&#x27;s Wikipedia, and builds a Markov trigram model to make a plausable-ish word.  I tried more clever things, but they were all worse.<p>For each plausible word, it hits Cloudflare&#x27;s DNS (super cheap, fast, and scalable) as a low-pass filter, then checks the definitive RDAP server if it&#x27;s available.  It displays the words that passed both and gives you a link to register it (not monetized; it&#x27;s all good).<p>If you know someone who might benefit from having a vanity domain with a hosting site, infinite email addresses, and control of their own online presence, this might be a fun starting point.<p>Let me know if there are things that could make it better, or if you know of a better model for word generation.  It&#x27;s my fun-time project that might be a blessing to other people, so feel free to push it in a good direction.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49545776)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T03:58:55Z

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
