# Base Command to Create AI-OS Structure

> Run once on a new Mac. Creates the directory structure for AI-OS.

```bash
# Choose where AI-OS lives (every prompt in prompts/ uses $AI_OS_ROOT)
export AI_OS_ROOT="$HOME/Projects/ai-os"

# Create the AI-OS directory structure
mkdir -p $AI_OS_ROOT/{context,specs,verifiers,skills,rules,workflows,outputs,archive,prompts/{setup,daily-use,verifiers-specs,skill-creation}}

# Create empty files (touch)
touch $AI_OS_ROOT/CLAUDE.md
cd $AI_OS_ROOT/context && touch {00_profile,01_business_or_work,02_projects,03_preferences,04_tools,05_sources}.md
cd $AI_OS_ROOT/rules && touch {always_do,ask_before_doing,never_do}.md
cd $AI_OS_ROOT/verifiers && touch {quality_checklist,critic_prompt,source_check_prompt}.md
cd $AI_OS_ROOT/skills && touch {README,skill_template}.md
cd $AI_OS_ROOT/workflows && touch {daily_start,project_start,coding,research,content_creation}.md
cd $AI_OS_ROOT/specs && touch {spec_template,current_spec}.md

# Initialize git
cd $AI_OS_ROOT && git init -b main
git config user.name "Edd Schilling"
git config user.email "tu@email.com"

# Done. Next: run 02-master-prompt.md to fill CLAUDE.md, context/, rules/, etc.
```

## What you get

```
$AI_OS_ROOT/
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
4. Run `bash $AI_OS_ROOT/setup/install-mac.sh` (or its content from the AI-OS repo).
