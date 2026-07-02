# Base Command to Create AI-OS Structure

> Run once on a new Mac. Creates the directory structure for AI-OS.

```bash
# Create the AI-OS directory structure
mkdir -p ~/Projects/ai-os/{context,specs,verifiers,skills,rules,workflows,outputs,archive,prompts/{setup,daily-use,verifiers-specs,skill-creation}}

# Create empty files (touch)
touch ~/Projects/ai-os/CLAUDE.md
cd ~/Projects/ai-os/context && touch {00_profile,01_business_or_work,02_projects,03_preferences,04_tools,05_sources}.md
cd ~/Projects/ai-os/rules && touch {always_do,ask_before_doing,never_do}.md
cd ~/Projects/ai-os/verifiers && touch {quality_checklist,critic_prompt,source_check_prompt}.md
cd ~/Projects/ai-os/skills && touch {README,skill_template}.md
cd ~/Projects/ai-os/workflows && touch {daily_start,project_start,coding,research,content_creation}.md
cd ~/Projects/ai-os/specs && touch {spec_template,current_spec}.md

# Initialize git
cd ~/Projects/ai-os && git init -b main
git config user.name "Edd Schilling"
git config user.email "tu@email.com"

# Done. Next: run 02-master-prompt.md to fill CLAUDE.md, context/, rules/, etc.
```

## What you get

```
~/Projects/ai-os/
├── CLAUDE.md           # Master instructions
├── context/            # 6 files: profile, work, projects, preferences, tools, sources
├── rules/              # 3 files: always_do, ask_before_doing, never_do
├── specs/              # 2 files: spec_template, current_spec
├── verifiers/          # 3 files: quality_checklist, critic_prompt, source_check_prompt
├── skills/             # 2 files: README, skill_template
├── workflows/          # 5 files: daily_start, project_start, coding, research, content_creation
├── archive/            # empty
├── outputs/            # empty
└── prompts/             # 7 files (this directory)
```

## Next step

After running this command:

1. Copy/paste the content of `setup/02-master-prompt.md` into the new Mac's AI assistant (Claude Code, Hermes, etc.).
2. The assistant will fill all the empty `.md` files with personalized content.
3. Run `setup/03-required-skills.md` to install the 14 superpowers skills.
4. Run `bash ~/Projects/ai-os/setup/install-mac.sh` (or its content from the AI-OS repo).
