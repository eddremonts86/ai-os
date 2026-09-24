# SPEC.md — ChaosTree – A zero-dependency Java tree library (AVL,RBT,B-Tree,B+Tree)

## Problem

What is ChaosTree?<p>ChaosTree is a zero-dependency Java Sorted Set&#x2F;Map library built around multiple tree implementations.<p>It provides implementations of:
- AVL Tree
- Red-Black Tree
- B-Tree
- B+Tree<p>I have not made my custom API as it implements NavigableSet, NavigableMap, SequencedSet and SequencedMap. My Custome API are:
- buildFromSorted(Iterator&gt; it, float factor)
- importFlatMatrix(Object[][] blast, float factor)
- Object[][] exportFlatMatrix()<p>I started ChaosTree because I wanted to explore how far I could learn DS structure, It started as frst release of 7 tree of Set type with Custome API, As i got engrossed into it I moved to Map, During phase of switching from Set to Map there was drastic change and knowledge upgrade where I pushed my Tree limit from jdk11+ support to jdk21+ where paid close attention to dependency-free and memory layout, allocation,JVM behavior, and real-world performance.<p>Some of the things I experimented with:
- Different node layouts and metadata footprints
- CRTP&#x2F;F-bounded polymorphism for tree implementations
- Parent-pointer vs parentless nodes
- Array-based N-ary tree nodes
- B-Tree&#x2F;B+Tree degree selection
- JMH benchmarking and JFR profiling
- Differential&#x2F;randomized testing against java.util.TreeMap&#x2F;TreeSet<p>After this rough and tough It also passes these test:<p>-Guava Testlib compatibility testing
-jqwik property-based testing
-Randomized differential testing against reference collections
-White-box structural validation of tree nodes
-Direct validation of B-Tree&#x2F;B+Tree structural invariants
-Exception and iterator-contract testing
-Serialization and cloning tests
-Nary Tree uses custom jqwick test of API validation as well.<p>Tail latency behavior is not shown here because it get&#x27;s truncated into a simple text which made the dat read wrong:<a href="https:&#x2F;&#x2F;chaos-vy.github.io&#x2F;ChaosTree&#x2F;utils&#x2F;JMH-Report.html" rel="nofollow">https:&#x2F;&#x2F;chaos-vy.github.io&#x2F;ChaosTree&#x2F;utils&#x2F;JMH-Report.html</a>
I have also ran benchmark with official JDK TreeMapUpdate to my N-ary tree.<p>GitHub:
<a href="https:&#x2F;&#x2F;github.com&#x2F;Chaos-vy&#x2F;ChaosTree" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;Chaos-vy&#x2F;ChaosTree</a>
<a href="https:&#x2F;&#x2F;chaos-vy.github.io&#x2F;ChaosTree&#x2F;" rel="nofollow">https:&#x2F;&#x2F;chaos-vy.github.io&#x2F;ChaosTree&#x2F;</a><p>I&#x27;d especially like feedback on the API design, implementation choices, benchmark methodology. I am currently trying to truncate useless and complex branches for performnace tuning.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49694404)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T10:03:46Z

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
