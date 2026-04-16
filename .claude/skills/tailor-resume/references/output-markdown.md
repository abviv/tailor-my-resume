# Output format: Markdown → PDF

Use when the project has **only Markdown files** — no LaTeX template, no `.docx`. Also the right choice when the user wants a quick, lightweight resume output.

## Toolchain options

### 1. Pandoc + LaTeX engine (highest quality, needs TeX installed)

```bash
pandoc resume_tailored.md \
  --pdf-engine=xelatex \
  --variable=geometry:margin=0.75in \
  --variable=fontsize:11pt \
  --variable=mainfont:"Latin Modern Roman" \
  -o output/acme_2026-04-16.pdf
```

### 2. Pandoc + `wkhtmltopdf` (no TeX required)

```bash
pandoc resume_tailored.md -t html -o /tmp/resume.html --css=resume.css
wkhtmltopdf /tmp/resume.html output/acme_2026-04-16.pdf
```

### 3. Typst (modern alternative to LaTeX, fast)

If `typst` is installed, write a `.typ` file and build:
```bash
typst compile resume.typ output/acme_2026-04-16.pdf
```

### 4. `md-to-pdf` / `markdown-pdf` npm tools

```bash
npx md-to-pdf resume_tailored.md --config-file pdf-config.js
```

## Markdown structure

Keep it simple and ATS-friendly:

```markdown
# Firstname Lastname

**Role** | City, Country | email@example.com | +1 555 555 5555 | [linkedin.com/in/xxxxx](https://linkedin.com/in/xxxxx) | [github.com/xxxxx](https://github.com/xxxxx)

---

## Summary

Three-to-four lines of summary text tailored to the role.

---

## Experience

### Senior Engineer — Acme Corp, San Francisco CA
*Jun 2023 – Present*

- Bullet with **bolded keyword** and quantified outcome (30% improvement, $2M saved).
- Another bullet.
- Third bullet.

### Engineer — Initech, Remote
*Jan 2020 – May 2023*

- Bullet.
- Bullet.

---

## Education

### Ph.D. in Computer Science — Stanford University
*2015 – 2019* — Advisor: Prof. Jane Smith. Thesis: "…"

### B.Sc. in Mathematics — UC Berkeley
*2011 – 2015* — summa cum laude, Phi Beta Kappa.

---

## Skills

**Languages:** Python, Go, Rust, C++
**ML:** PyTorch, JAX, Hugging Face, Ray
**Infra:** Kubernetes, Docker, AWS (EKS, S3, Lambda), Terraform

---

## Publications

- **Lastname, F.**, Smith, J. (2024). *Paper title.* Venue. [doi.org/…](https://doi.org/…)

---

## Awards

- Best-paper award, NeurIPS 2023.
- NSF Graduate Research Fellowship, 2016–2019.
```

## Styling notes

- `---` produces a horizontal rule — good for section separation in PDF renderings.
- Avoid raw HTML in the Markdown unless you control the PDF toolchain — some renderers drop it.
- Use `*italic*` and `**bold**`; both render in every common engine.
- Tables are OK for skill matrices, but keep them simple (no merged cells).

## Minimum CSS (for HTML/PDF route)

```css
body { font-family: "Helvetica Neue", Arial, sans-serif; font-size: 11pt; max-width: 7.5in; margin: 0.5in auto; color: #222; }
h1 { font-size: 22pt; margin-bottom: 0; }
h2 { font-size: 13pt; border-bottom: 1px solid #999; padding-bottom: 2pt; margin-top: 18pt; }
h3 { font-size: 11pt; margin-bottom: 0; }
h3 + em { color: #666; }
ul { margin-top: 2pt; padding-left: 1.2em; }
li { margin-bottom: 2pt; }
hr { border: none; border-top: 1px solid #ccc; margin: 14pt 0; }
a { color: #06c; text-decoration: none; }
```

## Saving

```bash
mkdir -p output
cp resume_tailored.md output/<company-slug>_<YYYY-MM-DD>.md
# then render PDF
```
