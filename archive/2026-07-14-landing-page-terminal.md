# Current Spec: Landing Page Terminal Simulator

## Metadata

- **Date:** 2026-07-14
- **Status:** completed
- **Blocks:** 3
- **Author:** Edd
- **Reviewer:** Edd

## Objective

Update the AI-OS landing page to comprehensively explain CLIs, skills, MCPs, installation, wiring, first steps, and `.env` variables using an interactive, premium terminal simulator design.

## Context

The current landing page is too generic and lacks concrete details of the project (such as which CLIs are supported, MCP details, installation internals, env vars, etc.). We want to build an advanced, visually stunning landing page that explains all these components using an interactive terminal layout (Option 3).

## Acceptance criteria

- [x] Landing page (`site/index.html`) includes full details on supported CLIs (Claude, Codex, Gemini, Antigravity, Hermes, MiniMax, VS Code) and how they are supported.
- [x] Landing page explains the 14 superpowers skills, ECC (+271 skills), and gstack/claude.tools (+12 skills).
- [x] Landing page lists all 10 MCP servers and their purposes.
- [x] Landing page shows all installation, verification, and daily developer commands.
- [x] Landing page details the Global Instruction Bridge setup (wiring).
- [x] Landing page describes first steps (cloning, env setup, verification, daily start).
- [x] Landing page documents the `.env` variables and how they work.
- [x] UI is visually stunning, responsive, preserves the void theme, and is polished with smooth micro-animations, glassmorphism, and interactive console simulator tabs/commands.
- [x] Verified locally using a local web server (e.g. `npx serve` or Python http.server) and manual browser QA.

## Non-goals (explicit)

- We will not deploy the site directly to production (Coolify deployment is done automatically on merge to `main`).
- We will not change any backend code or scripts in `setup/` or `dev-env/`.

## Plan (blocks)

### Block 1: Design and Content Update (estimated: 25 min)
- [x] Design the interactive terminal simulator interface structure in `site/index.html` with tabs/commands for:
  - CLIs & Wiring
  - Skills & MCPs
  - Installation & First Steps
  - Environment Variables (`.env`)
- [x] Update index.html styling with a premium glassmorphic feel, sleek dark mode palette (void theme), and micro-animations.
- [x] Populate the terminal simulator content with complete details researched from the codebase (e.g., CLI mapping, superpowers, 10 MCPs, env config).
- **Verify:** Open `site/index.html` locally and verify the HTML layout and content structure.

### Block 2: Interactive Features & Verification (estimated: 20 min)
- [x] Implement the Javascript interactive terminal simulator logic to allow clicking commands/tabs to run simulated commands or show detailed information.
- [x] Add smooth typing effects, interactive copy-to-clipboard, and responsive adjustments.
- [x] Smoke-test the landing page locally by running a dev server and navigating to it.
- **Verify:** Run a browser test or manual verification using python http server, checking that all sections load, buttons click, and it is responsive.

### Block 3: Massive Info Expansion & Visual Polish (estimated: 15 min)
- [x] Write comprehensive technical details for clis, skills, mcp, bridge, install, env, and start commands in JavaScript consoleData.
- [x] Add more responsive adjustments, premium glassmorphism overlays, and hover glow effects.
- [x] Verify HTML validity and perform visual checks.
- **Verify:** Sourced via local server and verified that all 8 commands render full data matching codebase exactly.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Page size becomes too large or slow | low | medium | Keep CSS/JS minimal and clean; use raw HTML/JS/CSS without heavy frameworks |
| Layout breaks on smaller screen sizes | medium | medium | Apply robust CSS Grid/Flexbox and media queries |

## Verification (end-to-end)

- [x] Run a local web server to check `site/index.html`.
- [x] Verify that all interactive features (terminal commands, copy to clipboard, tab switches) work correctly.
- [x] Confirm all requested project details (CLIs, MCPs, skills, env vars, wiring) are present and accurate.

## References

- [README.md](file:///Users/edd/Projects/ai-os/README.md)
- [CLAUDE.md](file:///Users/edd/Projects/ai-os/CLAUDE.md)
- [setup/install-mac.sh](file:///Users/edd/Projects/ai-os/setup/install-mac.sh)
- [setup/verify.sh](file:///Users/edd/Projects/ai-os/setup/verify.sh)
- [dev-env/env-config/.env.example](file:///Users/edd/Projects/ai-os/dev-env/env-config/.env.example)

## Notes

- The site uses Nginx in production, serving the static `site/` folder directly.
