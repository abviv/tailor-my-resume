# Tailor My Resume
A LaTeX resume system powered by the **`tailor-resume`** Claude Code skill.

## Personal Note

While actively applying for jobs, I realized that sending the same resume to multiple positions—even highly relevant ones—just wasn't getting past the ATS filters. That frustration led me to invent this customization process.

It revolves around resume_mem.md, which acts as the ultimate master file of your career. At the root of the repo, it's just a template, but you should fill it with every single professional detail about yourself. Don't hold back or filter anything; include every nitty-gritty accomplishment.

When you're ready, just invoke the /tailor-resume command. Claude will take your comprehensive resume_mem.md file and the specific job link you provide to generate a customized, highly ATS-compatible resume tailored perfectly for that role. I can't guarantee you a job, but knowing this tool helped you get hired is all the reward I need. Good luck with your hunting :)


## Clone the repo, open it in Claude Code, and run:

```
/tailor-resume <job-posting-url>
```

Claude will fetch the posting, detect the industry, select the most relevant content from the master resume, edit the LaTeX section files in place, build a PDF, and save it to `output/<company-slug>_<YYYY-MM-DD>.pdf`.

The repo ships with a fictional persona — **Jordan K. Mercer**, a senior ML engineer / PhD candidate — so you can see the skill work end-to-end without supplying your own data. To adapt it for yourself, replace `resume_mem.md` and the `sections/*.tex` files with your own content.

---

## What's in the box

- A working LaTeX resume built on the **CurVe** CV class (by LianTze Lim) — sized for 1--2 pages, ATS-friendly, no photo by default.
- A master resume (`resume_mem.md`) with tagged bullets spanning industry ML, research, and infrastructure — rich enough to exercise the skill's industry-switching logic.
- The full `tailor-resume` skill in `.claude/skills/tailor-resume/`, including:
  - A 7-step workflow (fetch → classify → read → score → format → build → save).
  - Industry guides for tech, finance, consulting, healthcare, academia, legal, and general.
  - An ATS-compliance guide.
  - Output-format references for LaTeX, DOCX, and Markdown.
