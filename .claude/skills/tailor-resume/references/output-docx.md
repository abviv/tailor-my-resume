# Output format: DOCX (Microsoft Word)

Use when the project has a `.docx` template (often named `resume_template.docx`, `cv_template.docx`), a `templates/` folder, or when the posting explicitly requires `.docx`.

## Preferred approach: delegate to the `docx` skill

If the project has the `claude-scientific-writer:docx` skill available, use it — it's purpose-built for programmatic Word manipulation (preserves formatting, tracked changes, comments). Invoke with the specific section edits needed.

Otherwise, use one of these toolchains:
- **python-docx** — most reliable for programmatic edits
- **pandoc** — for Markdown → DOCX conversion (loses some fine styling)
- **LibreOffice headless** (`libreoffice --headless --convert-to docx`) — for format conversions only

## Template strategy

Most users keep a **template `.docx`** with placeholders and a **generated `.docx`** per application. Don't edit the template in place unless asked.

```
templates/resume_template.docx      ← master template, never commit generated-over
output/<company-slug>_<date>.docx   ← per-application output
```

If you find a template with placeholder tokens like `{{SUMMARY}}`, `{{EXPERIENCE}}`, use `python-docx` to substitute. Otherwise, locate specific paragraphs/runs and edit them.

## python-docx minimum pattern

```python
from docx import Document

doc = Document("templates/resume_template.docx")

# Edit a paragraph by its position or by finding a marker
for para in doc.paragraphs:
    if para.text.startswith("SUMMARY_PLACEHOLDER"):
        para.text = "New summary text here."

doc.save("output/acme_2026-04-16.docx")
```

**Warning**: replacing `.text` wipes character-level formatting (bold/italic/underline). To preserve formatting, manipulate `run` objects individually. For substantial edits, prefer the `docx` skill.

## Formatting rules (Word-specific)

- Use **built-in styles** (Heading 1, Heading 2, Normal, List Bullet) — ATS parsing favors these over manually-formatted text.
- Avoid **text boxes, shapes, SmartArt** — see [ats-guidelines.md](ats-guidelines.md).
- Use **tab stops** for date right-alignment, not tables or trailing spaces.
- Keep the **header/footer empty** of contact info — put contact info in the body.
- Set **margins** to 0.7"–1".
- Use **consistent bullet glyph** throughout (Word's default "•" is safe).

## Conversion to PDF

Most users need both `.docx` (for ATS upload) and `.pdf` (for email attachments or portfolio). Convert:

```bash
libreoffice --headless --convert-to pdf --outdir output output/acme_2026-04-16.docx
# or
pandoc output/acme_2026-04-16.docx -o output/acme_2026-04-16.pdf
```

## Saving

After editing:
- `output/<company-slug>_<YYYY-MM-DD>.docx`
- `output/<company-slug>_<YYYY-MM-DD>.pdf` (converted)

Keep the canonical `output/resume.docx` as the latest full build.

## Common pitfalls

- Editing `.docx` with plain-text tools (`sed`) destroys the file — `.docx` is a zipped XML bundle.
- Copy-pasting from PDF or a web page imports invisible styles. If the Word doc behaves oddly after a paste, clear formatting: Home → Clear All Formatting, then re-apply styles.
- Track-changes enabled leaves redlines visible to the recruiter. Accept/reject all changes and turn off tracking before saving the final.
