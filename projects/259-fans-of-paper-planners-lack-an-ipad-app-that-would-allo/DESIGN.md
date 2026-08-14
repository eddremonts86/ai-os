---
id: "259"
slug: fans-of-paper-planners-lack-an-ipad-app-that-would-allo
name: "259-fans-of-paper-planners-lack-an-ipad-app-that-would-allo"
description: "iPad-native paper-feel writing app. Calm chrome, layout-faithful, ink-led."
source: "Apple Notes / Freeform (custom-adapted)"

colors:
  primary:   "#1D1D1F"
  secondary: "#424245"
  tertiary:  "#6E6E73"
  neutral:   "#FAFAFA"
  dark:      "#000000"
  accent:    "#0A84FF"
  warning:   "#FF9F0A"
  text:      "#1D1D1F"
  muted:     "#86868B"
  bg:        "#FFFFFF"
  paper:     "#FBFBF9"
  ink:       "#1D1D1F"
  border:    "rgba(0,0,0,0.08)"

typography:
  heading:
    fontFamily: "SF Pro Display, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1.5rem"
    fontWeight: "600"
    lineHeight: "1.3"
  body:
    fontFamily: "SF Pro Text, -apple-system, BlinkMacSystemFont, sans-serif"
    fontSize: "1rem"
    fontWeight: "400"
    lineHeight: "1.5"
  mono:
    fontFamily: "SF Mono, JetBrains Mono, monospace"
    fontSize: "0.875rem"

rounded:
  sm: "6px"
  md: "12px"
  lg: "18px"

spacing:
  sm: "8px"
  md: "16px"
  lg: "24px"
  xl: "48px"
---

## Design direction

The app is a writing surface, not a productivity suite. The visual register is paper-adjacent: a soft off-white page color, minimal chrome around the writing area, an Apple Pencil-first interaction model. The user must be able to forget they are using software.

Three principles drive the screen:

- **The page is the UI.** The notebook chrome (notebook name, page count, share button) collapses into a thin top bar; the page itself dominates. No popups, no menus in the writing area.
- **Apple Pencil first, finger second.** The default tool is a fine-tipped ink that responds to Pencil pressure and tilt. Finger input pans and zooms; it does not write.
- **Layouts are user-chosen, not app-imposed.** The notebook view shows the user's imported templates, not a pre-baked daily/weekly picker. The user's library is the product.

The MVP surface is one app, one notebook view, one page-writing experience. There is no settings labyrinth, no template marketplace, no achievement system.
