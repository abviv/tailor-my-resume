# README and Contributing Design

## Objective

Improve the repository's onboarding copy without changing its informal, personal tone. The current README introduction should read more clearly while preserving the author's first-person voice and intent. The repo should also provide a dedicated contribution guide for people who want to request additional resume templates.

## Scope

In scope:

- Rephrase the introductory paragraph in `README.md`.
- Keep the writing personal, direct, and lightly informal rather than rewriting it into generic product copy.
- Add a new `CONTRIBUTING.md` focused on how to request specific templates through GitHub issues.
- Link the contribution guide from `README.md`, ideally near the existing multi-template section so readers find it where template expansion is already discussed.

Out of scope:

- Changing the tailoring workflow.
- Broad README restructuring outside the affected intro and contribution link.
- Adding general PR, code-style, or development-process contribution policies unless needed for template requests.

## Constraints

- Preserve the repo's existing voice: personal, practical, and slightly scrappy.
- Improve grammar, readability, and structure.
- Keep the contribution path concrete: open an issue, describe the requested template, and provide the details needed to evaluate it.
- Do not over-formalize the contribution guide; it should stay lightweight and approachable.

## Approach Options Considered

### Option 1: Personal intro plus dedicated contribution guide

Rewrite the README intro into a cleaner first-person paragraph and add a separate `CONTRIBUTING.md` for template requests.

Pros:

- Keeps the strongest part of the repo's identity: the author's direct motivation.
- Makes the README easier to read without flattening its voice.
- Gives template requests a durable home without bloating the README.

Cons:

- Adds one more top-level file.

### Option 2: Productized intro plus broader contribution guide

Rewrite the intro into more neutral project documentation and create a general contribution guide.

Pros:

- More polished and conventional.

Cons:

- Loses the personality that currently differentiates the project.
- Introduces more process than this repo needs right now.

## Decision

Use Option 1.

## Planned Changes

### `README.md`

- Replace the current opening paragraph with a clearer version that says:
  - one generic resume was not getting through ATS filters reliably,
  - `resume_mem.md` should contain the user's full professional history without filtering,
  - `/tailor-resume <job-posting-url>` uses that source plus the job posting to build a more targeted resume,
  - the closing sentiment stays modest and personal.
- Add a short contribution pointer that links to `CONTRIBUTING.md`.

### `CONTRIBUTING.md`

Create a compact guide that tells users to open a GitHub issue for template requests and include:

- the template name,
- upstream source or reference link,
- license or reuse status if known,
- screenshots or sample output if available,
- ATS-related reasons the template is worth supporting,
- any special layout or section requirements.

The guide should also set expectations that requests are easier to evaluate when they are concrete and compatible with the repo's active-template model.

## Testing and Validation

- Read the updated README introduction in place to confirm the tone still matches the repo.
- Verify the new contribution link points to `CONTRIBUTING.md`.
- Ensure the contribution guide is specific enough that a template request issue can be filed without follow-up clarification.

## Risks

- The intro could become too polished and lose the author's voice.
- The contribution guide could become too vague to produce actionable template requests.

Both risks are addressed by keeping the tone informal and the request checklist concrete.
