---
id: "543"
slug: i-wrote-a-simple-script-to-automate-my-keywording-and-i
title: "I wrote a simple script to automate my keywording, and it accidentally turned into a full app."
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9quq/i_wrote_a_simple_script_to_automate_my_keywording/"
category: saas
date: "2026-08-14"
---
# I wrote a simple script to automate my keywording, and it accidentally turned into a full app.

## Tech Stack

- **Chrome extension:** Manifest V3 with a service worker; uses the `chrome.tabs` and `chrome.downloads` APIs to intercept the file-upload dialog on microstock sites (Shutterstock, Adobe Stock, iStock, Alamy, etc.).
- **EXIF writer:** browser-side via a WASM-compiled `exiftool` or a pure-JS `piexifjs` for the standard IPTC/IIM tags most agencies read.
- **AI tagger:** runs in two modes — local keyword generation via a small OSS model for offline-first, or a hosted endpoint for higher-quality suggestions.
- **Web app:** Vite + React for the upload/keyboard-review UI; the Chrome extension shares types with it.
- **Storage:** IndexedDB on the client; an opt-in sync to a Postgres backend for multi-device use.

## Architecture

The OP is a microstock contributor who originally wrote a script to auto-tag images. ExifGarden reads the user-supplied images (drag-drop or folder select), generates keyword candidates, and writes them directly into the EXIF/IPTC block before the image is uploaded to any agency. Because every agency reads tags from the same EXIF block, the user does it once and the metadata follows the file across every platform.

```
User drags folder ─▶ ExifGarden web UI
                        │
                        ├─▶ AI tagger (local or hosted) ─▶ candidate keywords
                        │
                        └─▶ EXIF/IPTC writer (piexifjs / WASM) ─▶ tagged file
                                                                       │
                                                                       ▼
                                                          Microstock agencies read tags
                                                          (Shutterstock, Adobe Stock, ...)
```

The Chrome extension variant intercepts the agency upload UI to inject the already-tagged file, so the contributor does not re-tag per agency.

## Milestones

1. **M0 — Local web app MVP.** Folder drag-drop, tag suggestion, EXIF write, download tagged file. End of week 2.
2. **M1 — Chrome extension.** Upload-page integration with one agency (Shutterstock). End of week 5.
3. **M2 — Second + third agency adapters.** End of week 8.
4. **M3 — Hosted AI tier + opt-in sync.** End of week 12.
5. **M4 — Pricing: free for local, $5–10/month for hosted AI + sync.** End of week 14.

## Risks

- **Agency-side upload UI changes.** Microstock sites change their upload forms regularly, and a Manifest V3 extension that depends on selectors can break silently. The extension needs a small integration-test harness that pings a status page when a known selector disappears.
- **EXIF/IPTC field semantics differ per agency.** Some agencies prefer hierarchical keywords, others want flat. The writer must expose a per-agency profile so the user can pick, not guess.
- **Free-tier abuse.** The OP explicitly says the app is "free to try". A generous free tier invites casual use without conversion; the value of the hosted AI tier has to be visibly better than the local model for users to pay.
