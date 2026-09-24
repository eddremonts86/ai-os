# SPEC.md — How realistic is a modern-day era NLU

## Problem

I&#x27;m looking for people who are a bit more familiar with neural networks than me (I follow kaparthy&#x27;s tutorial once, that&#x27;s about it).<p>Lets say I like using LLMs for quality&#x2F;complex tool-calling to e.g. solve bugs, or just be a more sophisticated researcher.<p>But I don&#x27;t need it to write code for me. What would this look like? Would it just be a fancy NLU? Could you get a 3B tool that&#x27;s targeted towards tool-calling? or maybe a 1B?<p>It wouldn&#x27;t be more than just<p>```rust
USER:
cargo build fails with:
error[E0382]: borrow of moved value: `foo`<p>CONTEXT:
foo: Vec&lt;String&gt;<p>AVAILABLE TOOLS:
- read_file(path)
- ripgrep(pattern)
- rustc_explain(code)
- run_tests(...)<p>ASSISTANT:
&lt;tool&gt;rustc_explain {&quot;code&quot;:&quot;E0382&quot;}&lt;&#x2F;tool&gt;<p>TOOL:
Use of moved value...<p>ASSISTANT:
&lt;tool&gt;grep {&quot;pattern&quot;:&quot;foo&quot;}&lt;&#x2F;tool&gt;
```<p>I have a theory that scraping off the &quot;code-writing&quot; part would eat up a lot of time and size. I really don&#x27;t care that it writes code for me, it&#x27;s the best way to stay in the loop anyway, so off-loading this to a model is pretty useless for me. You could even test this against multiple tools. Maybe you could even use a frontier model to dig through earlier sessions and autoresearch better ways to improve this model.<p>Please let me know if something like this has been done before, and what the possibilities are today. I would love to dig deeper into this if there&#x27;s a slight chance this is possible.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49655550)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-11T09:21:33Z

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
