# SPEC.md — Real-time push notifications for Hacker News comments

## Problem

Hello folks,<p>I built a service to provide you with real-time push notifications whenever someone replies to you on Hacker News, served right through your browser: <a href="https:&#x2F;&#x2F;hcker.news&#x2F;notifications" rel="nofollow">https:&#x2F;&#x2F;hcker.news&#x2F;notifications</a><p>It has always been difficult to keep track of replies here, especially across long threads (purposefully so[0]).<p>What makes this differe nt from other implementations (notable prior art: hnreplies.com by @dangrossman):<p><pre><code>  1. Real-time or once a day: You can choose to have notifications sent immediately (you get notified within ~20 seconds) or once a day. 

  2. Stories + Replies: Choose to get notified of replies to your comments and your submissions.

  3. Private: You don&#x27;t have to provide an email address (many people value their pseudonymity)
</code></pre>
How it works:<p><pre><code>  1. Go to https:&#x2F;&#x2F;hcker.news&#x2F;notifications and enter your HN username.

  2. Allow browser notifications when prompted.

  3. That&#x27;s it. When someone replies to you, your browser receives a push notification.
</code></pre>
Caveats: It works on Desktop (Chrome, Safari, Firefox, Edge), Android, and iOS. On desktop, your browser must be open to receive notifications. On iOS, it works via PWA – you must add it to your home screen.<p>Give it a try, I&#x27;d love your feedback. Cheers!<p>0: <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=27897211#27901918">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=27897211#27901918</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49644273)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T14:26:21Z

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
