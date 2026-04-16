# CurVe Template

This is a snapshot of the **CurVe** LaTeX CV class by LianTze Lim — the template currently active at the repo root.

- Upstream: [Overleaf — Modern CV / CurVe](https://www.overleaf.com/latex/templates/modern-cv-curve/twbphdtsmscx)
- Author: LianTze Lim (`liantze@gmail.com`)
- Document class: `curve` (distributed via TeX Live / Overleaf)

## What's here

| File | Purpose |
|------|---------|
| `main.tex` | Root document (preamble, `\leftheader`, contact line, `\input`s) |
| `settings.sty` | Fonts, colours, biblatex config, rubric styling |
| `own-bib.bib` | Bibliography entries for the publications rubric |
| `sections/*.tex` | Content files (employment, education, skills, publications, misc) |

This snapshot tracks the state of the CurVe template as shipped in this repo. If you edit the active template at the root and want to commit the change back into the archived snapshot, copy the updated files over this directory.

## Activating this template

This template is already active (it lives at the repo root). If you've switched to a different template and want to switch back:

```bash
./scripts/use-template.sh curve
```

See [../README.md](../README.md) for the full workflow.
