# SPEC.md — I was tired to check my mums WhatsApp last online, to see if she is ok

## Problem

Ever since my father passed away, my mother has been living alone in our family home. She’s now over 70 years old. I live in another city, and so does my sister. Of course, we call her regularly, but at the same time, she doesn’t want to feel like she’s being watched. She’s still too “young” for that. So our best way to check on her is to see when she was last online on WhatsApp. But in the long run, that’s too imprecise and, above all, too much of a hassle.<p>A while back, I set up a few smart home features in the house. But they&#x27;re mostly things like turning down the thermostats when a window is open or using a motion sensor to turn on the lights.<p>Then I had the following idea: Why not use this data to identify behavioral patterns? In other words, if a door isn’t opened the way it usually is, that could mean something. My mom now has a FitBit Air, too, which provides data. That would be great as well. But to do that, all the data with its different connection types (Zigbee, Bluetooth, external APIs) needs to be consolidated. The fact that they’re all from different manufacturers doesn’t make things any easier.<p>That’s how my open source project &quot;Healthcore&quot; came to be.<p>Healthcore is an open software and hardware architecture for (healthcare) devices. &quot;Healthcare&quot; is in parentheses because, in theory and practice, standard smart home components can also be used, but in the long run, I’d like to include things like blood glucose monitors. Think of Healthcore as similar to OpenHAB or Home Assistant, but with a greater focus on intelligent data analysis and actions tailored to healthcare. Incoming data is standardized.<p>For each device, there is converter. Healthcore uses various anomaly detection methods across the collected data to trigger alerts. These alerts can then be used to define actions in scenarios (e.g., if blood sugar is unusually low at night, turn on the lights and send a push notification). Reports can also be generated from the data using a locally hosted LLM.<p>Healthcore also supports LoRa P2P for transmitting data over long distances.<p>Healthcore is currently headless. However, anyone can quickly build their own interface using the Swagger file.<p>The Healthcore is meant to be the foundation for my startup, bulp.io. With bulp.io, I’ll build or license my own hardware, which will, of course, be 110% compatible with the Healthcore. My primary target audience is my mom, followed by other people living alone, and then nursing homes.<p>What do you think? Is this a good idea? Feel free to check out the repository on GitHub and give me some feedback.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49602794)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T20:43:56Z

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
