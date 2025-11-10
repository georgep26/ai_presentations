# CI/CD with GitHub Actions

This guide covers setting up automated rendering and publishing with GitHub Actions.

## Overview

The repository includes a GitHub Actions workflow (`.github/workflows/render-and-publish.yml`) that:
1. Renders all Quarto documents on push to `main`
2. Publishes to GitHub Pages automatically
3. Supports both Mode A (docs/) and Mode B (gh-pages)

## Mode A: docs/ Directory (Default)

**Recommended for most use cases.**

### Setup

1. **Workflow is already configured** in `.github/workflows/render-and-publish.yml`
2. **Configure GitHub Pages:**
   - Go to repository Settings → Pages
   - Source: **Branch: main**
   - Folder: **/docs**
   - Save

3. **Push to main branch:**
   ```bash
   git add .
   git commit -m "Update presentation"
   git push origin main
   ```

4. **Workflow runs automatically:**
   - Renders all `.qmd` files
   - Outputs to `docs/` directory
   - Deploys to GitHub Pages
   - The executive summary example will be available at `/examples/deck-executive-summary/`

### How It Works

```yaml
- name: Render project
  uses: quarto-dev/quarto-actions/render@v2
  with:
    path: .

- name: Deploy to GitHub Pages
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./docs
```

The `docs/` directory is committed to the main branch, and GitHub Pages serves from it.

## Mode B: gh-pages Branch (Optional)

**Use if you want to keep rendered files out of main branch.**

### Setup

1. **Modify workflow** (`.github/workflows/render-and-publish.yml`):
   - Comment out the `Deploy to GitHub Pages` step
   - Uncomment the `Publish to gh-pages` step

2. **Configure GitHub Pages:**
   - Go to repository Settings → Pages
   - Source: **Branch: gh-pages**
   - Folder: **/ (root)**
   - Save

3. **Push to main branch:**
   - Workflow creates/updates `gh-pages` branch automatically
   - GitHub Pages serves from `gh-pages` branch

### How It Works

```yaml
- name: Publish to gh-pages
  uses: quarto-dev/quarto-actions/publish@v2
  with:
    target: gh-pages
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

The workflow creates a `gh-pages` branch with rendered output.

## Workflow Triggers

The workflow runs on:
- **Push to main**: Automatic rendering on every push
- **Manual trigger**: Use "Run workflow" button in Actions tab

## Viewing Workflow Runs

1. Go to repository → **Actions** tab
2. Click on a workflow run to see:
   - Render logs
   - Deployment status
   - Any errors

## Common Issues

### Pages Not Updating

**Symptoms:** Changes pushed but site not updated

**Solutions:**
1. Check Actions tab for failed runs
2. Verify Pages settings (correct branch/folder)
3. Wait 1-2 minutes for deployment
4. Clear browser cache

### Render Failures

**Symptoms:** Workflow fails during render step

**Solutions:**
1. Check render logs in Actions
2. Verify YAML syntax in `.qmd` files
3. Check for missing dependencies
4. Test locally: `quarto render`

### Permission Errors

**Symptoms:** "Permission denied" or "GITHUB_TOKEN" errors

**Solutions:**
1. Ensure workflow has write permissions:
   - Settings → Actions → General
   - Workflow permissions: Read and write permissions
2. `GITHUB_TOKEN` is automatically available, no setup needed

## Manual Rendering

You can still render locally:

```bash
# Render everything
quarto render

# Render specific file
quarto render examples/deck-executive-summary/index.qmd

# Render to specific format
quarto render presentation.qmd --to pptx
```

## Best Practices

1. **Test locally first**: Run `quarto render` before pushing
2. **Check Actions**: Monitor workflow runs after pushing
3. **Use Mode A by default**: Simpler and works out of the box
4. **Commit rendered files**: In Mode A, commit `docs/` directory
5. **Document customizations**: Note any workflow modifications

## Advanced Configuration

### Conditional Rendering

Render only specific files:

```yaml
- name: Render project
  uses: quarto-dev/quarto-actions/render@v2
  with:
    path: examples/deck-executive-summary
```

### Multiple Formats

Render to multiple formats:

```yaml
- name: Render HTML
  uses: quarto-dev/quarto-actions/render@v2
  with:
    path: .
    to: revealjs

- name: Render PPTX
  uses: quarto-dev/quarto-actions/render@v2
  with:
    path: examples/deck-executive-summary
    to: pptx
```

### Custom Dependencies

Install additional dependencies:

```yaml
- name: Install dependencies
  run: |
    pip install some-package
    # or
    Rscript -e "install.packages('some-package')"
```

## Next Steps

- Check [troubleshooting guide](90_troubleshooting.html) for common issues
- Review [project structure](03_project_structure.html) for organization

