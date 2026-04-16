# Master Resume Schema

Use this to **bootstrap a `resume_mem.md`** (or equivalent) when the user doesn't have one yet. The skill will prompt the user through each section; don't ask every question at once — interview them in small batches.

## Why a master resume exists

The master is your **superset** of every bullet, skill, award, and role you might ever claim. It is **longer than any single résumé**, because the tailored résumé is a strict subset, trimmed to a specific role. Maintain truth in the master; tailor for fit in the output.

## Schema (Markdown)

```markdown
# Master Resume — <Full Name>

## Contact
- **Name:** Full Legal Name (and preferred name if different)
- **Role/Title:** (what you call yourself; may vary per target)
- **Location:** City, Country (and willing-to-relocate notes)
- **Email:** …
- **Phone:** (with country code)
- **LinkedIn:** …
- **GitHub / portfolio / personal site:** … (if applicable)
- **ORCID / Scholar:** … (for academics)
- **Nationality / work authorization:** (only include if relevant to the application)

---

## Summary variants

Keep 2–4 variants of a 3–4 line summary, each tuned to a different target type.
Each is a self-contained paragraph so the skill can pick one without splicing.

### Variant: <type-tag>  e.g., "research-focused"
[paragraph here]

### Variant: <type-tag>  e.g., "industry-ml-applied"
[paragraph here]

### Variant: <type-tag>  e.g., "systems-swe"
[paragraph here]

---

## Experience

For each role, include **every bullet you might ever use**, tagged. The tailored résumé will select a subset.

### <Job Title> — <Company>, <Location>
*<Start> – <End>*  [tags: #industry #function #seniority]

**Context one-liner** (optional): a sentence describing scope, team size, budget.

- [#tag1 #tag2] Bullet one, with numbers.
- [#tag1] Bullet two.
- [#tag3 #tag4] Bullet three.
- …

(Repeat for each role, in reverse-chronological order.)

---

## Education

### <Degree> in <Field> — <Institution>, <Location>
*<Start> – <End>*

- Thesis: "…" (advisor: Prof. …)
- Honors: …
- Relevant coursework: … (list up to ~6; skill will trim)
- GPA: … (if strong)

(Repeat for each degree.)

---

## Skills

Group by category. List skills the user can actually defend under interview pressure.

- **Languages:** …
- **Frameworks / libraries:** …
- **Infrastructure / cloud:** …
- **Tools:** …
- **Methodologies:** …
- **Domain knowledge:** …
- **Human languages:** … (with CEFR levels)

---

## Publications

List **all** publications here. The skill will select per role.
Use consistent formatting; include DOI/URL/venue.

- <Author list>. (<Year>). "<Title>." *<Venue>*. <DOI or URL>. [tags: #first-author #topic #venue-tier]

---

## Certifications

- **<Cert name>** — <Issuer>, <Date awarded>. <Registration #>, <status/expiry>. [tags: #industry]

---

## Awards & Honors

- **<Award>** — <Awarder>, <Year>. <Amount or selectivity if notable>. [tags: #industry]

---

## Talks & Presentations

(For academics / senior industry folks; optional otherwise.)

- *Invited:* "<Title>", <Venue>, <Year>.
- *Contributed:* "<Title>", <Venue>, <Year>.

---

## Grants & Funding

(Academic / research.)

- Role (PI/Co-PI/Contributor). "<Title>". <Agency>, <Grant ID>, <Amount>, <Dates>.

---

## Service

- Reviewer: …
- Committees: …
- Editorial: …

---

## Volunteering & Community

- <Role>, <Organization>, <Dates>. Brief one-liner.

---

## Projects (optional)

Only include if these strengthen your pitch for at least some target roles.

### <Project name>
- What, stack, outcome, link.

---

## Notes to the tailoring agent

Free-form notes: "always include X", "never mention Y for US applications", "prefer British spelling", "the role at Z was confidential — use '[Fortune-500 industrial]'".
```

## Tagging conventions

Tag liberally — the skill uses tags to filter. Common tag groups:

- **Industry**: `#tech`, `#finance`, `#consulting`, `#healthcare`, `#academia`, `#legal`
- **Function**: `#swe`, `#ml`, `#infra`, `#data`, `#pm`, `#research`, `#trading`, `#sales`
- **Seniority/signal**: `#senior`, `#lead`, `#leadership`, `#ic`
- **Topic**: `#distributed-systems`, `#llm`, `#motion-forecasting`, `#kubernetes`
- **Meta**: `#always-include` (pins this item), `#rarely-relevant` (exclude by default)

## Bootstrapping prompt (for the skill)

If the user has no master, walk through this in ~6 rounds:
1. "Tell me your contact info and the role you want to target first." → Contact + one summary variant
2. "Walk me through each role you've held, starting with the most recent." → Experience (gather all bullets, including ones that didn't fit past résumés)
3. "Degrees, certifications, and licensure?" → Education + Certs
4. "What tools and skills can you defend in an interview?" → Skills
5. "Any publications, awards, talks, grants?" → Those sections
6. "Anything else — volunteering, projects, notes on confidentiality?" → Wrap-up

Save the result to `resume_mem.md` at the project root, then proceed with the tailoring workflow.
