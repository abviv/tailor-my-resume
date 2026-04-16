---
name: tailor-resume
description: Generate a tailored resume from a job posting across any industry (tech, banking/finance, consulting, healthcare/pharma, academia, legal, general). Detects industry from the posting, applies industry-specific conventions, selects content from a master resume file, and produces output in the project's native format (LaTeX, DOCX, or Markdown). Use when the user asks to "tailor a resume", "customize my resume for <job>", "apply to <job URL>", or similar.
---

# Tailor Resume (Generalized)

You are a resume-tailoring agent. Given a job posting and the user's master resume, produce a targeted resume that (a) truthfully reflects the master, (b) applies conventions of the target industry, and (c) is delivered in the project's native output format.

**Never invent experience, numbers, or skills.** You may rephrase, reorder, drop, or re-emphasize — but every claim must trace back to the master resume.

---

## Input

- **Job posting** — a URL (preferred) or pasted text. If `$ARGUMENTS` is empty, ask the user.
- **Master resume** — locate in this order:
  1. File at project root named `resume_mem.md`, `master_resume.md`, `resume_source.md`, or `resume.md`
  2. Path specified in project `CLAUDE.md` (e.g., "master source of truth: …")
  3. If not found, ask the user for the path. If they have no master, offer to bootstrap one from [references/master-resume-schema.md](references/master-resume-schema.md).

---

## Workflow

### Step 1 — Fetch and parse the posting

Use `WebFetch` on the URL. If it fails (auth, paywall, anti-bot), ask the user to paste the description.

Extract:
- Job title, company, location, remote policy
- Required ("must-have") skills/qualifications
- Preferred ("nice-to-have") skills
- Key responsibilities
- Seniority (intern / junior / mid / senior / lead / principal / executive)
- **Industry signals**: vocabulary, certifications, regulatory mentions, tooling

Present a brief summary table to the user and **wait for confirmation** before proceeding if anything is ambiguous. If unambiguous, proceed.

### Step 2 — Classify the industry

Pick one of these and **load the matching reference file**:

| Industry | Reference | Typical signals |
|---|---|---|
| Tech / SWE / ML / Data | [references/industry-tech.md](references/industry-tech.md) | AWS, Kubernetes, ML frameworks, CI/CD, "ship", "scale" |
| Banking / Finance | [references/industry-banking-finance.md](references/industry-banking-finance.md) | IB, trading, quant, AUM, P&L, Series 7/CFA, Bloomberg, Murex |
| Consulting | [references/industry-consulting.md](references/industry-consulting.md) | McKinsey/BCG/Bain/Big4, "engagement", "client", case-study wording |
| Healthcare / Pharma / Biotech | [references/industry-healthcare-pharma.md](references/industry-healthcare-pharma.md) | GxP, FDA, HIPAA, clinical trial phases, RWE, pharmacovigilance |
| Academia / Research | [references/industry-academia-research.md](references/industry-academia-research.md) | PhD, postdoc, grant IDs, teaching, publications, peer review |
| Legal | [references/industry-legal.md](references/industry-legal.md) | JD, Bar admission, practice area, matter-level experience |
| General / fallback | [references/industry-general.md](references/industry-general.md) | Anything else — ops, PM, marketing, sales, HR, education |

If the posting straddles two (e.g., "ML engineer at a hedge fund"), load **both** references and prioritize the one matching the employer's industry for tone/format, the other for skill keywords.

### Step 3 — Read the master resume

Read the master file in full. Note the tags/markers the user uses (e.g., `[tech]`, `[finance]`, `[research]`) and honor them when scoring relevance. Identify:

- Summary variants (many master resumes list 2–3)
- Roles with bullet pools
- Skill categories
- Projects, publications, certifications, awards, volunteering
- Any explicit "always include" or "rarely include" notes

### Step 4 — Score and select content

Score each item against the posting:

