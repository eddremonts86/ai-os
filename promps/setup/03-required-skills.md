# Setup required skills (para otra Mac)

> ⚠️ **CRÍTICO:** Este AI-OS depende de las **14 superpowers skills** de `obra/superpowers` para funcionar correctamente. Sin ellas, los workflows de `~/Projects/ai-os/workflows/` se ejecutarán de forma incompleta (sin TDD, sin brainstorming, sin code-review, etc.).
>
> **Ejecutar este setup antes del primer uso del AI-OS en una Mac nueva.**

## Qué instala

- 14 superpowers skills en `~/.claude/skills/`.
- Symlinks a los otros 4 CLIs (Codex, Gemini, Antigravity, Hermes).

## Prerrequisitos

- macOS o Linux.
- `git` instalado.
- `gh` (GitHub CLI) instalado y autenticado (`gh auth login`).
- Conexión a internet.
- 5-10 minutos de tiempo.

## Setup automático (recomendado)

Copiá y pegá este bloque en tu terminal:

```bash
# 1. Verificar prerequisites
command -v git >/dev/null || { echo "ERROR: git no instalado"; exit 1; }
command -v gh >/dev/null || { echo "ERROR: gh (GitHub CLI) no instalado.brew install gh && gh auth login"; exit 1; }

# 2. Clonar AI-OS (si no existe)
if [ ! -d "$HOME/Projects/ai-os" ]; then
  mkdir -p "$HOME/Projects"
  # Ajustá la URL si tu repo es privado o está en otro lugar
  git clone https://github.com/eddremonts86/ai-os "$HOME/Projects/ai-os" || \
    { echo "ERROR: clonar AI-OS manualmente y volver a correr"; exit 1; }
fi

# 3. Instalar las 14 superpowers (REQUIRED)
mkdir -p "$HOME/.claude/skills"
gh repo clone obra/superpowers /tmp/sp -- --depth=1
cp -R /tmp/sp/skills/* "$HOME/.claude/skills/"
rm -rf /tmp/sp

# 4. Distribuir a Codex / Gemini / Antigravity (symlinks)
for cli_dir in "$HOME/.codex/skills" "$HOME/.gemini/skills" "$HOME/.agents/skills"; do
  mkdir -p "$cli_dir"
  for s in "$HOME/.claude/skills"/*/; do
    name=$(basename "$s")
    [ ! -e "$cli_dir/$name" ] && ln -s "$s" "$cli_dir/$name"
  done
done

# 5. Distribuir a Hermes (imported)
mkdir -p "$HOME/.hermes/skills/imported"
for s in "$HOME/.claude/skills"/*/; do
  name=$(basename "$s")
  [ ! -e "$HOME/.hermes/skills/imported/$name" ] && ln -s "$s" "$HOME/.hermes/skills/imported/$name"
done

# 6. Verificar
echo ""
echo "=== Verificación ==="
EXPECTED=14
ACTUAL=$(ls "$HOME/.claude/skills/" | grep -cE "^(brainstorming|dispatching-parallel-agents|executing-plans|finishing-a-development-branch|receiving-code-review|requesting-code-review|subagent-driven-development|systematic-debugging|test-driven-development|using-git-worktrees|using-superpowers|verification-before-completion|writing-plans|writing-skills)$")

if [ "$ACTUAL" -eq "$EXPECTED" ]; then
  echo "✅ $ACTUAL/$EXPECTED superpowers skills instaladas correctamente"
else
  echo "❌ Solo $ACTUAL/$EXPECTED superpowers instaladas — revisar"
fi

echo ""
echo "AI-OS path: $HOME/Projects/ai-os"
echo "Skills path: $HOME/.claude/skills/"
```

## Verificación manual

Si querés checkear después del setup:

```bash
# Las 14 superpowers deben estar instaladas
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  if [ -d "$HOME/.claude/skills/$skill" ]; then
    echo "  ✓ $skill"
  else
    echo "  ✗ $skill (FALTA)"
  fi
done

# Los 5 destinos deben tener symlinks
for cli in codex gemini agents hermes/skills/imported; do
  count=$(ls -la "$HOME/.$cli/" 2>/dev/null | grep -c '^l' || echo 0)
  echo "  $cli: $count symlinks"
done
```

## Si falta alguna skill específica

```bash
# Re-instalar solo las faltantes
gh repo clone obra/superpowers /tmp/sp -- --depth=1

for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  if [ ! -d "$HOME/.claude/skills/$skill" ]; then
    echo "Instalando $skill..."
    cp -R "/tmp/sp/skills/$skill" "$HOME/.claude/skills/"
    # Re-symlink a otros CLIs
    for cli_dir in "$HOME/.codex/skills" "$HOME/.gemini/skills" "$HOME/.agents/skills"; do
      [ ! -e "$cli_dir/$skill" ] && ln -s "$HOME/.claude/skills/$skill" "$cli_dir/$skill"
    done
    [ ! -e "$HOME/.hermes/skills/imported/$skill" ] && ln -s "$HOME/.claude/skills/$skill" "$HOME/.hermes/skills/imported/$skill"
  fi
done

rm -rf /tmp/sp
```

## Skills opcionales adicionales (no requeridas)

Este AI-OS funciona con las 14 superpowers + las que ya tengas. **No requiere** las otras 84 skills instaladas en la Mac de Edd (React patterns, Coolify, etc.) — pero si las tenés, se cargan automáticamente y mejoran la calidad del output.

Para instalar las 84 skills adicionales (opcional, ~30 min):

```bash
# Crear skill central que las liste e instale
# (no incluido aquí porque cambian frecuentemente)
# Ver ~/.claude/skills/READMEDD.md en la Mac de Edd para lista completa
```

## Troubleshooting

### "gh: command not found"

```bash
brew install gh
gh auth login
```

### "cp: cannot stat '/tmp/sp/skills/*'"

El clone falló. Verificar conexión a GitHub:

```bash
gh repo view obra/superpowers --web
```

Si falla, descargar manualmente:

```bash
mkdir -p /tmp/sp
cd /tmp/sp
gh repo clone obra/superpowers . -- --depth=1
# o
curl -L https://github.com/obra/superpowers/archive/refs/heads/main.tar.gz | tar xz
mv superpowers-main superpowers
ls superpowers/skills/
```

### Symlinks apuntan a paths inexistentes

```bash
# Verificar
ls -la ~/.codex/skills/brainstorming
# Si dice "No such file or directory", recrear:
rm ~/.codex/skills/brainstorming
ln -s ~/.claude/skills/brainstorming ~/.codex/skills/brainstorming
```

### Frontmatter de skills no se carga (Hermes)

Hermes cachea el index de skills. Forzar recarga:

```bash
# Reiniciar Hermes gateway
hermes gateway restart

# O desde CLI: /reload-skills
```

## Versiones futuras

Si `obra/superpowers` agrega o quita skills en el futuro:

1. Verificar lista actualizada en https://github.com/obra/superpowers/tree/main/skills
2. Actualizar `~/Projects/ai-os/CLAUDE.md` sección 16
3. Actualizar este prompt con la nueva lista
4. Re-ejecutar setup

## Por qué superpowers es REQUIRED

AI-OS está construido sobre el principio de "Spec + Verifier + Entorno" (Karpathy), pero las skills de **proceso** (cómo pensar, cómo debuggear, cómo hacer TDD, cómo revisar código) vienen de superpowers. Sin ellas:

- Los workflows de AI-OS se ejecutan pero sin disciplina de proceso.
- El agente tiende a skipear pasos (TDD, code review, verification).
- La calidad del output baja significativamente.

Por eso este setup es **obligatorio**, no opcional.