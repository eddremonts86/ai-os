# AI-OS Quick Reference

This file remains at its historical path for compatibility. Its content is in
English because repository-authored files use English.

## Repository root

Set the root once per shell. Override it when the repository lives elsewhere.

```bash
export AI_OS_ROOT="${AI_OS_ROOT:-$HOME/Projects/ai-os}"
```

`CLAUDE.md` is the master operating instruction. `context/` contains reviewed,
durable user context. `rules/` contains approval and safety policy.

## Task lifecycle

1. Read the relevant context, rules, and `$AI_OS_ROOT/specs/current_spec.md`.
2. `current_spec.md` is reserved for one active task. Create a Spec from
   `specs/spec_template.md` when the task needs one.
3. Execute in small blocks and apply the appropriate verifier before completion.
4. Move a completed Spec to `archive/YYYY-MM-DD-<slug>.md` without overwriting
   prior records.
5. Reset `current_spec.md` to the no-active-Spec template after archiving.

## Approval boundary

`go` authorizes approved reversible work. It does not authorize destructive,
production, financial, credential, publishing, outbound, global-state, or other
hard-to-reverse actions. These still require action-specific confirmation.

## Common commands

```bash
cat "$AI_OS_ROOT/CLAUDE.md"
bash "$AI_OS_ROOT/setup/verify.sh"
cat "$AI_OS_ROOT/specs/current_spec.md"
ls "$AI_OS_ROOT/archive"
```

## References

- [`CLAUDE.md`](../CLAUDE.md) for the operating method.
- [`workflows/`](../workflows/) for repeatable task procedures.
- [`rules/`](../rules/) for safety and approval policy.
- [`ai-os-overview.mdx`](ai-os-overview.mdx) for detailed architecture notes.