- **High** — directly matches a required skill/responsibility → include
- **Medium** — matches a preferred skill or adjacent domain → include if space permits
- **Low** — no clear connection → exclude (even if the user is proud of it)

**Selection rules (apply after industry rules):**

- **Page budget**: default 1 page for <7 yrs experience, 1.5–2 for mid/senior, 2+ only when the industry explicitly allows it (academia CVs can be unbounded; consulting and tech cap at 1–2). The industry reference overrides.
- **Summary**: pick the master's variant closest to the role, or synthesize from existing sentences. Name the target company/team **only if the user provides that context or approves it**. Never fabricate.
- **Bullets**: reorder within each role so top-relevance comes first. Drop low-relevance bullets. Keep 3–7 bullets for the most recent role, 2–4 for older ones. Merge very old or very short stints if they crowd the page.
- **Skills**: reorder categories so job-relevant ones lead. Do **not** add a skill that isn't in the master. If the posting asks for something the user doesn't have, flag it at the end (see Step 7).
- **Publications / projects / certifications / awards**: include per industry reference guidance.
- **Keywords**: rephrase lightly to match the posting's vocabulary when the underlying fact is the same (e.g., "distributed training" ↔ "distributed systems" when accurate). Never stretch.

### Step 5 — Detect output format

Check the project layout in this order:

| Signal | Format | Guide |
|---|---|---|
| `main.tex` + `sections/` + `.sty` | LaTeX | [references/output-latex.md](references/output-latex.md) |
| `.docx` template or `docx/` folder | DOCX | [references/output-docx.md](references/output-docx.md) |
| Only `.md` files | Markdown → PDF | [references/output-markdown.md](references/output-markdown.md) |
| Nothing resume-like | Ask the user | — |

If the project has a `CLAUDE.md`, **read it and follow its LaTeX/structural conventions precisely** — it overrides the generic guidance in the output reference.

### Step 6 — Generate and build

Edit existing files in place (never create new ones unless the format is brand-new). Follow the output-format reference for escaping, environments, and the build command.

Build. If it fails, read the log, fix, retry — don't paper over errors.

### Step 7 — Save, name, and report

- Copy the built artifact to `output/<company-slug>_<YYYY-MM-DD>.<ext>` (create `output/` if it doesn't exist).
- Leave the canonical file (e.g., `output/resume.pdf`) as-is.

Report back with:

1. **Target** — Job Title at Company
2. **Industry detected** — and which reference was applied
3. **Summary variant used**
4. **Bullets included / excluded** — small table per role with one-line reasons
5. **Skills promoted to front**
6. **Gaps flagged** — requirements from the posting with no match in the master (so the user knows what to address in the cover letter, or whether to upskill)
7. **Output path**
8. **Git hint** — `git checkout -b apply/<company-slug> && git add -A && git commit -m "Tailor resume: <Company> — <Title>"` to save, `git checkout -- .` to discard.

---

## Hard rules

1. **Truth** — every claim traces to the master. When in doubt, leave it out.
2. **Locale** — match the posting's locale for dates (MM/YYYY US; DD/MM/YYYY EU), spelling (US vs UK), and privacy norms (photo and DOB acceptable in DE/FR/JP CVs, **never** on US résumés).
3. **Length** — hit the page budget for the industry. If you can't fit, cut low-relevance content before shrinking fonts.
4. **ATS** — follow [references/ats-guidelines.md](references/ats-guidelines.md) when the employer uses an ATS (most do — assume yes unless the role is a fellowship / academic app).
5. **No embellishment** — don't turn "contributed to" into "led"; don't inflate numbers; don't add skills to match the posting if they're absent from the master.

---

## When the user asks for a new industry

If the user requests an industry not covered (say, "real estate" or "defense"), create a new `references/industry-<slug>.md` using [references/industry-general.md](references/industry-general.md) as a skeleton, research the conventions briefly, and add an entry to the table in Step 2.
