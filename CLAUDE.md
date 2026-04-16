# Resume Tailoring Showcase

## Project Purpose
This repo is a public showcase of the `tailor-resume` Claude Code skill. It contains a complete LaTeX resume for **Jordan K. Mercer** (a fictional persona) that demonstrates how the skill tailors a master resume for any industry.

Clone the repo, open it in Claude Code, and run `/tailor-resume <job-url>`.

## Active Template
The LaTeX template at the repo root is **CurVe** (`\documentclass{curve}` by LianTze Lim). Other templates are archived in [templates/](templates/); to switch the active template, run:

```bash
./scripts/use-template.sh <template-name>
```

See [templates/README.md](templates/README.md) for the full workflow.

## Repo Structure
```
main.tex              — Root LaTeX document (curve class, a4paper, 11pt)
settings.sty          — Style definitions, fonts, colours, biblatex config
sections/
  employment.tex      — Experience (free-form, NOT CurVe rubric)
  education.tex       — Education (CurVe rubric)
  tech_skills.tex     — Technical skills (CurVe rubric)
  publications.tex    — Research publications (biblatex)
  misc.tex            — Awards (CurVe rubric)
own-bib.bib           — BibTeX entries for publications
resume_mem.md         — MASTER RESUME (source of truth — read this first)
output/               — Built PDFs land here (gitignored)
build.sh              — Docker-based build script
Makefile              — pdflatex + biber build rules
Dockerfile            — texlive/texlive:latest based build
templates/            — Archived alternate templates (+ curve snapshot)
scripts/
  use-template.sh     — Copies a template from templates/ into the root
.claude/
  commands/
    tailor-resume.md  — Project-scoped wrapper around the skill
  skills/tailor-resume/  — Full skill (self-contained; no global install needed)
```

## Build
- **Docker (preferred):** `./build.sh` → produces `output/resume.pdf`
- **Local fallback:** `make compile` (requires `pdflatex` + `biber`)
- Build chain: `pdflatex → biber → pdflatex → pdflatex`

## LaTeX Conventions

### Employment section (free-form, no rubric)
```latex
\noindent
\textbf{\sectionheadingFont{Job Title}}
\hfill
\textit{Company, Location}\\[2pt]
\textit{Start -- End}
\begin{itemize}[leftmargin=1.5em, topsep=4pt, itemsep=2pt]
  \item Bullet point here.
\end{itemize}
```
Sub-sections use: `\noindent\textbf{Sub-heading}`
Entries separated by: `\medskip`

### CurVe rubric sections (education, skills, misc)
```latex
\begin{rubric}{Section Title}
\entry*[Key\hfill]  Content text
\end{rubric}
```

### Publications
Uses `\nocite{*}` for all, or `\nocite{key1,key2}` for selective inclusion. Bib entries in `own-bib.bib` — read that file at runtime to enumerate available keys (don't hard-code them here).

### Header / Summary
The summary lives in `main.tex` inside `\leftheader{}` using `{\summaryfont ...}`. The role line uses `{\rolefont ...}`. For a photo variant, swap `\excludecomment{fullonly}` for `\includecomment{fullonly}` and drop a file at `pictures/photo_1.jpg` (US resumes typically omit photos for ATS compliance).

## Tailoring notes (for Claude)

- Follow the page budget defined in the industry reference loaded by the skill. Do not impose a blanket cap here — academic CVs can exceed 2 pages; industry resumes should not.
- If the tailored draft overruns the page budget, cut low-relevance bullets before shrinking fonts or margins.
- Every claim in the tailored output must trace back to `resume_mem.md`. Never invent metrics, companies, or publications.
- Prefer metric-backed bullets when selecting. If a bullet in the master has no number, keep it as-is — don't fabricate one.
- US spelling throughout.

## Custom Commands
- `/tailor-resume <job-url>` — fetches a job posting, tailors the resume, builds the PDF. See [.claude/commands/tailor-resume.md](.claude/commands/tailor-resume.md).
