#!/usr/bin/env bash
#
# use-template.sh — copy an archived template from templates/<name>/
# into the repo root, overwriting the active template.
#
# Usage:
#   ./scripts/use-template.sh <template-name>           # prompts before overwriting
#   ./scripts/use-template.sh <template-name> --force   # skip confirmation
#   ./scripts/use-template.sh <template-name> --dry-run # show what would copy
#   ./scripts/use-template.sh --list                    # list available templates
#   ./scripts/use-template.sh --help

set -euo pipefail

# Resolve repo root from this script's location.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATES_DIR="$REPO_ROOT/templates"

print_help() {
  cat <<EOF
use-template.sh — switch the active LaTeX template

Usage:
  $(basename "$0") <template-name> [--force|--dry-run]
  $(basename "$0") --list
  $(basename "$0") --help

Copies every file from templates/<name>/ into the repo root, overwriting
main.tex, settings.sty, sections/, and own-bib.bib. The skill's format
detection expects these at the root, which is why we copy rather than
symlink.

Options:
  --force     skip the confirmation prompt
  --dry-run   list the files that would be copied; make no changes
  --list      list the available templates under templates/
  --help      show this message
EOF
}

list_templates() {
  if [ ! -d "$TEMPLATES_DIR" ]; then
    echo "No templates directory found at $TEMPLATES_DIR" >&2
    exit 1
  fi
  echo "Available templates:"
  for d in "$TEMPLATES_DIR"/*/; do
    [ -d "$d" ] || continue
    name="$(basename "$d")"
    echo "  - $name"
  done
}

# Parse args.
TEMPLATE=""
FORCE=0
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --help|-h) print_help; exit 0 ;;
    --list)    list_templates; exit 0 ;;
    --force)   FORCE=1 ;;
    --dry-run) DRY_RUN=1 ;;
    --*)       echo "Unknown flag: $arg" >&2; exit 2 ;;
    *)
      if [ -n "$TEMPLATE" ]; then
        echo "Unexpected argument: $arg" >&2; exit 2
      fi
      TEMPLATE="$arg"
      ;;
  esac
done

if [ -z "$TEMPLATE" ]; then
  print_help
  exit 2
fi

SOURCE="$TEMPLATES_DIR/$TEMPLATE"
if [ ! -d "$SOURCE" ]; then
  echo "ERROR: template '$TEMPLATE' not found at $SOURCE" >&2
  echo "Run '$0 --list' to see available templates." >&2
  exit 1
fi

# Figure out what we would copy. Skip the template's own README.md.
mapfile -t FILES < <(cd "$SOURCE" && find . -type f ! -name 'README.md' | sed 's|^\./||')

if [ ${#FILES[@]} -eq 0 ]; then
  echo "ERROR: template '$TEMPLATE' has no copyable files" >&2
  exit 1
fi

echo "Template:    $TEMPLATE"
echo "Source:      $SOURCE"
echo "Destination: $REPO_ROOT"
echo "Files:"
for f in "${FILES[@]}"; do
  echo "  $f"
done

if [ "$DRY_RUN" -eq 1 ]; then
  echo
  echo "(dry run — no files were copied)"
  exit 0
fi

if [ "$FORCE" -eq 0 ]; then
  echo
  read -r -p "Copy these files, overwriting the active template? [y/N] " reply
  case "$reply" in
    y|Y|yes|YES) ;;
    *) echo "Aborted."; exit 0 ;;
  esac
fi

# Copy each file, creating parent directories as needed.
for f in "${FILES[@]}"; do
  src="$SOURCE/$f"
  dst="$REPO_ROOT/$f"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
done

echo "Done. Active template is now: $TEMPLATE"
echo "Rebuild with: ./build.sh  (or: make compile)"
