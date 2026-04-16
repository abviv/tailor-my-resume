# ATS (Applicant Tracking System) Guidelines

Most postings flow through an ATS before a human sees the resume: **Workday, Greenhouse, Lever, iCIMS, Taleo, SuccessFactors, Bullhorn, BrassRing, JobVite, Ashby, SmartRecruiters**. Assume ATS screening unless the role is a fellowship, academic position, or executive search with a named recruiter.

## Parsing risk — what breaks ATS

1. **Multi-column layouts** — many ATS readers serialize columns top-to-bottom, mangling order.
2. **Text in headers / footers** — often ignored entirely. **Never put your contact info in the header/footer.**
3. **Tables for layout** — modern ATS handle simple tables, but nested or styled tables can blow up. Safe: 1-row-per-entry "invisible" tables. Unsafe: multi-row styled tables.
4. **Graphics, icons, images** — ignored or OCR'd badly. An icon for "phone" next to your number often drops the number.
5. **Text boxes, shapes, SmartArt** — skipped.
6. **PDF from images** (scanned) — unreadable without OCR.
7. **Uncommon fonts** — stick to widely-installed fonts (Arial, Helvetica, Calibri, Times, Garamond, Cambria, Georgia, Tahoma, Verdana). Avoid decorative or web-only fonts.
8. **Colour and shading** — mostly fine, but don't rely on colour to convey information.

## Safe layout rules

- **Single column** for the body.
- **Standard section headings**: *Summary, Experience, Education, Skills, Certifications, Publications, Awards*. ATS taxonomies map these; creative names ("Where I've been" instead of "Experience") may not map.
- **Reverse-chronological** within each section.
- **Dates**: use either `Mon YYYY – Mon YYYY` or `MM/YYYY – MM/YYYY` consistently. Avoid seasons ("Fall 2023") — ATS can't parse them reliably.
- **One job per entry** — don't bundle multiple roles under one employer without distinct dates.
- **Plain bullets** (`•` or `-`). Avoid emoji bullets or unusual glyphs.
- **File format**: upload the `.pdf` the ATS requests. If the system asks for `.docx` — send `.docx` (some older Taleo/iCIMS installs parse Word better than PDF). When in doubt, keep a clean `.docx` version ready.
- **File name**: `FirstName_LastName_Resume.pdf` or `FirstName_LastName_Company_Resume.pdf`. No spaces; ATS download pipelines sometimes choke.

## Keyword matching

Most ATS do **not** auto-reject based on keyword score alone — that's a popular myth. But recruiter search *inside* the ATS relies on keyword hits, so missing keywords = fewer recruiter views. Process:

1. Copy the posting's required-skills section.
2. Identify nouns (technologies, methodologies, credentials) and verbs (managed, designed, built, led).
3. For each keyword, either (a) it already appears in the tailored resume → leave it, or (b) it appears elsewhere in the master → promote it to this version, or (c) it doesn't exist in the master → **do not add**. Report the gap at the end.

Do **not** keyword-stuff — white-text-on-white, hidden fields, keyword lists at the bottom. Modern ATS flag these and some recruiters actively check PDF source.

## Acronyms — spell out on first use

An ATS search for "Machine Learning" may miss a résumé that only says "ML". Include both:
> *Led ML (machine learning) platform efforts …*

Or use the full term on first mention and abbreviate afterwards.

## Escape characters and encoding

- Avoid em-dashes if you're producing a Word doc that will be pasted into a web form — some forms strip them. Hyphens (`-`) or en-dashes (`–`) are safer.
- Use straight quotes (`"`) over curly quotes in Word — some forms mangle curly quotes.
- Export PDFs as "standard" text-based PDF, not as image or PDF/A if you can avoid it.

## LinkedIn alignment
If the ATS auto-pulls from LinkedIn (e.g., "Apply with LinkedIn"), keep titles, companies, and dates **identical** between the two. Mismatches flag recruiter attention — unhelpful for the wrong reasons.

## When the ATS is known

- **Workday**: prefers `.docx`. Auto-fills more reliably from Word than PDF.
- **Greenhouse / Lever**: both handle `.pdf` well.
- **Taleo** (older enterprise): strongly prefer `.docx`; single column; no tables.
- **iCIMS**: `.docx` or `.pdf` OK; avoid tables.
- **SuccessFactors / BrassRing**: `.docx` preferred.

If the posting mentions a specific ATS by name, optimize for that one.
