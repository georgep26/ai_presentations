# AI Agent Guide

This guide is the entry point for AI editors (Cursor, Copilot, etc.) working with this Quarto AI Slides repository.

## What This Repo Does

This repository provides a scaffolded environment for creating presentations with Quarto. It includes:
- Templates for Reveal.js (HTML), PowerPoint (PPTX), and Beamer (PDF)
- Example decks demonstrating best practices
- GitHub Pages automation for publishing
- AI editor integrations (Cursor slash commands, Copilot prompts)

## Format Selection: When to Use What?

### Reveal.js (HTML)
**Use when:**
- Presenting in a browser or online
- Need interactive features (code execution, animations)
- Want to publish to GitHub Pages
- Need presenter view with notes

**Template**: `templates/revealjs-minimal.qmd`

### PowerPoint (PPTX)
**Use when:**
- Need to share editable slides with non-technical stakeholders
- Presenting in corporate environments requiring .pptx format
- Need to integrate with existing PowerPoint workflows

**Template**: `templates/pptx-minimal.qmd`

### Beamer (PDF)
**Use when:**
- Need a PDF output for printing or archival
- Presenting in academic or formal settings
- Want LaTeX-quality typography

**Template**: `templates/beamer-minimal.qmd`

## Workflows

### Scaffold: `new-deck`

Create a new presentation deck from a template.

**Cursor**: Use `/new-deck` slash command
**Copilot**: Use the `new-deck` prompt from `copilot/prompt.md`

**Process:**
1. User provides: deck name (slug), template type, title, author
2. Create `examples/deck-{slug}/index.qmd` from selected template
3. Update YAML front-matter with provided metadata
4. Print next steps for rendering and publishing

**Example:**
```
new-deck slug=weekly-sync template=executive-summary title="Weekly Sync" author="Team Alpha"
```

### Edit: `edit-deck`

Edit or extend an existing Quarto presentation.

**Cursor**: Use `/edit-deck` slash command
**Copilot**: Use the `edit-deck` prompt from `copilot/prompt.md`

**Process:**
1. Read the current `.qmd` file
2. Follow house style guidelines (see below)
3. Improve structure, fix YAML, add slides/notes
4. If user mentions "Executive Summary", ensure Overview/Updates/Risks slides exist

### Publish: `publish-deck`

Publish the current deck to appropriate format.

**Cursor**: Use `/publish-deck` slash command
**Copilot**: Use the `publish-deck` prompt from `copilot/prompt.md`

**Process:**
1. Inspect YAML front-matter to determine format
2. **If `format.revealjs`**: Render site, ensure `project.output-dir: docs` or gh-pages workflow exists
3. **If `format.pptx`**: Run `quarto render path/to/index.qmd --to pptx`
4. **If `format.beamer` or PDF**: Run `quarto render path/to/index.qmd --to pdf` (requires LaTeX)
5. Report output location/URL

## House Style

### Headings
- Use `##` for slide titles (level 2)
- Use `###` for subsections within slides
- Keep titles concise and action-oriented

### Fragments
Use `{.fragment}` for incremental reveals:
```markdown
- Point 1 {.fragment}
- Point 2 {.fragment}
- Point 3 {.fragment}
```

### Callouts
Use Quarto callouts for emphasis:
```markdown
::: {.callout-note}
Important information here.
:::
```

### Speaker Notes
Always include speaker notes for key slides:
```markdown
::: notes
Additional context, links, or talking points.
:::
```

### Executive Summary Pattern
If creating an Executive Summary deck, include these sections:
1. **Project Overview** - Background, objectives, team
2. **Project Updates** - Progress, next steps
3. **Risks** - Identified risks with mitigations

See `templates/executive-summary.qmd` for the full pattern.

## Publishing

### Mode A: docs/ Directory (Default)
- Output directory: `docs/`
- GitHub Pages source: Branch `main` / Folder `docs`
- Workflow: `.github/workflows/render-and-publish.yml` renders to `docs/`
- **Use this by default** - it's simpler and works out of the box

### Mode B: gh-pages Branch
- Output branch: `gh-pages`
- GitHub Pages source: Branch `gh-pages` / Folder `/ (root)`
- Workflow: Uncomment the `publish` step in `.github/workflows/render-and-publish.yml`
- Requires `GITHUB_TOKEN` secret (automatically available)

**When to switch modes:**
- Mode A is recommended for most use cases
- Mode B if you need to keep rendered files out of main branch

## File Locations

- **Templates**: `templates/*.qmd`
- **Examples**: `examples/deck-*/index.qmd`
- **Guides**: `guides/*.md`
- **Configuration**: `_quarto.yml`
- **Workflows**: `.github/workflows/render-and-publish.yml`

## Reference Documentation

- `guides/00_quarto_basics.md` - Quarto fundamentals
- `guides/01_presentations_revealjs.md` - Reveal.js features
- `guides/02_presentations_pptx.md` - PowerPoint export
- `guides/03_project_structure.md` - Repository organization
- `guides/05_ci_cd_github_actions.md` - Publishing setup
- `guides/90_troubleshooting.md` - Common issues

