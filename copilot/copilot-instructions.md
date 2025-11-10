# Copilot Integration Instructions

This document explains how to use GitHub Copilot with this Quarto AI Slides repository.

## Setup

1. Ensure you have GitHub Copilot enabled in your editor (VS Code, Cursor, etc.)
2. Open this repository in your editor
3. Copilot will automatically reference `copilot/prompt.md` when working with Quarto files

## Usage in Copilot Chat

### Creating a New Deck

**In Copilot Chat, type:**
```
Create a new deck called weekly-sync using the executive-summary template
```

Copilot will:
- Read `templates/executive-summary.qmd`
- Create `examples/deck-weekly-sync/index.qmd`
- Set up the YAML front-matter
- Provide next steps

### Editing a Deck

**Open a `.qmd` file and ask Copilot:**
```
Add a slide about project risks after the updates section
```

or

```
Improve this presentation following the house style
```

Copilot will:
- Read the current file
- Apply house style guidelines
- Make improvements while preserving content

### Publishing a Deck

**Ask Copilot:**
```
How do I publish this deck?
```

or

```
Publish this presentation
```

Copilot will:
- Inspect the YAML format
- Provide format-specific publishing instructions
- Guide you through the process

## Usage in Copilot CLI

If using GitHub Copilot CLI:

1. Navigate to the repository
2. Use natural language commands:

```bash
# Create a new deck
copilot "create a new deck called product-launch using revealjs template"

# Edit current file
copilot "add speaker notes to all slides"

# Publish guidance
copilot "how do I publish this deck to GitHub Pages?"
```

## Key Concepts

Copilot understands:
- **Templates**: `revealjs`, `pptx`, `beamer`, `executive-summary`
- **House Style**: Fragments, callouts, notes, heading structure
- **Publishing**: GitHub Pages (Mode A), PPTX export, PDF export
- **Project Structure**: Where files belong (`examples/`, `templates/`)

## Reference

- See `copilot/prompt.md` for the full agent prompt
- See `AI_AGENT_GUIDE.md` for detailed workflows
- See `guides/` for Quarto documentation

## Tips

1. **Be specific**: "Create a deck called X using template Y" works better than "make a presentation"
2. **Reference existing files**: "Like the executive-summary example but for product updates"
3. **Ask for help**: "What templates are available?" or "How do I add fragments?"