- A Docker-based build system (`texlive/texlive:latest`) so you don't need a local TeX installation.
- A `templates/` directory for additional LaTeX templates (more coming; see [Multi-template support](#multi-template-support)).

---

## Quick start

### Requirements
- **Docker** (recommended), or a local `pdflatex` + `biber` installation.
- **[Claude Code](https://claude.com/claude-code)** for the tailoring workflow.

### Build the default resume

```bash
git clone https://github.com/<your-user>/tailor-my-resume
cd tailor-my-resume
./build.sh
open output/resume.pdf
```

Or without Docker:
```bash
make compile
```

### Tailor for a job posting

Open this directory in Claude Code and run:

```
/tailor-resume https://jobs.example.com/some-role-1234
```

Claude will:

1. Fetch and parse the job posting.
2. Classify it into one of seven industries (tech, finance, consulting, healthcare, academia, legal, general).
3. Read `resume_mem.md` as the source of truth.
4. Score every bullet, skill, and publication against the posting.
5. Edit `main.tex` and `sections/*.tex` in place.
6. Run the build.
7. Save a dated PDF to `output/<company-slug>_<date>.pdf` and print a report: what was included, what was cut, and which posting requirements weren't backed by the master resume.

---

## Adapting for your own resume

1. **Replace `resume_mem.md`** with your own master resume. A bootstrap schema lives at [`.claude/skills/tailor-resume/references/master-resume-schema.md`](.claude/skills/tailor-resume/references/master-resume-schema.md).
2. **Update `main.tex`** with your name, contact info, and one summary variant that's a good generic starting point.
3. **Update `sections/*.tex`** with your real employment, education, skills, and awards.
4. **Update `own-bib.bib`** with your publications (or delete the `\printbibliography` block in `sections/publications.tex` if you don't have any).
5. **Edit `CLAUDE.md`** if you want to give Claude persistent project-specific rules (hard page caps, must-include items, spelling preferences).
6. Run `/tailor-resume <url>` and iterate.

See [`CLAUDE.md`](CLAUDE.md) for the full repo conventions.

---

## Multi-template support

The repo root always holds exactly one active template. Additional templates live in [`templates/`](templates/) as frozen snapshots.

To switch:

```bash
./scripts/use-template.sh <template-name>          # prompts before overwriting
./scripts/use-template.sh <template-name> --force  # skip confirmation
./scripts/use-template.sh <template-name> --dry-run
./scripts/use-template.sh --list                   # list templates
```

Shipped today: [`curve/`](templates/curve/). Planned: `moderncv`, `altacv`, `awesome-cv`. See [`templates/README.md`](templates/README.md) for the full contribution guide.

---

## How the skill works

The skill ships as a self-contained Claude Code skill in `.claude/skills/tailor-resume/`. When you invoke `/tailor-resume`, the project-scoped wrapper at [`.claude/commands/tailor-resume.md`](.claude/commands/tailor-resume.md) passes the repo's context (master file, output format, bib keys) into the skill.

The skill's 7-step workflow:

| Step | What it does |
|------|--------------|
| 1 | Fetch & parse the job posting (via `WebFetch`). |
| 2 | Classify industry → load matching reference file from `references/`. |
| 3 | Read `resume_mem.md` in full. |
| 4 | Score every item High/Medium/Low; apply `[always-include]` and `[rarely-relevant]` tags. |
| 5 | Detect output format (LaTeX in this repo) and load the matching format guide. |
| 6 | Edit section files in place, run the build, read logs on failure and iterate. |
| 7 | Save to `output/<company-slug>_<date>.pdf` and report. |

For the full specification, see [`.claude/skills/tailor-resume/SKILL.md`](.claude/skills/tailor-resume/SKILL.md).

---

## Industry references

| Industry | Guide |
|----------|-------|
| Tech / SWE / ML / Data | [`industry-tech.md`](.claude/skills/tailor-resume/references/industry-tech.md) |
| Banking / Finance | [`industry-banking-finance.md`](.claude/skills/tailor-resume/references/industry-banking-finance.md) |
| Consulting | [`industry-consulting.md`](.claude/skills/tailor-resume/references/industry-consulting.md) |
| Healthcare / Pharma / Biotech | [`industry-healthcare-pharma.md`](.claude/skills/tailor-resume/references/industry-healthcare-pharma.md) |
| Academia / Research | [`industry-academia-research.md`](.claude/skills/tailor-resume/references/industry-academia-research.md) |
| Legal | [`industry-legal.md`](.claude/skills/tailor-resume/references/industry-legal.md) |
| General (PM, ops, marketing, sales, HR, etc.) | [`industry-general.md`](.claude/skills/tailor-resume/references/industry-general.md) |

ATS-compliance guide: [`ats-guidelines.md`](.claude/skills/tailor-resume/references/ats-guidelines.md).

---

## Repo layout

```
main.tex                 — active LaTeX root (CurVe class)
settings.sty             — style definitions
sections/                — LaTeX section files (edited in place by the skill)
own-bib.bib              — bibliography entries
resume_mem.md            — master resume (source of truth)
CLAUDE.md                — project conventions for Claude Code
Dockerfile / Makefile / build.sh  — build system
output/                  — built PDFs land here (gitignored)
templates/               — archived alternate templates
scripts/use-template.sh  — switch the active template
.claude/
  commands/tailor-resume.md   — project-scoped skill wrapper
  skills/tailor-resume/       — self-contained copy of the skill
```

---

## Credits

- **CurVe** CV class: LianTze Lim (`liantze@gmail.com`) — [Overleaf template](https://www.overleaf.com/latex/templates/modern-cv-curve/twbphdtsmscx).
- Built for [Claude Code](https://claude.com/claude-code).

---

## License

MIT — see [LICENSE](LICENSE).
