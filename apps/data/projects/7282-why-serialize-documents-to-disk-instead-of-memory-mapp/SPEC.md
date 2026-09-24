# SPEC.md — Why serialize documents to disk instead of memory-mapping runtime state?

## Problem

Opening files like docx requires heavy string parsing and pointer allocation. After an OS swaps active RAM pages out as to flash disk as virtual memory, it can restore them almost instantly. Using 2X more flash disk space is worth if we can achieve millisecond loads. Why hasn&#x27;t direct memory dumping&#x2F;reloading replaced file parsing for complex document models?<p>I started a company in 2000 to build a commercial cross-platform desktop suite in Java. To achieve seamless live-data-linking across text, sheets and slides, we stored data objects into a 3D coordinate space (Sheet_Num,Row_Num,Column_Num) and reference&#x2F;access them instead of pointers. This scheme enable us open a 50,000-pages document in 8 seconds, compared to 300+ seconds by a competing suite requiring parsing andan array of pointer construction.<p>Recently, some suggested that our 3D design without referencing data by pointers can possibly use OS provided mmap to restore back the entire document image as loaded into the RAM to flash disk. Instead of opening the file again with all those parsing&#x2F;pointer-building work, the memory mapped buffers can be simply be brought back into RAM in milliseconds.<p>Our senior engineers have confirmed the feasibility and tries to prove it, but, they have encountered numerous problems to save using OpenJDK and CRaC on Linux. They told me that OpenSDK has stated that it can be done but probably did not test this part thoroughly because they never expected it be actually used.<p>Has any one successfully decouple a complex document substrate into off-heap memory to achieve true zero-copy mmap load or does the JVM runtime always get in the way?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49720159)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T23:16:48Z

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
