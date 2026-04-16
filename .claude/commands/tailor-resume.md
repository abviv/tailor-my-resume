---
description: Project-scoped wrapper around the `tailor-resume` skill. Passes this repo's project context (master file, output format, bib file) into the skill.
---

# /tailor-resume (project wrapper)

**Input:** `$ARGUMENTS` — a job posting URL. If empty, ask the user for one or for pasted text.

This repo is a public showcase of the `tailor-resume` skill. The persona (Jordan K. Mercer) and all content are fictional; see [README.md](../../README.md) for context.

This command delegates to the local skill at [.claude/skills/tailor-resume/SKILL.md](../skills/tailor-resume/SKILL.md). The skill handles industry detection, content selection, LaTeX generation, and ATS compliance across any industry — use it as-is.

## Project-specific context to pass into the skill

When invoking the skill, pre-populate these so it doesn't re-ask:

- **Master resume:** [resume_mem.md](../../resume_mem.md) — single source of truth for Jordan Mercer.
- **Project docs:** [CLAUDE.md](../../CLAUDE.md) — LaTeX conventions; overrides generic guidance in `output-latex.md`.
- **Output format:** LaTeX (`main.tex` + `sections/`, built via [build.sh](../../build.sh) or `make compile`).
- **Bib file:** [own-bib.bib](../../own-bib.bib) — read this at runtime to find the actual `\nocite` keys available; use selective `\nocite{key1,key2,...}` in [sections/publications.tex](../../sections/publications.tex) when the target role values publications.
- **Default industry:** Tech / ML — but classify from the posting. Jordan's master spans industry ML and academic research, so many applications straddle `industry-tech.md` and `industry-academia-research.md`.

## Page budget

Follow the page budget of whichever industry reference the skill loads. Do **not** impose a blanket cap:
- Industry (tech, consulting, finance, general): typically 1--2 pages.
- Academia / research CV: no cap; favour completeness.

If the tailored draft exceeds its budget, cut low-relevance bullets first. Never shrink fonts or margins as the first lever.

## Post-build page check

After the build succeeds, check the page count:

```bash
pdfinfo output/resume.pdf | grep -i ^Pages
```

If the count exceeds the target, stop and surface to the user:
1. Current page count.
2. A ranked list of candidate cuts (lowest-relevance bullets, optional sub-sections, older publications).
3. A recommendation.

Wait for the user's decision before re-editing. Re-check after each rebuild.

## Then invoke the skill

Proceed with the skill's standard workflow:

1. Fetch + parse posting (Step 1).
2. Classify industry, load the matching reference (Step 2). May load two references for cross-industry roles.
3. Read `resume_mem.md` (Step 3).
4. Score and select content (Step 4). Honour `[always-include]` tags in the master.
5. Use **LaTeX output** following [CLAUDE.md](../../CLAUDE.md) and `.claude/skills/tailor-resume/references/output-latex.md` (Step 5).
6. Edit the section files in place, then build (Step 6).
7. **Run the post-build page check** — if over budget, loop back with the user before saving (Step 7 gating).
8. Save to `output/<company-slug>_<YYYY-MM-DD>.pdf` and report: industry detected, summary variant used, bullets included/excluded, skills promoted, gaps flagged, output path.
