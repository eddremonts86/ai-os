---
id: "3018"
slug: graphlib-a-new-way-to-create-directional-graphs-in-c
title: Graphlib -- A new way to create directional graphs in C++
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338367"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Graphlib -- A new way to create directional graphs in C++

## Tech Stack

- **Language standard:** C++17, which gives us `std::optional`, structured bindings, and `if constexpr` — enough expressive power for a small graph API without paying the C++20 modules tax for adoption.
- **Build model:** Header-only library distributed as a single `graphlib/graph.h` (plus a `detail/` folder of internal headers), so consumers include one file and avoid an out-of-tree build dependency.
- **Test framework:** Catch2 (single-header variant) for unit tests, chosen because it has the same header-only adoption story as the library itself.
- **Documentation:** Doxygen-generated HTML from inline comments, plus a hand-written README with copy-paste snippets — the snippets are the user-facing docs, Doxygen is the reference.
- **Continuous integration:** GitHub Actions matrix on GCC and Clang across Linux and macOS, with a C++17 standard flag and `-Wall -Wextra -Werror` so the header compiles cleanly on the platforms the audience uses.
- **Examples:** Three small `examples/*.cpp` programs, each in its own subdirectory with a one-line `Makefile` so a developer can copy-paste the snippet from the README and run it unchanged.

## Architecture

```
+------------------------------+
| graphlib/graph.h (public API)|
| - graph |
| - node_handle, edge_handle |
+------------------------------+
 |
 v
+------------------------------+
| graphlib/detail/*.h (impl) |
| - adjacency storage |
| - BFS / DFS / topo sort |
| - ostream operator>` for simplicity) and the traversal implementations; the public header is the only thing consumers ever include.

## Milestones

1. **M0 — Public API shape:** Sketch the `graph` template, the node and edge handle types, and the construction syntax that the README will advertise, and validate it on a whiteboard example before any code lands.
2. **M1 — Construction and adjacency storage:** Implement initializer-list construction and the underlying adjacency storage in `detail/`, with Catch2 tests covering add-node, add-edge, duplicate-edge, and self-loop behaviour.
3. **M2 — Standard traversals:** BFS, DFS, and topological sort, each as a free function that returns a range the consumer can iterate with `for (auto id : graphlib::bfs(root))`. Add tests on small graphs including a cycle (topological sort must report the cycle).
4. **M3 — Pretty-print and three examples:** `operator>` so the caller must handle the empty case explicitly.
