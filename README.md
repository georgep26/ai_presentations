# Quarto AI Slides

A scaffolded repository for creating beautiful presentations with Quarto, optimized for AI-assisted editing in Cursor and GitHub Copilot.

## Quick Start

### 1. Install Quarto

Run the installation script:

```bash
./quarto_install.sh
```

Or install manually:
- **macOS**: `brew install quarto`
- **Windows**: `choco install quarto`
- **Linux**: Download from [quarto.org](https://quarto.org/docs/get-started/)

### 2. Render the Site

```bash
quarto render
```

This will build all presentations and generate the site in the `docs/` directory.

### 3. Enable GitHub Pages

1. Go to your repository Settings → Pages
2. Set Source to: **Branch: main** / **Folder: docs**
3. Save and wait a few minutes for the site to deploy
4. Your site will be available at `https://[username].github.io/[repo-name]/`
5. The executive summary example is published at `https://[username].github.io/[repo-name]/examples/deck-executive-summary/`

## What's Included

- **Templates**: Ready-to-use Quarto presentation templates (Reveal.js, PowerPoint, Beamer)
- **Examples**: Sample decks demonstrating best practices
- **Guides**: Comprehensive documentation for Quarto presentations
- **AI Integration**: Cursor slash commands and Copilot prompts for AI-assisted editing

## For AI Editors

If you're an AI assistant (Cursor, Copilot, etc.), start with [`AI_AGENT_GUIDE.md`](AI_AGENT_GUIDE.md) for:
- Format selection (revealjs vs pptx vs beamer)
- Scaffold/edit/publish workflows
- House style guidelines
- Publishing modes

## Project Structure

```
quarto-ai-slides/
├── _quarto.yml          # Root Quarto configuration
├── README.md            # This file
├── AI_AGENT_GUIDE.md    # Entry point for AI editors
├── quarto_install.sh    # Cross-platform installation script
├── guides/              # Documentation guides
├── templates/           # Presentation templates
├── examples/            # Example decks
├── .github/workflows/   # CI/CD automation
├── .cursor/             # Cursor integration
└── copilot/             # Copilot integration
```

## Learn More

- [Quarto Documentation](https://quarto.org/docs/)
- [Reveal.js Guide](guides/01_presentations_revealjs.html)
- [PowerPoint Guide](guides/02_presentations_pptx.html)
- [Troubleshooting](guides/90_troubleshooting.html)
