# 05 — Sources

## Official documentation (prefer real URLs)

### Languages / frameworks

- **TypeScript:** https://www.typescriptlang.org/docs/handbook/
- **React:** https://react.dev/
- **Vue 3:** https://vuejs.org/guide/
- **Nuxt:** https://nuxt.com/docs
- **TanStack Router:** https://tanstack.com/router/latest
- **TanStack Query:** https://tanstack.com/query/latest
- **TanStack Start:** https://tanstack.com/start/latest
- **PHP / Drupal:** https://www.drupal.org/docs

### Tools

- **Warp:** https://docs.warp.dev/
- **Oh My Zsh:** https://ohmyz.sh/
- **Powerlevel10k:** https://github.com/romkatv/powerlevel10k
- **Homebrew:** https://docs.brew.sh/
- **GitHub Actions:** https://docs.github.com/en/actions
- **Coolify:** https://coolify.io/docs
- **Hetzner Cloud:** https://docs.hetzner.cloud/

### Reference repositories

- **obra/superpowers:** https://github.com/obra/superpowers (14 skills required for AI-OS).
- **antfu/skill:** https://github.com/antfu/skill (skill collection).
- **NousResearch/hermes:** https://github.com/NousResearch/hermes (Hermes Agent).
- **Eddremonts86/ai-os:** https://github.com/eddremonts86/ai-os (this repo).

## Skills as sources of truth

Each installed skill has its own SKILL.md with procedures. When in doubt:

1. Check `~/.claude/skills/<skill>/SKILL.md`.
2. Check the original repo (`gh repo view <owner>/<repo>`).

## When to add a new source

Add to this file when:

- You discover an official doc URL that was missing.
- You adopt a new library/framework/tool.
- You install a new skill.

## When NOT to trust a source

- Blog posts (unless official).
- StackOverflow answers (unless verified by tests).
- Random Medium articles.
- LLM-generated content (unless verifiable).

Always cite the source. If unsure, → Load skill `verifiers/source_check_prompt.md`.
