# Quarto Basics

This guide covers the fundamentals of working with Quarto for presentations.

## Installation

Install Quarto using the provided script:

```bash
./quarto_install.sh
```

Or install manually:
- **macOS**: `brew install quarto`
- **Windows**: `choco install quarto`
- **Linux**: Download from [quarto.org](https://quarto.org/docs/get-started/)

Verify installation:

```bash
quarto --version
```

## Front Matter (YAML)

Every Quarto presentation starts with YAML front matter:

```yaml
---
title: "My Presentation"
author: "Your Name"
date: today
format:
  revealjs:
    slide-number: true
---
```

Key fields:
- `title`: Presentation title
- `author`: Author name
- `date`: Date (use `today` for current date)
- `format`: Output format and options

## Headings Create Slides

In Quarto, headings automatically create slides:

```markdown
## Slide Title

Content here.

## Another Slide

More content.
```

- `##` (level 2) creates a new slide
- `###` (level 3) creates a subsection within a slide
- `####` (level 4+) creates nested subsections

## Speaker Notes

Add speaker notes that won't appear on slides but will be visible in presenter mode:

```markdown
## My Slide

Content visible to audience.

::: notes
This is only visible in presenter mode.
Add talking points, links, or reminders here.
:::
```

## Rendering

Render a single file:

```bash
quarto render path/to/presentation.qmd
```

Render the entire project:

```bash
quarto render
```

Render to specific format:

```bash
quarto render presentation.qmd --to pptx
quarto render presentation.qmd --to pdf
```

## Output Formats

- **Reveal.js** (`revealjs`): HTML presentations for web
- **PowerPoint** (`pptx`): Microsoft PowerPoint format
- **Beamer** (`beamer`): PDF presentations using LaTeX

## Common Patterns

### Lists

```markdown
- Item 1
- Item 2
- Item 3
```

### Code Blocks

````markdown
```python
def hello():
    print("Hello, Quarto!")
```
````

### Images

```markdown
![Caption](path/to/image.png)
```

### Links

```markdown
[Link text](https://example.com)
```

## Next Steps

- Learn about [Reveal.js features](01_presentations_revealjs.html)
- Learn about [PowerPoint export](02_presentations_pptx.html)
- Explore [project structure](03_project_structure.html)

