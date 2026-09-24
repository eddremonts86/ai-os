# SPEC.md — STXT, indentation-based format with schemas and no escape characters

## Problem

STXT is a human-first text format for documents: indentation-based, with namespaces and schemas written in the same language. It has very few rules, no escape characters, and is designed around simplicity and readability. The goal is a language that people write naturally, and machines parse securely and reliably.<p>Compared with XML, you keep namespaces and schemas, but without closing tags or escape characters. There is no entity expansion or external resource references either. Compared with YAML or TOML, every value is text (no Norway problem), a text block is literal, and schemas are STXT documents too.<p>The combination of STXT and Markdown allows validated and structured documents, with the expressiveness of Markdown.<p>To explain it, I&#x27;ve created the main portal <a href="https:&#x2F;&#x2F;stxt.dev" rel="nofollow">https:&#x2F;&#x2F;stxt.dev</a>, made with STXT itself (add .stxt to any URL to see the source). In the portal you can find all the specifications, the tutorial, VSCode extension, a CLI, parsers in Java, TypeScript, Python, and a playground: <a href="https:&#x2F;&#x2F;play.stxt.dev" rel="nofollow">https:&#x2F;&#x2F;play.stxt.dev</a>. All available in <a href="https:&#x2F;&#x2F;github.com&#x2F;stxt-lang&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;stxt-lang&#x2F;</a>.<p>An example in STXT (extra indentation for HN):<p><pre><code>  Book (com.example.library):
      Title: Modern Software Architecture
      Authors:
          Author: Keyla Brown
          Author: Joan Costa
      ISBN: 978-84-123456-7-4
      Published: 2026-08-25
      Summary &gt;&gt;
          This book offers a practical view
          of patterns and best practices
          for designing distributed,
          scalable systems.
</code></pre>
And the template with the structure and cardinality:<p><pre><code>  Template (@stxt.template): com.example.library
      Structure &gt;&gt;
          Book:
              Title: (1)
              Authors: (1)
                  Author: (+)
              ISBN: (1)
              Published: (1) DATE
              Summary: (?) TEXT
</code></pre>
Why STXT? I created STXT in the spring of 2013, as a language that preserves the most used of XML, while being able to be written by non-technical people. The first version was finished, different from the current one, but I never announced it. In 2014 my daughter was born; my priorities changed.<p>Time passed, other languages were created, and we arrived at 2025. In those years I didn&#x27;t find another format with the same balance of characteristics that STXT has, and I decided that was the time to resume the project.<p>Since then, I&#x27;ve been revising the language, using it for personal projects, and I consider it usable and stable.<p>I&#x27;d love to have your feedback, impressions and comments.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49681808)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T09:19:28Z

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
