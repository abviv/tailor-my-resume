# Templates

Archived LaTeX templates that can be activated at the repo root.

The active template lives at the **repo root** (`main.tex`, `settings.sty`, `sections/`, `own-bib.bib`). This directory stores pristine snapshots of each available template so you can switch between them.

## Available templates

| Template | Class | Notes |
|----------|-------|-------|
| [curve/](curve/) | `curve` (LianTze Lim) | Default. Modern CV style with rubric sections and biblatex publications. |

More templates will be added here over time (e.g. `moderncv`, `altacv`, `awesome-cv`).

## Switching templates

From the repo root:

```bash
./scripts/use-template.sh <template-name>
```

This copies the files under `templates/<template-name>/` into the root, overwriting the current active template. It will prompt for confirmation unless you pass `--force`. Pass `--dry-run` to preview the copy without applying it.

After switching, rebuild:

```bash
./build.sh
```

## Adding a new template

1. Create `templates/<your-template>/` with the same layout as [curve/](curve/):
   - `main.tex`
   - `settings.sty` (or whatever stylesheet the template uses)
   - `sections/*.tex` matching the section names the skill expects (`employment.tex`, `education.tex`, `tech_skills.tex`, `publications.tex`, `misc.tex`)
   - `own-bib.bib` (optional — only if the template uses biblatex)
   - `README.md` describing the template, its upstream author/licence, and any special setup
2. Make sure the template builds standalone: `cp templates/<name>/* . && ./build.sh`
3. Update the "Available templates" table above.
4. Verify the `tailor-resume` skill works against it — the skill's format detection looks for `main.tex` + `sections/` + a `.sty` at the root; most CV classes satisfy this.

## Why keep templates archived this way?

The `tailor-resume` skill detects a LaTeX project by the presence of `main.tex` + `sections/` at the root. We preserve that detection and make template swapping an explicit one-off migration step rather than a runtime toggle. The root always holds exactly one active template; everything else sits here as reference.
