# Troubleshooting

Common issues and solutions when working with Quarto presentations.

## YAML Errors

### Symptom: "YAML parse error" or "Invalid YAML"

**Common causes:**
- Missing colons after keys
- Incorrect indentation
- Unclosed quotes
- Invalid characters

**Solution:**
1. Check YAML syntax in front matter
2. Use a YAML validator
3. Ensure proper indentation (spaces, not tabs)
4. Check for special characters that need escaping

**Example fix:**
```yaml
# Wrong
title: My "Presentation"

# Right
title: 'My "Presentation"'
# or
title: "My \"Presentation\""
```

## Missing Assets

### Symptom: Images or files not found

**Common causes:**
- Incorrect file paths
- Files not committed to repository
- Case sensitivity issues

**Solution:**
1. Use relative paths from the `.qmd` file
2. Check file exists: `ls path/to/file.png`
3. Verify case sensitivity (especially on Linux/Mac)
4. Ensure files are committed to git

**Example:**
```markdown
# If image is in same directory
![Caption](image.png)

# If image is in subdirectory
![Caption](images/logo.png)

# If image is in parent directory
![Caption](../assets/logo.png)
```

## LaTeX/PDF Issues

### Symptom: PDF rendering fails

**Common causes:**
- LaTeX not installed
- Missing LaTeX packages
- Font issues
- Math rendering problems

**Solution:**
1. Install LaTeX:
   - **macOS**: `brew install --cask mactex`
   - **Linux**: `sudo apt-get install texlive-full`
   - **Windows**: Install MiKTeX or TeX Live

2. Install TinyTeX (lightweight option):
   ```bash
   quarto install tool tinytex
   ```

3. Check for missing packages in error messages
4. Simplify math expressions if needed

### Symptom: "Package X not found"

**Solution:**
```bash
# For TinyTeX
tlmgr install <package-name>

# For full LaTeX
# Install via package manager or tlmgr
```

## GitHub Pages Not Updating

### Symptom: Changes pushed but site unchanged

**Solutions:**
1. **Check Actions tab:**
   - Ensure workflow completed successfully
   - Look for errors in logs

2. **Verify Pages settings:**
   - Settings → Pages
   - Correct branch (main) and folder (publish)
   - Save if needed

3. **Wait and refresh:**
   - Deployment takes 1-2 minutes
   - Hard refresh browser (Ctrl+F5 / Cmd+Shift+R)
   - Clear browser cache

4. **Check file paths:**
   - Ensure `publish/` directory exists
   - Verify files were rendered

5. **Manual trigger:**
   - Actions → Render & Publish → Run workflow

## PowerPoint Export Issues

### Symptom: Layout not matching template

**Solutions:**
1. Verify template path in YAML:
   ```yaml
   format:
     pptx:
       reference-doc: templates/theme/brand.potx
   ```

2. Check template has required layouts
3. Test with a simple template first
4. Review [PowerPoint guide](02_presentations_pptx.html)

### Symptom: Images missing in PPTX

**Solutions:**
1. Use absolute or relative paths from `.qmd` file
2. Ensure images exist before rendering
3. Check file permissions
4. Use supported formats (PNG, JPG)

## Reveal.js Issues

### Symptom: Fragments not working

**Solutions:**
1. Check YAML has `incremental: true`:
   ```yaml
   format:
     revealjs:
       incremental: true
   ```

2. Or use explicit fragments:
   ```markdown
   - Item {.fragment}
   ```

### Symptom: Theme not applying

**Solutions:**
1. Verify theme name in YAML:
   ```yaml
   format:
     revealjs:
       theme: default
   ```

2. Check custom theme path if using one
3. Clear browser cache
4. Check browser console for errors

## Rendering Errors

### Symptom: "Command not found: quarto"

**Solution:**
1. Verify Quarto is installed: `quarto --version`
2. Check PATH includes Quarto
3. Restart terminal/editor
4. Reinstall if needed: `./quarto_install.sh`

### Symptom: "Error rendering document"

**Solutions:**
1. Check error message for specific issue
2. Render with debug: `quarto render --debug`
3. Check for syntax errors in `.qmd` file
4. Verify all dependencies installed
5. Try rendering a simple file first

## Code Execution Issues

### Symptom: Code blocks not executing

**Solutions:**
1. Check code block syntax:
   ````markdown
   ```{python}
   print("Hello")
   ```
   ````

2. Verify language engine installed (Python, R, etc.)
3. Check for errors in code
4. Use `#| echo: false` to hide code if needed

## Getting Help

1. **Check documentation:**
   - [Quarto Docs](https://quarto.org/docs/)
   - Guides in this repository

2. **Check error messages:**
   - Read full error output
   - Search error message online

3. **Minimal example:**
   - Create a simple `.qmd` file
   - Test if issue reproduces
   - Isolate the problem

4. **Community:**
   - [Quarto Discussions](https://github.com/quarto-dev/quarto/discussions)
   - [Quarto Discord](https://discord.gg/zJpKvGz)

## Common Fixes Checklist

- [ ] YAML syntax is valid
- [ ] All file paths are correct
- [ ] Required software is installed (Quarto, LaTeX if needed)
- [ ] Files are committed to git
- [ ] GitHub Actions workflow is running
- [ ] Pages settings are correct
- [ ] Browser cache is cleared
- [ ] Error messages are read fully

## Prevention Tips

1. **Test locally first:** Always run `quarto render` before pushing
2. **Use templates:** Start from working templates
3. **Version control:** Commit frequently to track changes
4. **Check Actions:** Monitor workflow runs
5. **Document customizations:** Note any special setup

