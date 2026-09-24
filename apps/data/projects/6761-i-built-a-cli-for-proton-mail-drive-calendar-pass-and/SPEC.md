# SPEC.md — I Built a CLI for Proton Mail, Drive, Calendar, Pass and Contacts

## Problem

I made a command line tool for Proton. It covers Mail, Drive, Calendar, Pass and Contacts. It is one static binary for Linux, macOS and Windows.<p>Proton doesn&#x27;t have a CLI for all their web interfaces. There is one for Drive and one for Pass, but the other ones are not really there. There&#x27;s no Mail CLI, Contacts or other CLIs. I wanted to have everything in one.<p>It does logins the way the Proton apps do, with SRP. It decrypts and encrypts on your machine with Proton&#x27;s own Go libraries, go-srp and gopenpgp. Your password never leaves the machine. It talks to the same API as the Proton web apps. There is no bridge and no daemon. It runs one command and exits.<p>Some things it can do:<p><pre><code>  proton mail messages list --unread
  proton mail messages get &quot;Invoice #2291&quot;
  proton drive items upload .&#x2F;report.pdf &#x2F;Documents
  proton calendar events list
  proton pass items totp github.com
</code></pre>
Every command has the same shape: proton &lt;app&gt; &lt;collection&gt; &lt;verb&gt;. Every command can print JSON. Every command that changes something takes --dry-run.<p>This CLI does things the web interfaces do, in those five apps. But some things need a browser and are not here: importing from Gmail, adding a Zoom link, registering a security key and so on. VPN, Wallet, Docs, Meet, Lumo and Authenticator are not covered.<p>Most of the code was written with LLMs as you can see. But I have an extensive test suite: 397 live tests against three real Proton accounts and a record of the 243 API endpoints they reach.<p>Install with curl, Homebrew, winget, APT, AUR, Nix, npm or take a binary from the releases page.<p>Feedback is more than welcome :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49683369)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T12:42:42Z

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
