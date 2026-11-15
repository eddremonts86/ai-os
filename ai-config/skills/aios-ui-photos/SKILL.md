---
name: aios-ui-photos
description: Find openly licensed photographs for a page by subject in Hallmark's 755-photo library (Wikimedia Commons), in a theme's treatment, with the credit each needs; optionally save local copies. Explicit invocation, /aios-ui-photos "<subject>" [...] [theme <slug>] [save <dir>].
disable-model-invocation: true
---

# aios-ui-photos

The user's own photographs and screenshots of the real product come first; this is for the slots they leave.
`H=$AI_OS_ROOT/ai-config/skills/aios-ui-verify/scripts/hallmark.sh`.

1. `$H theme photos "<subject>" ["<subject>" ...] [--theme <slug>] [--n 3] [--orient landscape|portrait|square]
   --json`. Subjects are concrete ("harbour at dawn", "pottery wheel, hands"), one per slot.
2. Show the picks (look at them; send them to the user when they follow from the phone) with each one's licence
   and author.
3. `--save <dir>` downloads local copies (only from `upload.wikimedia.org`, content type checked) for anything
   that ships; without it the page hotlinks Wikimedia.
4. Every library photo is credited on the page (author, licence, link), the way Hallmark's footer does it.

Never a stock-site URL, never a photo standing in for a fact (a team, a customer, a place the business is not).
