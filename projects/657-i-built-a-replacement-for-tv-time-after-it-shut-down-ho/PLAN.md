---
id: "657"
slug: i-built-a-replacement-for-tv-time-after-it-shut-down-ho
title: I built a replacement for TV Time after it shut down. How do I find the people who actually need it?
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Mobile (React Native or Flutter), TMDb for show/episode metadata, a Postgres-backed personal-history store, App Store + Play Store distribution, social-channel testing toolkit (Reddit, TikTok, Instagram, App Store SEO).

## Architecture

Import flow: file upload → parse → map to TMDb → write to personal store. Track flow: continue from where TV Time left off. Discovery: App Store listing + targeted channels.

## Milestones

- [ ] TV Time export parser + TMDb mapping
- [ ] Personal-history store
- [ ] Continue-tracking UX
- [ ] App Store + Play Store listings
- [ ] One channel test (Reddit communities, per the poster's question)
- [ ] Retention metrics dashboard

## Risks

- The shutdown moment is the only moment; long-tail retention requires the tracker to compete on its own merits.
- App Store review risk if the import flow mis-handles edge cases.
- Solo-founder bandwidth: one channel, deep, not all of them.
