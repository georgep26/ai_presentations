# Reveal.js Presentations

This guide covers creating interactive HTML presentations with Reveal.js in Quarto.

## Basic Setup

```yaml
---
title: "My Presentation"
format:
  revealjs:
    slide-number: true
    toc: true
    incremental: true
---
```

## Fragments (Incremental Reveals)

Show content progressively:

```markdown
- Point 1 {.fragment}
- Point 2 {.fragment}
- Point 3 {.fragment}
```

Or use the `incremental: true` option in YAML to make all lists incremental by default.

## Columns

Create two-column layouts:

```markdown
::: {.columns}
::: {.column width="50%"}
**Left Column**

Content here.
:::

::: {.column width="50%"}
**Right Column**

More content.
:::
:::
```

## Backgrounds

Set slide backgrounds:

```markdown
## Slide with Image Background {background-image="image.jpg"}

Content here.
```

Background options:
- `background-image`: Image URL
- `background-color`: Color (e.g., `#ff0000`)
- `background-size`: `cover`, `contain`, etc.
- `background-position`: `center`, `top`, etc.

## Themes

Built-in themes:

```yaml
format:
  revealjs:
    theme: default    # or dark, moon, etc.
```

Or use a custom theme:

```yaml
format:
  revealjs:
    theme: [default, custom.scss]
```

## Presenter View

Access presenter view:
- Press `S` during presentation
- Shows current slide, next slide, timer, and notes
- Share screen with audience while viewing presenter mode

## Keyboard Shortcuts

- `Space` or `→`: Next slide
- `←`: Previous slide
- `Home`: First slide
- `End`: Last slide
- `F`: Fullscreen
- `S`: Presenter mode
- `Esc`: Overview mode
- `B`: Pause/black screen
- `?`: Show help

## Code Execution

Execute code during presentation (if using R or Python):

````markdown
```{python}
#| echo: true
print("Hello from Python!")
```
````

## Math

LaTeX math support:

```markdown
Inline: $E = mc^2$

Block:
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$
```

## Transitions

Set slide transitions:

```yaml
format:
  revealjs:
    transition: slide    # or fade, none, etc.
```

## Callouts

Use callouts for emphasis:

```markdown
::: {.callout-note}
## Note
Important information here.
:::

::: {.callout-warning}
## Warning
Be careful with this.
:::

::: {.callout-tip}
## Tip
Helpful suggestion.
:::
```

## Custom CSS

Add custom styling:

```yaml
format:
  revealjs:
    theme: [default, custom.scss]
```

Or include CSS in the document:

```markdown
```{=html}
<style>
.custom-class {
  color: blue;
}
</style>
```
```

## Best Practices

1. **Use fragments** for progressive disclosure
2. **Include speaker notes** for all key slides
3. **Test presenter view** before presenting
4. **Keep slides simple** - one main idea per slide
5. **Use high contrast** for readability
6. **Test on different screens** before presenting

## Next Steps

- Learn about [PowerPoint export](02_presentations_pptx.html)
- Explore [project structure](03_project_structure.html)

