# PowerPoint (PPTX) Presentations

This guide covers exporting Quarto presentations to Microsoft PowerPoint format.

## Basic Setup

```yaml
---
title: "My Presentation"
format:
  pptx:
    reference-doc: templates/theme/brand.potx
---
```

## Reference Document

The `reference-doc` points to a PowerPoint template (`.potx` file) that defines:
- Slide layouts
- Color scheme
- Fonts
- Backgrounds
- Master slide design

### Creating a Template

1. Create your design in PowerPoint
2. Save as PowerPoint Template (`.potx`)
3. Place in `templates/theme/brand.potx`
4. Reference in YAML: `reference-doc: templates/theme/brand.potx`

## Layout Mapping

Quarto maps content to PowerPoint layouts:

- **Title slide**: First slide with `##` heading
- **Content slides**: Regular `##` headings
- **Two-column**: Uses column syntax (may need custom layout in template)

## Common Layout Tips

### Title Slide

```markdown
## Presentation Title

Subtitle or date
```

### Content Slides

```markdown
## Slide Title

- Bullet point 1
- Bullet point 2
- Bullet point 3
```

### Two Columns

```markdown
::: {.columns}
::: {.column width="50%"}
Left content
:::

::: {.column width="50%"}
Right content
:::
:::
```

**Note**: Two-column support depends on your template having a two-column layout.

## Images

```markdown
![Caption](path/to/image.png)
```

Images are embedded in the PPTX file.

## Tables

```markdown
| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |
| Cell 3   | Cell 4   |
```

Tables are converted to PowerPoint tables.

## Code Blocks

Code blocks are rendered as formatted text. For better results:
- Use monospace fonts in your template
- Consider using images for complex code

## Rendering

Render to PPTX:

```bash
quarto render presentation.qmd --to pptx
```

Or render the entire project (if configured):

```bash
quarto render
```

Output will be in the same directory as the source file.

## Template Best Practices

1. **Define layouts**: Create layouts for title, content, two-column, etc.
2. **Use placeholders**: PowerPoint placeholders help with positioning
3. **Consistent fonts**: Set fonts in the master slide
4. **Brand colors**: Define theme colors in the template
5. **Test rendering**: Render and check layout mapping

## Limitations

- **Animations**: Not supported (use Reveal.js for animations)
- **Fragments**: Not supported (all content appears at once)
- **Speaker notes**: Converted to PowerPoint notes
- **Complex layouts**: May require custom template layouts

## Troubleshooting

### Layouts Not Mapping Correctly

- Ensure your template has appropriate layouts
- Check that layout names match Quarto's expectations
- Consider creating custom layouts in your template

### Images Not Appearing

- Use relative paths from the `.qmd` file
- Ensure images exist before rendering
- Check file permissions

### Fonts Not Matching

- Set fonts in the PowerPoint template master slide
- Use fonts that are available on the target system

## Next Steps

- Learn about [project structure](03_project_structure.html)
- Explore [extensions and filters](04_extensions_and_filters.html)

