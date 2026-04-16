# Output format: LaTeX

Use when the project has a `main.tex` + `sections/` layout, a `.cls` / `.sty`, and a build script (`build.sh` / `Makefile` / `latexmk` / `tectonic`).

**The project's own `CLAUDE.md` is the source of truth for LaTeX conventions.** This file is generic guidance — read and apply `CLAUDE.md` first; fall back to what's here only when `CLAUDE.md` doesn't cover the case.

## Detecting the LaTeX dialect

Look at `\documentclass` in `main.tex`:

| Class                              | Behavior notes                                                        |
|------------------------------------|-----------------------------------------------------------------------|
| `curve`                            | Uses `\begin{rubric}` + `\entry*[Key\hfill]` for CV entries           |
| `moderncv`                         | Uses `\cventry`, `\cvitem`                                            |
| `europasscv` / `europecv`          | EU CV; structured fields                                              |
| `article` + custom `.sty`          | Freeform; follow the project's existing section files                 |
| `altacv`, `awesome-cv`, `friggeri` | Template-specific; follow existing patterns                           |

## Special-character escaping (always)

| Character | Escape     | Notes                                         |
|-----------|-----------|-----------------------------------------------|
| `%`       | `\%`      | "89\%" not "89%"                              |
| `&`       | `\&`      | Both in prose and in section titles           |
| `$`       | `\$`      | When literal; do **not** escape math         |
| `#`       | `\#`      |                                               |
| `_`       | `\_`      | URLs, email addresses — careful               |
| `{` / `}` | `\{` `\}` | When literal                                  |
| `~`       | `\textasciitilde{}` | When literal                        |
| `^`       | `\textasciicircum{}`| When literal                        |
| `\`       | `\textbackslash{}`  |                                    |

Links: `\href{https://example.com}{display text}`. Ensure `hyperref` is loaded (most CV classes load it).

## Build rules

Prefer the project's own build command:

1. `./build.sh` (if Docker preferred by project)
2. `make` or `make compile`
3. `latexmk -pdf main.tex`
4. `tectonic main.tex`
5. Fallback: `pdflatex → biber → pdflatex → pdflatex` (if biblatex is used)

If the build fails, read the log. Common failures:

- Unescaped `%`, `&`, `#`, `_` in new content
- Missing closing braces `}`
- biblatex key mismatch — verify the `\nocite{...}` keys exist in the `.bib`
- Overfull `\hbox` warnings — usually acceptable; ignore unless visually broken
- "Float too large" — usually means a table or figure; shrink or remove

Do **not** paper over errors by wrapping content in `\iffalse ... \fi`. Fix the root cause.

## Editing strategy

- **Edit existing section files in place** (e.g., `sections/employment.tex`) — don't create parallel files.
- Preserve the project's comment markers and whitespace conventions.
- Keep the `main.tex` structure unchanged unless restructuring is actually needed.
- Use `\href{url}{text}` rather than raw URLs; raw URLs with underscores break without `\url{}` or `\href{}`.

## Header / summary

Different templates put the summary in different places:

- `curve` class: summary is set in `\leftheader{{\summaryfont ...}}` in `main.tex`
- `moderncv`: `\cvitem{Profile}{...}` or similar
- `awesome-cv`: `\cvinfo{...}` or `\cvbio{...}`

When unsure, grep for a string in the current summary text and edit in place.

## Publications (if biblatex)

- Controls: `\nocite{*}` for all; `\nocite{key1,key2}` for selective.
- bib entries live in `own-bib.bib` or similar; verify every `\nocite` key exists there.
- Title case in bib entries: use `{Braces}` around words you want preserved as capitalized (e.g., `title = {Learning Motion Representations for {L}evel-4 Urban Driving}`).
- Prefer `\cite{}` inside the document body when citing a specific paper within prose.

## Rubric sections (curve class)

```latex
\begin{rubric}{Section Title}
\entry*[Key\hfill] Content text here.
\entry*[2024 -- Present]%
    Multi-line content\par
    More text
\end{rubric}
```

## Employment section (free-form, common pattern)

```latex
\noindent
\textbf{\sectionheadingFont{Job Title}}
\hfill
\textit{Company, Location}\\[2pt]
\textit{Start -- End}
\begin{itemize}[leftmargin=1.5em, topsep=4pt, itemsep=2pt]
  \item Bullet.
  \item Bullet with \href{https://link}{a link} and an escaped \%.
\end{itemize}
\medskip
```

## Page-budget enforcement

If the PDF overshoots the industry's page budget:

1. **First**: cut low-relevance bullets. Do not resize fonts or margins.
2. **Second**: merge very old / short roles into a "Earlier Experience" one-liner.
3. **Third**: drop a section entirely if it's low-signal for the target role.
4. **Only last resort**: adjust `\itemsep`, `topsep`, or margins — and document it in a comment.

## Font and colour

Leave these alone unless the user asks. CV templates are opinionated by design; overriding fonts tends to break spacing in unexpected ways.

## Output naming

After a successful build:

```bash
mkdir -p output
cp output/resume.pdf "output/<company-slug>_$(date +%Y-%m-%d).pdf"
```

Keep `output/resume.pdf` as the "current" artifact.
