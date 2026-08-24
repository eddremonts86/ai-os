---
id: "2095"
slug: lilscript-makes-javascript-libraries-smaller
title: LilScript makes JavaScript libraries smaller
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49374554"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# LilScript makes JavaScript libraries smaller

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ https://yeargun.github.io/lilscript/LilScript is a typed, compression-first language that compiles into js and sometimes into exec(will be more stable in future). The compiler mangles, reshapes the program into optimized js that happens to be 5-15% smaller (after gzip/br compression or raw) compared to the best performing JS toolchains like oxc/esbuild/terser/..## What has been proven to work with LilScript?- makes VSCode's core js modules 20% smaller on average- makes the world's most performant & small markdown rendering npm library, marked, 5-7% smaller and 10% faster- and many more demos.. works with pretty much any js/ts library## How it is compressing js finer than vite/oxc/terser/esbuild/..### 1. By changing the app.```
class Vector {
 float x;
 float y; init(float x, float y) {
 this.x = x;
 this.y = y;
 }

 float lengthSquared() {
 return this.x * this.x + this.y * this.y;
 }
}int[] values = [1, 2, 3, 4];
auto doubled = values.map((int value) => value * 2);
int sum = 0;
for (int i = 0; i < doubled.length; i++) {
 sum += doubled[i];
}
Vector vector = new Vector(3.0, 4.0);
if (vector.lengthSquared() == 25.0) {
 print(`sum=${sum}`);
}
```Above code compiles into this:```
var b=[1,2,3,4].map(a=>a2|0);var a=0,c=0;while(a c=c+b[a]|0;

 a=a+1|0;

}console.log(`sum=${c}`)```This is not minification of the same program. The compiler changed the app.oxc / esbuild / terser / .. starts from JS and mostly keeps the shape of the app. Meanwhile LilScript the language is designed from scratch to give compiler any extra knowledge that could help the compiler's compilation. Just like Google Closure Compiler - Advanced Mode, and beyond.### 2. Tryhard property mangling.Visit the world's most used web applications, chatgpt.com, and read the source codes. You will see that, there are lots of framework related js properties that dont get minified, and are indeed human readable.Those names stay in the bundle because the toolchain cannot prove they are local. A property might be a public API, a DOM field, a framework hook, or something a plugin reads by string. So the minifier leaves it.LilScript:- *a-* does both eliminates the objects, weird code structures into more optimized variables/arrays
- *b-* rename any variable into mostly occured, short versions, field cleverly to minimize entropy (based on the objective compression algorith. gzip/brotli) so that the end result is highly compressed.*(a)* is the same move as the `Vector` example, at library scale: objects and classes that only exist as a programming convenience get flattened into scalars, arrays, and tight loops.*(b)* is not "make every name 1 letter." gzip and brotli win when the same short tokens repeat. The compiler picks the names that show up the most, and scores the spelling against the compression algorithm you asked for (gzip, brotli, or raw). Different `cost_model` → different names → a different file that is smaller after* that codec.That is why the same program can be 5-15% smaller after gzip/br compression or raw: the JS is shaped and named for the compressor, not just for a human reading the AST.Feel free to PR, experiment (Please respect the modified MIT license)LLM models can oneshot implement your library with LilScript. For non optimized libraries, it could end up 20%+ size reduction and somewhat performance improvements (which usualy matters very little)Please share your opinions, would love to discuss about the future direction for the language and the compiler

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49374554) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
